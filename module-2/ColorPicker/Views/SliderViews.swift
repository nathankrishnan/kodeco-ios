import SwiftUI

struct SliderView: View {
  @Binding var redColor: Double
  @Binding var greenColor: Double
  @Binding var blueColor: Double

  var body: some View {
    VStack {
      VStack {
        LabelText(text: "Red")
        HStack {
          Slider(value: $redColor, in: Constants.RGBColor.minValue...Constants.RGBColor.maxValue)
            .tint(.red)
          LabelText(text: "\(Int(redColor.rounded()))")
        }
      }
      VStack {
        LabelText(text: "Green")
        HStack {
          Slider(value: $greenColor, in: Constants.RGBColor.minValue...Constants.RGBColor.maxValue)
            .tint(.green)
          LabelText(text: "\(Int(greenColor.rounded()))")
        }
      }
      VStack {
        LabelText(text: "Blue")
        HStack {
          Slider(value: $blueColor, in: Constants.RGBColor.minValue...Constants.RGBColor.maxValue)
            .tint(.blue)
          LabelText(text: "\(Int(blueColor.rounded()))")
        }
      }
    }
  }
}

struct SliderView_Previews: PreviewProvider {
  static var previews: some View {
    SliderView(redColor: .constant(66.0), greenColor: .constant(135.0), blueColor: .constant(245.0))
  }
}

