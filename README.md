# Babel

> Automatic AI language localisation

### Description:

Babel automatically translates your app into desired languages using GitHub Actions. By providing your own OpenAI API key, translations are handled every time you update the `Resources/en.lproj/Localizable.strings` file in your Babel fork. Upon completion, a Slack notification is sent to inform you of the update. Additionally, your app will load the latest localizations automatically via Swift Package Manager (SPM) if you set up periodic daily releases.

### Features:

- 🔑 **Bring Your Own OpenAI Key**: Use your personal OpenAI API key for secure and controlled access.
- 🚀 **Automatic Translations on Push**: Trigger translations effortlessly every time you push updates.
- 💰 **Cost-Efficient Token-Based Pricing**: Pay only for what you use; the first $5 is covered by OpenAI.
- 🌍 **Supports All Languages**: Translate into any number of languages, from one to hundreds.
- ✅ **Built-In Unit Tests**: Ensure reliability with comprehensive automated testing.
- 🔔 **Slack Notifications on Completion**: Receive instant updates on translation status directly in Slack.

### Problem:

1. Manually translating your `Resources/en.lproj/Localizable.strings` file into multiple languages is tedious and time-consuming.
2. Manual processes are error-prone and inefficient.
3. Frequent translation updates require developers to maintain the pipeline, limiting who can manage translations.

### Solution:

1. Leverage the power of OpenAI models, like GPT-3.5 and GPT-4, to automatically translate into one or hundreds of languages at scale.
2. Integrate comprehensive language unit tests to ensure translations are reliable, receive Slack notifications upon success or failure, and block deployments if necessary.
3. With Babel existing in its own fork, even non-developers can edit plain text and commit changes. Babel handles the rest, provided you have set up automatic deployments for the App Store or other platforms.

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

### Obtain OpenAI API Key

Follow these steps to get your OpenAI API key:

1. Visit [platform.openai.com](https://platform.openai.com) and log in or sign up.

2. Click on your profile icon in the top-right corner and select "View API keys".

3. Click the "Create new secret key" button.

4. (Optional) Name your API key for easy identification.

5. Choose the desired permissions: all, restricted, or read-only.

6. Click "Create secret key" to generate your key.

7. Copy and securely store your API key immediately, as it won't be shown again.

> **Note:** Ensure you've added a payment method in your account settings. It's recommended to use separate keys for different applications to enhance security.

### Obtain Slack Webhook

Follow these steps to get your SLACK_WEBHOOK_URL:

1. **Create a Slack App:**
   - Visit the Slack API website and click "Create New App".
   - Name your app and choose the workspace to use it in.

2. **Enable Incoming Webhooks:**
   - In the app dashboard, go to "Incoming Webhooks".
   - Toggle the switch to activate Incoming Webhooks.

3. **Add a Webhook:**
   - Click "Add New Webhook to Workspace".
   - Select the channel for the webhook to post messages.
   - Authorize the webhook for your workspace.

4. **Copy the Webhook URL:**
   - After authorization, a unique Webhook URL will be generated.
   - It will look like: `https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX`

> **Important Notes**
> 
> - Keep your Webhook URL secret, as it contains sensitive information.
> - For GovSlack apps, use the `slack-gov.com` domain instead of `slack.com`.
> - Customize webhook settings and message formatting as needed.

By following these steps, you'll have your SLACK_WEBHOOK_URL ready for integration with external services or applications.


