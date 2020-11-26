//
//  ContentView.swift
//  CustomToggles
//
//  Created by Aji_sahputra on 25/11/20.
//

import SwiftUI

struct ContentView: View {
  
  @State var itemChecked = true
  @State var airPlaneMode = true
  @State var wifiOn = true
  @State var trackLocation = true
  @State var flashlightOn = true
  
    var body: some View {
      VStack {
        Toggle(isOn: $itemChecked, label: {
          Image(systemName: itemChecked ? "bag.fill" : "bag" )
          Text("Item Checked")
        })
        .padding()
        .toggleStyle(CheckboxStyle())
        Toggle(isOn: $airPlaneMode, label: {
          Image(systemName: "airplane")
          Text("Air Plane Mode")
        })
        .padding()
        .toggleStyle(SwitchToggleStyle(tint: .orange))
        Toggle(isOn: $wifiOn, label: {
          Image(systemName: wifiOn ? "wifi" : "wifi.slash")
          Text("Wi-Fi")
        })
        .padding()
        .toggleStyle(ChackmarkToggleStyle())
        Toggle(isOn: $trackLocation, label: {
          Image(systemName: trackLocation ? "location.fill" : "location")
          Text("Location")
        })
        .padding()
        .toggleStyle(PowerToggleStyle())
        Toggle(isOn: $flashlightOn, label: {
          Image(systemName: flashlightOn ? "flashlight.off.fill" : "flashlight.on.fill")
          Text("Flashlight")
        })
        .padding()
        .toggleStyle(PowerToggleStyleFlash())
      }
    }
}

struct CheckboxStyle : ToggleStyle {
  func makeBody(configuration: Self.Configuration) -> some View {
    return HStack {
      configuration.label
      Spacer()
      Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
        .resizable()
        .frame(width: 24, height: 24)
        .foregroundColor(configuration.isOn ? .purple : .gray)
        .font(.system(size: 20, weight: .bold, design: .default))
        .onTapGesture {
          configuration.isOn.toggle()
        }
    }
  }
}

struct ChackmarkToggleStyle : ToggleStyle {
  func makeBody(configuration: Configuration) -> some View {
    HStack {
      configuration.label
      Spacer()
      Rectangle()
        .foregroundColor(configuration.isOn ? .green : .gray)
        .frame(width: 51, height: 31, alignment: .center)
        .overlay(
          Circle()
            .foregroundColor(.white)
            .padding(.all, 3)
            .overlay(
              Image(systemName: configuration.isOn ? "checkmark" : "xmark")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .font(Font.title.weight(.black))
                .frame(width: 8, height: 8, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(configuration.isOn ? .green : .gray)
            )
            .offset(x: configuration.isOn ? 11 : -11, y: 0)
            .animation(Animation.linear(duration: 0.1))
          
        ).cornerRadius(20)
        .onTapGesture { configuration.isOn.toggle()}
    }
  }
}

struct PowerToggleStyle: ToggleStyle {
  
  func makeBody(configuration: Configuration) -> some View {
    HStack {
      configuration.label
      Spacer()
      Rectangle()
        .foregroundColor(configuration.isOn ? .green : .gray)
        .frame(width: 51, height: 31, alignment: .center)
        .overlay(
          Circle()
            .foregroundColor(.white)
            .padding(.all, 3)
            .overlay(
              GeometryReader { geo in
                Path { p in
                  if !configuration.isOn {
                    p.addRoundedRect(in: CGRect(x: 20, y: 10, width: 10.5, height: 10.5), cornerSize: CGSize(width: 7.5, height: 7.5), style: .circular, transform: .identity)
                  } else {
                    p.move(to: CGPoint(x: 51/2, y: 10))
                    p.addLine(to: CGPoint(x: 51/2, y: 31-100))
                  }
                }.stroke(configuration.isOn ? Color.green : Color.gray, lineWidth: 2)
              }
            )
            .offset(x: configuration.isOn ? 11 : -11, y: 0)
            .animation(Animation.linear(duration: 0.1))
        ).cornerRadius(20)
        .onTapGesture { configuration.isOn.toggle()}
    }
  }
}

struct PowerToggleStyleFlash: ToggleStyle {
  
  func makeBody(configuration: Configuration) -> some View {
    HStack {
      configuration.label
      Spacer()
      Rectangle()
        .foregroundColor(configuration.isOn ? .green : .red)
        .frame(width: 51, height: 31, alignment: .center)
        .overlay(
          Circle()
            .foregroundColor(.white)
            .padding(.all, 3)
            .overlay(
              Image(systemName: configuration.isOn ? "sun.max.fill" : "moon.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .font(Font.title.weight(.black))
                .frame(width: 15, height: 15, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(configuration.isOn ? .green : .red)
            )
            .offset(x: configuration.isOn ? 11 : -11, y: 0)
            .animation(Animation.linear(duration: 0.1))
          
        ).cornerRadius(20)
        .onTapGesture { configuration.isOn.toggle()}
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
