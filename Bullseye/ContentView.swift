//
//  ContentView.swift
//  Bullseye
//
//  Created by E_Praneeth on 30/06/20.
//  Copyright © 2020 udacity. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var alertIsVisible: Bool = false
    @State var sliderValue: Double = 50.0
    var body: some View {
        VStack {
            Spacer()
            //target row
            HStack {
                Text("Put the bulls eye as close as possible to:")
                Text("100")
            }
            Spacer()
            //slider row
            HStack{
                Text("1")
                Slider(value: self.$sliderValue, in: 1...100)
                Text("100")
            }
            Spacer()
            //button row
            Button(action: {
                print("button pressed")
                self.alertIsVisible = true
            }) {
                Text(/*@START_MENU_TOKEN@*/"Hit me!"/*@END_MENU_TOKEN@*/)
            }
            
            .alert(isPresented: $alertIsVisible){ () ->
                Alert in
                var roundedValue: Int = Int(self.sliderValue)
                return Alert(title: Text("alert!!!"), message: Text("the slider value is \(roundedValue)"), dismissButton: .default(Text("good! that's crazy man! damn! dismiss!")))
            }
            Spacer()
            //score row
            HStack{
                Button(action:{}){
                    Text("Start Over")
                }
                Spacer()
                Text("Score")
                Text("99999")
                Spacer()
                Text("Round")
                Text("99")
                Spacer()
                Button(action:{}){
                    Text("Info")
                }
                
            }
            .padding(.bottom, 30)
            
        }
    }
}

// for preview showing
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
