import SwiftUI

struct TitleText: View {
  var text: String

  var body: some View {
    Text(text)
      .bold()
      .font(.largeTitle)
      .foregroundColor(Color("TextColor"))
  }
}

struct LabelText: View {
  var text: String

  var body: some View {
    Text(text)
      .foregroundColor(Color("TextColor"))
  }
}

struct TextViews_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      TitleText(text: "Color Picker")
      LabelText(text: "Red")
    }
  }
}

