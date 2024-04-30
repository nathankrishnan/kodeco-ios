import SwiftUI

struct ContentView: View {
  @State private var alertIsVisible: Bool = false
  @State private var redColor: Double = 0.0
  @State private var greenColor: Double = 0.0
  @State private var blueColor: Double = 0.0
  @State private var foregroundColor = Color(red: 0, green: 0, blue: 0)
  @Environment(\.verticalSizeClass) var verticalSizeClass
  @Environment(\.horizontalSizeClass) var horizontalSizeClass

  var landscapeView: some View {
    HStack {
      VStack(alignment: .center) {
        TitleText(text: "Color Picker")
        ColorResultView(foregroundColor: $foregroundColor)
      }
      .padding(.trailing, 10)
      SetColorView(redColor: $redColor, blueColor: $blueColor, greenColor: $greenColor, foregroundColor: $foregroundColor)
        .padding(.trailing, 10)
    }
    .background(Color("BackgroundColor"))
    .padding(20)
  }

  var portraitView: some View {
    VStack {
      TitleText(text: "Color Picker")
      ColorResultView(foregroundColor: $foregroundColor)
      SetColorView(redColor: $redColor, blueColor: $blueColor, greenColor: $greenColor, foregroundColor: $foregroundColor)
    }
    .background(Color("BackgroundColor"))
    .padding(20)
  }

  var body: some View {
    Group {
      // iPhone Portrait
      if verticalSizeClass == .regular && horizontalSizeClass == .compact {
        portraitView
      } else {
        landscapeView
      }
    }
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
      .preferredColorScheme(.light)
      .previewInterfaceOrientation(.landscapeLeft)
    ContentView()
      .preferredColorScheme(.dark)
      .previewInterfaceOrientation(.portrait)
  }
}

