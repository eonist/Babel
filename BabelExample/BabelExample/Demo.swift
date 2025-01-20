import Babel
import Foundation
import SwiftUI
// Test that things work
#Preview {
   VStack(alignment: .center) {
      // hello_world_key farwell_key
      // es de fr en
      RetroClockTicker(text: "farewell_key".localized(langCode: "es"))
      Spacer().frame(height: 20)
      Text("github.com/eonist/babel")
         .font(.system(size: 20, weight: .bold, design: .monospaced))
         .foregroundStyle(.gray.opacity(0.5))
      
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
