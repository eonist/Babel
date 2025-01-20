import Babel
import Foundation
import SwiftUI
// Test that things work
#Preview {
   @Previewable @State var index: Int = 0
   @Previewable @State var lang: String = "English"
   @Previewable @State var text: String = "hello_world_key".localized(langCode: "en")
   VStack(alignment: .center, spacing: 12) {
      // hello_world_key farwell_key
      // es de fr en
//      RetroClockTicker(text: "farewell_key".localized(langCode: "fr"))
//         .frame(height: 24)
      Text(text)
         .font(.system(size: 30, weight: .bold, design: .monospaced))
         .contentTransition(.numericText())
      Text(lang) // "github.com/eonist/babel"
         .font(.system(size: 20, weight: .bold, design: .monospaced))
         .foregroundStyle(.gray.opacity(0.5))
      Spacer().frame(height: 120)
      Button.init("Random", action: {
         let langCode = ["es","fr","de","en"]
         let langArr = ["Spanish","French","German","English"]
         lang = langArr[index]
         withAnimation {
            text = "hello_world_key".localized(langCode: langCode[index])
            
         }
         index += 1
      })
   }
}

struct RetroClockTicker: View {
   let text: String
   @State private var displayedText = ""
   @State private var currentIndex = 0
   
   var body: some View {
      Text(displayedText)
         .font(.system(size: 20, weight: .bold, design: .monospaced))
         .onAppear {
            animateText()
         }
   }
   
   private func animateText() {
      Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
         if currentIndex < text.count {
            let index = text.index(text.startIndex, offsetBy: currentIndex)
            displayedText += String(text[index])
            currentIndex += 1
         } else {
            timer.invalidate()
         }
      }
   }
}
