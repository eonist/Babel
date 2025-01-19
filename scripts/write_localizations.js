const fs = require('fs');
const path = require('path');

// Get the translations file path from command-line arguments
const translationsFilePath = process.argv[2];

if (!translationsFilePath) {
  console.error('Please provide the path to translations.json');
  process.exit(1);
}

try {
  // Read the localization JSON data
  const data = fs.readFileSync(translationsFilePath, 'utf8');
  const localizations = JSON.parse(data);

  // Process each language
  for (const [language, content] of Object.entries(localizations)) {
    const dirPath = `Sources/Babel/Resources/${language}.lproj`;
    const filePath = path.join(dirPath, 'Localizable.strings');

    // Create directory if it doesn't exist
    fs.mkdirSync(dirPath, { recursive: true });

    // Write the content to the localization file
    fs.writeFileSync(filePath, content, 'utf8');

    console.log(`Created ${filePath}`);
  }
} catch (error) {
  console.error(`An error occurred: ${error.message}`);
  process.exit(1);
}