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
    var body: some View {
        VStack {
            //target row
            HStack {
                Text("Put the bulls eye as close as possible to:")
                Text("100")
            }
            
            //slider row
            HStack{
                Text("1")
                Slider(value: .constant(10))
                Text("100")
            }
            
            //button row
            Button(action: {
                print("button pressed")
                self.alertIsVisible = true
            }) {
                Text(/*@START_MENU_TOKEN@*/"Hit me!"/*@END_MENU_TOKEN@*/)
            }
            
            .alert(isPresented: $alertIsVisible){ () ->
                Alert in
                return Alert(title: Text("alert!!!"), message: Text("this is my first alert!"), dismissButton: .default(Text("good! that's crazy man! damn! dismiss!")))
            }
            
            //score row
            
            
        }
    }
}

// for preview showing
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
