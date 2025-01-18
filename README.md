# Babel

> Automatic AI language localisation

### Description:

Bable is a swift Package that you can load `localised.string` into your swift project. Babel translates to the desired languages via github actions. Translations are handled automatically with your own open-ai key, everytime you change `localisation.strings` in your babel fork.

### Problem: 

1. Ensuring consistensy in your `localisation.strings` files for every language is a pain
2. Manually converting languages in .strings files one by one with chatgpt is labourious
3. Language translations should be collaborative. But are stuck in the main project files. 

### Solution:

1. Pick the latest AI models from AI. from gpt3.5 to o1 and beyond. 
2. Let Ai do what is meant to do. Aleviate reptetive time consuming tasks.
3. Since Babel live in its own fork. Even non devs can edit clear text and hit the commit button. 

### Features:

- BYO openai-key (pick your own model)
- Free and Opensource
- Setup in less than a minute (1. Fork it, 2. Add secrets to prefs, 3. Load SPM Package)
- Override throny parts with translation interpolation
- Translate to 1 or 100 languages
- Dirt cheap. Pay as you go. In most cases near free
- Keep the package public or private. Public is great for community feedback on translations
- Publishes translation cost, and other tidbits to your desired slack channel
- Babel also runs automatic unit-tests to make sure all languages are correct

### Example:

**In your app:**
```swift
import Babel

#Preview {
  Text("your.string.key", bundle: .module) // use your babel translations
    .environment(\.locale, Locale(identifier: "es") // shows Spanish translation
}
```

**Your localisation.strings file:**
```
"hello_world_key" = "Hello, World!";
"greeting_key" = "Welcome to our app!";
"farewell_key" = "Thank you for using our app!";
```

### Languages:
Add desired languages to the .github/workflows/main.yml file:
```yml
languages = ["Spanish", "French", "German"]  # Modify as needed
```

### OpenAI prompt: 

```swift
  prompt = f"""
  Translate the following content to languages: {', '.join(languages)}.
  Return the translations in JSON dict format with language as key and value as an array of key-value pairs.
  Each key-value pair should correspond to the original keys and their translated values.

  The content format is lines like: "hello_world_key" = "Hello, World!";

  Content:
  {content}
  """
```

### Translation json from OpenAI:
```json
{
  "Spanish": [
    {
      "hello_world_key": "¡Hola, Mundo!"
    },
    {
      "another_key": "Otro valor"
    }
  ],
  "French": [
    {
      "hello_world_key": "Bonjour, le monde !"
    },
    {
      "another_key": "Une autre valeur"
    }
  ],
  "German": [
    {
      "hello_world_key": "Hallo, Welt!"
    },
    {
      "another_key": "Ein weiterer Wert"
    }
  ]
}
```

### Installation:

1. Fork github.com/eonist/Babel to your own github user / org
2. Store your secrets in the repo settings: OPENAI_API_KEY, GITHUB_SECRET, SLACK_SECRET
3. Add the spm package to your app project: `github.com/username/Babel` in your package or xcode project

### Obtain secrets:

- OpenAI -> admin.openai.com/api-secrets
- Slack -> slack.com/settings/token
- Github -> Github.com/username/reponame/settings/token

### Gotchas: 

- Ensure that the Localizable.strings file exists in the root directory of your repository or adjust the path accordingly.

### Todo: 

- Add badge for platforms: WatchOS, iOS, VisionOS, MacOS
- Add unit-tests
- Add apples AI language translation kit to the unit tests, to double check language consistancy.



