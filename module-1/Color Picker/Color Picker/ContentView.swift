//
//  ContentView.swift
//  Color Picker
//
//  Created by Nathan Krishnan on 10/31/23.
//

import SwiftUI

struct ContentView: View {
  @State private var redSliderValue = 99.0
  @State private var greenSliderValue = 40.0
  @State private var blueSliderValue = 75.0
  @State private var rgbColor = Color(red: 99.0/255.0, green: 40.0/255.0, blue: 75.0/255.0)

  var body: some View {
    VStack {
      Text("Color Picker")
        .font(.largeTitle)
        .padding()
      RoundedRectangle(cornerRadius: 0)
        .padding(.all)
        .foregroundColor(rgbColor)
      VStack {
        Text("Red")
        HStack {
          Slider(value: $redSliderValue, in: 0.0...255.0)
            .padding(.leading)
          let redRoundedValue = "\(Int(redSliderValue.rounded()))"
          Text(redRoundedValue)
            .padding(.trailing)
        }
      }
      VStack {
        Text("Green")
        HStack {
          Slider(value: $greenSliderValue, in: 0.0...255.0)
            .padding(.leading)
          let greenRoundedValue = "\(Int(greenSliderValue.rounded()))"
          Text(greenRoundedValue)
            .padding(.trailing)
        }
      }
      VStack {
        Text("Blue")
        HStack {
          Slider(value: $blueSliderValue, in: 0.0...255.0)
            .padding(.leading)
          let blueRoundedValue = "\(Int(blueSliderValue.rounded()))"
          Text(blueRoundedValue)
            .padding(.trailing)
        }
      }
      Button("Set Color") {
        let rgb = (
          (redSliderValue.rounded() / 255.0),
          (greenSliderValue.rounded() / 255.0),
          (blueSliderValue.rounded() / 255.0)
        )
        rgbColor = Color(red: rgb.0, green: rgb.1, blue: rgb.2)
      }
    }
    .padding(.top)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
