import SwiftUI

struct ContentView: View {
  @State private var alertIsVisible: Bool = false
  @State private var redColor: Double = 0.0
  @State private var greenColor: Double = 0.0
  @State private var blueColor: Double = 0.0
  @State private var foregroundColor = Color(red: 0, green: 0, blue: 0)

  var body: some View {

    VStack {
      TitleText(text: "Color Picker")
      ColorResultView(foregroundColor: $foregroundColor)
      SetColorView(redColor: $redColor, blueColor: $blueColor, greenColor: $greenColor, foregroundColor: $foregroundColor)

    }
    .background(Color("BackgroundColor"))
    .padding(20)
  }
}

struct SetColorView: View {
  @Binding var redColor: Double
  @Binding var blueColor: Double
  @Binding var greenColor: Double
  @Binding var foregroundColor: Color

  var body: some View {
    VStack {
      SliderView(redColor: $redColor, greenColor: $greenColor, blueColor: $blueColor)
      SetColorButton(redColor: $redColor, greenColor: $greenColor, blueColor: $blueColor, foregroundColor: $foregroundColor)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
    ContentView()
      .preferredColorScheme(.dark)
  }
}

