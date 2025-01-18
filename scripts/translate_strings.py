import os
import openai
import json
import re

# Set OpenAI API key
openai.api_key = os.environ.get('OPENAI_API_KEY')

# Define the languages to translate into
languages = ["Spanish", "French", "German"]  # Add or modify languages as needed

# Read the content of Localizable.strings
with open('Localizable.strings', 'r', encoding='utf-8') as file:
    content = file.read()

# Prepare the prompt
prompt = f"""
Translate the following content to languages: {', '.join(languages)}.
Return the translations in JSON dict format with language as key and value as an array of key-value pairs.
Each key-value pair should correspond to the original keys and their translated values.

The content format is lines like: "hello_world_key" = "Hello, World!";

Content:
{content}
"""


response = openai.ChatCompletion.create(
    model="gpt-3.5-turbo",
    messages=[
        {"role": "system", "content": "You are a helpful assistant that translates strings."},
        {"role": "user", "content": prompt}
    ]
)

translation_text = response['choices'][0]['message']['content'].strip()


# Attempt to parse the response as JSON
try:
    translations = json.loads(translation_text)
except json.JSONDecodeError:
    # If parsing fails, attempt to extract JSON using regex (in case of extra text)
    json_match = re.search(r'\{[\s\S]*\}', translation_text)
    if json_match:
        translations = json.loads(json_match.group())
    else:
        raise ValueError("Failed to parse JSON from OpenAI response.")

# Output the translations
print("Translations:")
print(json.dumps(translations, indent=2, ensure_ascii=False))

# Save the translations to a file
with open('translations.json', 'w', encoding='utf-8') as f:
    json.dump(translations, f, indent=2, ensure_ascii=False)


    