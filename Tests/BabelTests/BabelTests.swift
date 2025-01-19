import XCTest
import Babel

class BabelTests: XCTestCase {
   
   // basically just test if bableModule can be imported
   
   func testLocalizedStringForMissingKey() {
      // Test that the key is returned when the localization is missing
      let defaultBundle = Bundle.babelModule
      let localizedString = "non_existent_key".localized(bundle: defaultBundle)
      XCTAssertEqual(localizedString, "non_existent_key", "Expected the key itself to be returned when localization is missing")
   }

   // - Fixme: Add doc

   func testLocalizationBundleForInvalidLanguage() {
        let bundle = localizationBundle(forLanguage: "invalid_code")
        XCTAssertNil(bundle, "Expected nil for an invalid language code")
    }
}
