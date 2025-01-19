import Foundation
import SwiftUI

extension Bundle {
   public static var babelModule: Bundle {
      return Bundle.module
   }
}

// Convenient localization string extension
extension String {
   public func localized(comment: String = "", bundle: Bundle = .babelModule) -> String {
      NSLocalizedString(self, bundle: bundle, comment: comment)
   }
   public func localized(comment: String = "", langCode: String = "en") -> String {
      let bundle = localizationBundle(forLanguage: langCode) ?? .babelModule
      return NSLocalizedString(self, bundle: bundle, comment: comment)
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
