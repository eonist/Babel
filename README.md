# Babel

Automatic AI language localisation

### Description:

Bable is a swift Package that you can load localised.string into your swift project. Babel translates to the desired languages via github actions. Translations are handled automatically with your own open-ai key, everytime you change localisation.strings in your babel fork.

### Problem: 

1. Ensuring consistensy in your localisation.strings files for every language is a pain
2. Manually converting languages in .strings files one by one with chatgpt is labourious
3. Language translations should be collaborative. But are stuck in the main project files. 

### Solution:

1. Pick the latest AI models from AI. from gpt3.5 to o1 and beyond. 
2. Let Ai do what is meant to do. Aleviate reptetive time consuming tasks.
3. Since Babel live in its own fork. Even non devs can edit clear text and hit commit. 

### Features:

- BYO openai-key (pick your own model)
- Free and Opensource
- Setup in less than a minute (1. Fork it, 2. Add openai-key, 3. Load SPM Package)
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

### Installation:

1. Fork github.com/eonist/Babel to your own github user / org
2. Store the your openai-key with the name: MY_SECRET in your repository settings.
3. Add the spm package to your app project: `github.com/username/Babel` in your package or xcode project


### Todo: 
- Add badge for platforms: WatchOS, iOS, VisionOS, MacOS
- Add unit-tests
- Add apples AI language translation kit to the unit tests, to double check language consistancy.



