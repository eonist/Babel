import argparse
import openai
from openai import OpenAIError
## from openai.error import OpenAIError
import json
import os
import sys
import time

def main():
    try:
        parser = argparse.ArgumentParser(description="Translate strings using OpenAI API.")
        parser.add_argument('--content', type=str, required=True, help='Content to translate.')
        parser.add_argument('--languages', type=str, required=True, help='JSON array of language codes.')
        parser.add_argument('--model', type=str, default='gpt-4', help='OpenAI model to use.')
        parser.add_argument('--instruction', type=str, default='', help='General instruction for translation.')
        args = parser.parse_args()

        # Parse languages with error handling
        try:
            languages = json.loads(args.languages)
            if not isinstance(languages, list):
                raise ValueError("Languages should be a JSON array of language codes.")
        except (json.JSONDecodeError, ValueError) as e:
            print(f"Error parsing languages: {e}")
            sys.exit(1)

        # Ensure content is not empty
        if not args.content.strip():
            print("Content to translate is empty.")
            sys.exit(1)

        # Set the OpenAI API key
        openai.api_key = os.environ.get("OPENAI_API_KEY")
        if not openai.api_key:
            raise ValueError("OpenAI API key not found. Please set the OPENAI_API_KEY environment variable.")

        translations = {}
        total_tokens_used = 0

        for language in languages:
            prompt = (
                f"{args.instruction}\n"
                f"Translate the following content into {language}:\n\n"
                f"{args.content}\n\n"
                "Provide the translation in the same format."
            )

            MAX_RETRIES = 3

            for attempt in range(MAX_RETRIES):
                try:
                    response = openai.create_chat_completion(
                        model=args.model,
                        messages=[{"role": "user", "content": prompt}],
                        temperature=0.3,
                    )
                    translated_text = response['choices'][0]['message']['content'].strip()
                    translations[language] = translated_text

                    # Accumulate token usage
                    total_tokens_used += response['usage']['total_tokens']

                    break  # Exit the retry loop if successful
                except OpenAIError as e:
                    if attempt < MAX_RETRIES - 1:
                        wait_time = 2 ** attempt
                        print(f"Error: {e}. Retrying in {wait_time} seconds...")
                        time.sleep(wait_time)  # Exponential backoff
                        continue
                    else:
                        print(f"Translation failed after {MAX_RETRIES} attempts: {e}")
                        sys.exit(1)

        # Save translations to file
        with open('translations.json', 'w', encoding='utf-8') as f:
            json.dump(translations, f, ensure_ascii=False, indent=2)

        # Output token usage
        with open('num_of_languages.txt', 'w') as f:
            f.write(str(len(translations)))

        with open('tokens_count_used.txt', 'w') as f:
            f.write(str(total_tokens_used))

    except Exception as e:
        print(f"An error occurred: {e}")
        sys.exit(1)

if __name__ == "__main__":
    main()


    