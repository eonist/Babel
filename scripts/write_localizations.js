const fs = require('fs');
const path = require('path');

// Read the localization JSON data
const data = fs.readFileSync('localization.json', 'utf8');
const localizations = JSON.parse(data);

// Process each language
for (const [language, translations] of Object.entries(localizations)) {
  const lines = translations.map(item => {
    const [key, value] = Object.entries(item)[0];
    return `"${key}" = "${value}";`;
  });

  const content = lines.join('\n');
  const filename = `Localization-${language}.strings`;

  // Write the content to the file in the repository root
  fs.writeFileSync(path.join(process.cwd(), filename), content, 'utf8');

  console.log(`Created ${filename}`);
} 