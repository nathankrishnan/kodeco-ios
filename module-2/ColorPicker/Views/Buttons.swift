import SwiftUI

struct SetColorButton: View {
  @Binding var redColor: Double
  @Binding var greenColor: Double
  @Binding var blueColor: Double
  @Binding var foregroundColor: Color

  var body: some View {
    Button("Set Color") {
      foregroundColor = Color(
        red: redColor / Constants.RGBColor.maxValue,
        green: greenColor / Constants.RGBColor.maxValue,
        blue: blueColor / Constants.RGBColor.maxValue
      )
    }
    .padding(20)
    .background(
      Color.blue
    )
    .foregroundColor(.white)
    .bold()
    .cornerRadius(Constants.Button.cornerRadius)
    .overlay(
      RoundedRectangle(cornerRadius: Constants.Button.cornerRadius)
        .strokeBorder(
          Color.white,
          lineWidth: Constants.Button.strokeLineWidth
      )
    )
  }
}

struct PreviewView: View {
  var body: some View {
    SetColorButton(redColor: .constant(66.0), greenColor: .constant(120.0), blueColor: .constant(120.0), foregroundColor: .constant(.blue))
  }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
      PreviewView()
      PreviewView()
        .preferredColorScheme(.dark)
    }

}

