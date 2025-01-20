import Babel
import Foundation
import SwiftUI

struct ContentView: View {
   var body: some View {
      // Example usage
      let _ = {
         if let frenchBundle = localizationBundle(forLanguage: "fr") {
            print(NSLocalizedString("hello_world_key", bundle: frenchBundle, comment: ""))
         }
      }()
      VStack(alignment: .center) {
         Text("greeting_key", bundle: .babelModule) // use your babel translations
            .environment(\.locale, Locale(identifier: "es")) // shows English translation
         Text("hello_world_key".localized(bundle: localizationBundle(forLanguage: "de") ?? .babelModule))
         Text("farewell_key".localized(langCode: "fr")) // use your babel translations
      }
//      .padding()
   }
}

// Test that things work
#Preview {
   ContentView()
}
 
