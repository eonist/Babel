import XCTest
import Babel

class BabelTests: XCTestCase {
   func testLocalizedStringForMissingKey() {
      // Test that the key is returned when the localization is missing
      let defaultBundle = Bundle.babelModule
      let localizedString = "non_existent_key".localized(bundle: defaultBundle)
      XCTAssertEqual(localizedString, "non_existent_key", "Expected the key itself to be returned when localization is missing")
   }
}
