import SwiftUI

struct ColorResultView: View {
  @Binding var foregroundColor: Color

  var body: some View {
    RoundedRectangle(cornerRadius: 0)
      .foregroundColor(foregroundColor)
      .overlay(
        RoundedRectangle(cornerRadius: 0)
          .strokeBorder(.black.opacity(0.1), lineWidth: 8.0)
      )
  }
}

struct ColorResultView_Previews: PreviewProvider {
  @State static var testColor = Color(
    red: 250.0 / Constants.RGBColor.maxValue,
    green: 100.0 / Constants.RGBColor.maxValue,
    blue: 50.0 / Constants.RGBColor.maxValue
  )

  static var previews: some View {
    ColorResultView(foregroundColor: $testColor)
      .padding(20)
  }
}
