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

**1. Trigger the github action flow:**  
<img width="324" alt="img" src="https://i.imgur.com/vhjjFMK.gif?raw=true">

**2. Get notified on Slack:**  
<img width="472" alt="img" src="https://i.imgur.com/muWodFY.gif?raw=true">

**3. Translations go live in your app:**  
<img width="287" alt="img" src="https://i.imgur.com/cEB5DJU.gif?raw=true">

### Features:

- 🔑 **Bring Your Own OpenAI Key**: Use your personal OpenAI API key for secure and controlled access.
- 🚀 **Automatic Translations on Push**: Trigger translations effortlessly every time you push updates.
- 💰 **Cost-Efficient Token-Based Pricing**: Pay only for what you use; the first $5 is covered by OpenAI.
- 🌍 **Supports All Languages**: Translate into any number of languages, from one to hundreds.
- ✅ **Built-In Unit Tests**: Ensure reliability with comprehensive automated testing.
- 🔔 **Slack Notifications on Completion**: Receive instant updates on translation status directly in Slack.
- 📦 **Automatic Inclusion in Your App**: Translations are seamlessly included in your app projects that import the Babel SPM package fork. Auto-deploy to production at your own discretion.


### Problem:

- **Manual Translation is Tedious**: Translating `Localizable.strings` into multiple languages by hand is time-consuming.
- **Prone to Errors**: Manual processes can lead to inefficiencies and mistakes.
- **Developer Dependency**: Updates require developer involvement, limiting non-developers from managing translations.

### Solution:

- **Automated AI Translations**: Utilize OpenAI's GPT models to automatically translate strings at scale.
- **Integrated Testing & Notifications**: Include unit tests and receive Slack alerts upon completion or failure.
- **Empower Non-Developers**: With Babel's forked repository, non-developers can edit and commit changes; Babel automates the rest, supporting automatic deployments if set up.


### Prerequisites

- **GitHub Account**: Ensure you have a GitHub account to fork repositories and set up actions.
- **OpenAI Account**: Sign up for an OpenAI account and obtain an API key.
- **Slack Workspace**: Have access to a Slack workspace where you can add apps and receive notifications.
- **Xcode 15 or Later**: Required for Swift 5.9 and iOS 17 / macOS 14 development.

## Getting Started

Babel allows you to automate the localization of your iOS or macOS app using AI. Here's how to get up and running:

 

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

5. **Push changes to trigger the translation workflow**

   Edit the "key words" you want to localize in any text editor: `Sources/Babel/Resources/Localizable.strings` push the changes with terminal or github desktop. You can also edit key words directly on github.com and the translations will be triggered on save. 

6. **Set Up Automated Releases (Optional)**

   For automatic inclusion of translations via Swift Package Manager (SPM), set up periodic daily releases to app-store in your apps github action workflow.

### Example:

**In your app:**
```swift
import Babel

#Preview {
   VStack {
      Text("greeting_key", bundle: .babelModule)  
         .environment(\.locale, Locale(identifier: "es")) 
      Text("hello_world_key".localized(bundle: localizationBundle(forLanguage: "de") ?? .babelModule))
      Text("farewell_key".localized(langCode: "fr"))  
   }
}
```

**Your main `Localizable.strings` file:**

`Sources/Babel/Resources/en.lproj/Localizable.strings`

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
Sources/Babel/Resources/es.lproj/Localizable.strings
Sources/Babel/Resources/fr.lproj/Localizable.strings
Sources/Babel/Resources/de.lproj/Localizable.strings
```

### Obtain OpenAI API Key

Follow these steps to get your `OPENAI_API_KEY`:

1. Visit [platform.openai.com](https://platform.openai.com) and log in or sign up.

2. Click on your profile icon in the top-right corner and select **"View API keys"**.

3. Click the **"Create new secret key"** button.

4. **Copy and securely store your API key immediately**, as it won't be shown again.

> [!NOTE]
> Ensure you've added a payment method in your account settings. It's recommended to use separate keys for different applications to enhance security.

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

> [!NOTE]
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


> [!IMPORTANT]
> - Secrets are encrypted and only exposed to selected actions during runtime.
> - Repository secrets are only accessible to repository collaborators.
> - Avoid storing sensitive information directly in your repository code or GitHub Actions workflow files.
> - You can update or remove secrets from the same settings page if needed.

## Alternative solutions: 

- [https://crowdin.com](https://crowdin.com) $151 per month (team plan 100k words)
- [https://phrase.com](https://phrase.com) $135 per month (200k words)
- [https://lokalise.com/](https://lokalise.com/) $120 per month (5k keys)

> [!NOTE]
> - Babel is based on token price. (An avarage usecase should cost 0.01$ - 1$ per month)
> - 5k words to 10 languages: with gpt-4-turbo: $0.267 * 10 = $2.67
> - 5k words to 10 languages: with gpt-3.5-turbo: $0.015 * 10 = $0.15
> - Using other models from other providers could decrease cost significantly. (coming soon)
> - Only translating diff change will reduce running cost to near zero. (coming soon)

## Support

If you encounter any problems or have questions, feel free to [open an issue](https://github.com/eonist/Babel/issues) on GitHub.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
