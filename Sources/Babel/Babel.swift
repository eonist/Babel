import SwiftUI

// Convenient localization string extension 
extension String {
    public func localized(comment: String = "", bundle: Bundle = .module) -> String {
        NSLocalizedString(self, bundle: bundle, comment: comment)
    }
}

// Helper function to access localization bundles
public func localizationBundle(forLanguage language: String) -> Bundle? {
   if let path = Bundle.module.path(forResource: language, ofType: "lproj") {
      return Bundle(path: path)
   } else {
      return nil
   }
}

// Example usage
if let frenchBundle = localizationBundle(forLanguage: "fr") {
    print(NSLocalizedString("hello_world_key", bundle: frenchBundle, comment: ""))
}

// Test that things work
#Preview {
    VStack {
        Text("greeting_key", bundle: .module) // use your babel translations
            .environment(\.locale, Locale(identifier: "en")) // shows English translation
        Text("hello_world_key".localized(bundle: localizationBundle(forLanguage: "fr") ?? .module))
        Text("hello_world_key".localized()) // use your babel translations
            .environment(\.locale, Locale(identifier: "de")) // shows German translation
    }
}