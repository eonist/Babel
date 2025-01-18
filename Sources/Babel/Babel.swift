import SwiftUI

extension String {
    public func localized(comment: String = "", bundle: Bundle = .module): String {
        NSLocalizedString(self, bundle: .module, comment: comment)
    }
}

// source: https://github.com/apple/swift-package-manager/pull/2535/files#diff-cc8e61e90b098f4e9ebc74503408eaa8
// ref: https://github.com/wendyliga/resource-spm
// If, for example, you want to access other language resources that are not the current default language on the client, you can access the respective language bundle.
// Here’s a little bit of a function helper:
func localizationBundle(forLanguage language: String) -> Bundle? {
   if let path = Bundle.module.path(forResource: language, ofType: "lproj") {
      return Bundle(path: path)
   } else {
      return nil
   }
}
if let indonesiaBundle = localizationBundle(forLanguage: "id") {
  print(NSLocalizedString("hello_world_key", bundle: indonesiaBundle, comment: ""))
}

#Preview {
    Text("greeting_key", bundle: .module) // use your babel translations
        .environment(\.locale, Locale(identifier: "en") // shows English translation
    Text("hello_world_key".localized(bundle: localizationBundle(forLanguage: "fr") ?? .module))
    Text("hello_world_key".localized()) // use your babel translations
        .environment(\.locale, Locale(identifier: "ge") // shows German translation
}