[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) 
[![Platforms](https://img.shields.io/badge/Platforms-iOS%20%7C%20macOS-blue.svg)]() 
[![Swift 5.9](https://img.shields.io/badge/Swift-5.9-orange.svg?style=flat)]() 
[![Operational](https://github.com/eonist/Babel/actions/workflows/main.yml/badge.svg)](https://github.com/eonist/Babel/actions/workflows/main.yml)

# Babel

> Automatic AI language localization

<img width="256" alt="img" src="https://i.imgur.com/jIFdqFm.jpeg?raw=true">

## Table of Contents

- [Description](#description)
- [Features](#features)
- [Problem](#problem)
- [Solution](#solution)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Obtain OpenAI API Key](#obtain-openai-api-key)
- [Obtain Slack Webhook](#obtain-slack-webhook)
- [Add Secrets to Repository Settings](#add-secrets-to-repository-settings)
- [Alternative Solutions](#alternative-solutions)
- [Support](#support)
- [License](#license)

### Description:

Babel automates the translation of your app's strings into multiple languages using OpenAI's GPT models and GitHub Actions. By updating your `Localizable.strings` file and pushing changes to your repository, Babel triggers a workflow that translates the strings, performs unit tests, and notifies you via Slack upon completion. This seamless integration allows your app to automatically include the latest localizations via Swift Package Manager (SPM), streamlining the deployment process.

### Features:

- 🔑 **Bring Your Own OpenAI Key**: Use your personal OpenAI API key for secure and controlled access.
- 🚀 **Automatic Translations on Push**: Trigger translations effortlessly every time you push updates.
- 💰 **Cost-Efficient Token-Based Pricing**: Pay only for what you use; the first $5 is covered by OpenAI.
- 🌍 **Supports All Languages**: Translate into any number of languages, from one to hundreds.
- ✅ **Built-In Unit Tests**: Ensure reliability with comprehensive automated testing.
- 🔔 **Slack Notifications on Completion**: Receive instant updates on translation status directly in Slack.
- 📦 **Automatic Inclusion in Your App**: Translations are seamlessly included in your app projects that import the Babel SPM package fork. Auto-deploy to production at your own discretion.


### Problem:

1. 📝 Manually translating your `Resources/en.lproj/Localizable.strings` file into multiple languages is tedious and time-consuming.
2. 🐛 Manual processes are error-prone and inefficient.
3. 🔄 Frequent translation updates require developers to maintain the pipeline, limiting who can manage translations.

### Solution:

1. 🤖 Leverage the power of OpenAI models, like GPT-3.5 and GPT-4, to automatically translate into one or hundreds of languages at scale.
2. 🧪 Integrate comprehensive language unit tests to ensure translations are reliable, receive Slack notifications upon success or failure, and block deployments if necessary.
3. 🦑 With Babel existing in its own fork, even non-developers can edit plain text and commit changes. Babel handles the rest, provided you have set up automatic deployments for the App Store or other platforms.


### Prerequisites

- **GitHub Account**: Ensure you have a GitHub account to fork repositories and set up actions.
- **OpenAI Account**: Sign up for an OpenAI account and obtain an API key.
- **Slack Workspace**: Have access to a Slack workspace where you can add apps and receive notifications.
- **Xcode 15 or Later**: Required for Swift 5.9 and iOS 17 / macOS 14 development.

### Installation:

1. **Fork the Repository**

   Fork the [Babel repository](https://github.com/eonist/Babel) to your own GitHub user or organization.

2. **Set Up Secrets**

   Obtain your `OPENAI_API_KEY` and `SLACK_WEBHOOK_URL` (see [Obtain OpenAI API Key](#obtain-openai-api-key) and [Obtain Slack Webhook](#obtain-slack-webhook)) and add them as secrets in your repository settings (see [Add Secrets to Repository Settings](#add-secrets-to-repository-settings)).

3. **Add Babel to Your Project**

   Add the Babel Swift Package to your app project by specifying your forked repository URL: `https://github.com/your-user-name/Babel`.

4. **Configure Target Languages**

   Edit the `.github/workflows/main.yml` file to include your desired languages:

   ```yaml
   languages = ["es", "fr", "de"]  # Modify as needed: "Spanish" (es), "French" (fr), "German" (de)
   ```

5. **Set Up Automated Releases (Optional)**

   For automatic inclusion of translations via Swift Package Manager (SPM), set up periodic daily releases to app-store in your repository settings.

### Example:

**In your app:**
```swift
import Babel

#Preview {
   VStack {
      Text("greeting_key".localized()) // Use your Babel translations
            .environment(\.locale, Locale(identifier: "en")) // Shows English translation

      Text("hello_world_key".localized(bundle: localizationBundle(forLanguage: "fr") ?? .module))
            .environment(\.locale, Locale(identifier: "fr")) // Shows French translation

      Text("farewell_key".localized())
            .environment(\.locale, Locale(identifier: "de")) // Shows German translation
   }
}
```

**Your main `Localizable.strings` file:**

`Resources/en.lproj/Localizable.strings`

**With content:**

```README.md
"hello_world_key" = "Hello, World!";
"greeting_key" = "Welcome to our app!";
"farewell_key" = "Thank you for using our app!";
```

Add desired languages to the `.github/workflows/main.yml` file:
```yml
languages = ["es", "fr", "de"] # Modify as needed "Spanish", "French", "German"
```

After running the workflow, the translations will be generated in:

```
Resources/es.lproj/Localizable.strings
Resources/fr.lproj/Localizable.strings
Resources/de.lproj/Localizable.strings
```

### Obtain OpenAI API Key

Follow these steps to get your OPENAI_API_KEY:

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

> **Note:**
> - Keep your Webhook URL secret, as it contains sensitive information.
> - For GovSlack apps, use the `slack-gov.com` domain instead of `slack.com`.
> - Customize webhook settings and message formatting as needed.

## Add secrets to repo settings:

To add the secrets to a GitHub repository, follow these steps:

1. Navigate to your repository on GitHub.
2. Click on the "Settings" tab near the top of the page.
3. In the left sidebar, under the "Security" section, click on "Secrets and variables," then select "Actions."
4. Click on the "New repository secret" button.
5. Enter a name for your secret in the "Name" field.
6. In the "Value" field, enter the secret value you want to store.
7. Click "Add secret" to save your new repository secret. (SLACK_WEBHOOK_URL and OPENAI_API_KEY)

> **Important Notes:**
>
> - Secrets are encrypted and only exposed to selected actions during runtime.
> - Repository secrets are only accessible to repository collaborators.
> - Avoid storing sensitive information directly in your repository code or GitHub Actions workflow files.
> - You can update or remove secrets from the same settings page if needed.

## Alternative solutions: 

- [https://crowdin.com](https://crowdin.com) 
- [https://phrase.com](https://phrase.com) 
- [https://lokalise.com/](https://lokalise.com/) 

## Support

If you encounter any problems or have questions, feel free to [open an issue](https://github.com/your-user-name/Babel/issues) on GitHub.
