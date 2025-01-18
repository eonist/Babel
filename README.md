# Babel

> Automatic AI language localisation

### Description:

Babel translates to the desired languages via github actions. Translations are handled automatically with your own open-ai api key, everytime you change `Localizable.strings` in your babel fork. Slack gets notified on completion. And your app loads the latest localisations automaticall via SPM if you setup periodical daily release. 

### Problem: 

1. Translating your `Localizable.strings` into every language is a pain
2. Manual processes are error prone. And time consuming.
3. Only devs can ensure pipeline works when new translations are needed (often) 

### Solution:

1. Use the power of OpenAI models, from gpt3.5 to o1 and beyond to auto translate 1 or 100s of languages at scale.
2. General language Unit-tests are included and makes sure translations are reliable. Get notified on slack if the translations succeeded or failed. And block deploys. 
3. Since Babel live in its own fork. Even non devs can edit clear text and hit the commit button. And babel takes care of the rest. This requires that you have setup auto deploying for the app-store etc. 

### Features:

- Bring your own Open-ai key
- Trigger translations on push
- Token based pricing. (First $5 is on OpenAI)
- Supports all languages (1..100s)
- Unit-tests built in
- Slack notification on complete

### Installation:

1. Fork `https://github.com/eonist/Babel` to your own github user / org
2. Obtain and add OPENAI_API_KEY, SLACK_WEBHOOK_URL in your repo-settings: 
3. Add the SPM package to your app project: `https://github.com/username/Babel` in your package or xcode project

### Example:

**In your app:**
```swift
import Babel

#Preview {
    Text("greeting_key", bundle: .module) // use your babel translations
        .environment(\.locale, Locale(identifier: "en") // shows English translation
    Text("hello_world_key".localized(bundle: localizationBundle(forLanguage: "fr") ?? .module))
    Text("hello_world_key".localized()) // use your babel translations
        .environment(\.locale, Locale(identifier: "ge") // shows German translation
}
```

**Your main localisation.strings file:**
`Resources/en.lproj/Localizable.strings`

**with content:**
```
"hello_world_key" = "Hello, World!";
"greeting_key" = "Welcome to our app!";
"farewell_key" = "Thank you for using our app!";
```

Add desired languages to the `.github/workflows/main.yml` file:
```yml
languages = ["es", "fr", "gr"] # Modify as needed "Spanish", "French", "German"
```

**Output on translation complete**
```
Resources/es.lproj/Localizable.strings
Resources/gr.lproj/Localizable.strings
Resources/fr.lproj/Localizable.strings
```

### Obtain OpenAI api key: 

To obtain an OpenAI API key, follow these steps:

1. Go to the OpenAI platform website (platform.openai.com) and sign in or create an account if you don't have one

2. Once logged in, click on your profile icon in the top-right corner of the page and select "View API keys"

3. On the API keys page, click the "Create new secret key" button

4. Optionally, give your API key a name to help you remember its purpose

5. Choose the appropriate permissions for the key (all, restricted, or read-only)

6. Click "Create secret key" to generate your new API ke

7. Copy the generated API key immediately and store it in a secure location, as you won't be able to view it again after closing the windo

Remember to set up a payment method in your account settings if you haven't already, as the API key won't work without a valid payment method on file It's also a good practice to use different keys for different applications to maintain better security and organization

### Obtain Slack webhock

To obtain a SLACK_WEBHOOK_URL, follow these steps:

1. Create a Slack App:
   - Go to the Slack API website and click "Create New App"
   - Name your app and select the workspace where you want to use it

2. Enable Incoming Webhooks:
   - In your app's dashboard, find the "Incoming Webhooks" section
   - Toggle the switch to activate Incoming Webhooks

3. Add a New Webhook:
   - Click "Add New Webhook to Workspace"
   - Select the channel where you want the webhook to post messages
   - Authorize the webhook for your workspace

4. Copy the Webhook URL:
   - After authorization, you'll see a unique Webhook URL generated for your app
   - This URL will look like: https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX
## Important Notes:

- Keep your webhook URL secret, as it contains sensitive information 
- For GovSlack apps, use the `slack-gov.com` domain instead of `slack.com` 
- You can customize webhook settings and message formatting as needed 

By following these steps, you'll have your SLACK_WEBHOOK_URL ready for integration with external services or applications.

