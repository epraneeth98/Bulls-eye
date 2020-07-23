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
    @State var target: Int = (Int.random(in: 1...10000)%100)
    @State var totalScore: Int = 0
    @State var round: Int = 1
    var body: some View {
        VStack {
            Spacer()
            //target row
            HStack {
                Text("Put the bulls eye as close as possible to:")
                Text("\(target)")
            }
            Spacer()
            //slider row
            HStack{
                Text("1")
                Slider(value: $sliderValue, in: 1...100)
                Text("100")
            }
            Spacer()
            //button row
            Button(action: {
                //print("button pressed")
                self.alertIsVisible = true
                self.totalScore += self.pointsScored()
            }) {
                Text(/*@START_MENU_TOKEN@*/"Hit me!"/*@END_MENU_TOKEN@*/)
            }
            
            .alert(isPresented: $alertIsVisible){ () ->
                Alert in
                let roundedValue: Int = Int(sliderValue)
                return Alert(title: Text("alert!!!"), message: Text(
                    "The slider value is \(roundedValue) \n" +
                    "You scored \(pointsScored()) in this round"
                    ), dismissButton: .default(Text("\(dismissMessage(score: pointsScored()))")){
                        self.target = (Int.random(in: 1...10000)%100)
                        self.sliderValue = 50.0
                        self.round += 1
                    })
            }
            Spacer()
            //score row
            HStack{
                Button(action:{
                    self.startNewGame()
                }){
                    Text("Start Over")
                }
                Spacer()
                Text("Score")
                
                Text("\(totalScore)")
                Spacer()
                Text("Round")
                Text("\(round)")
                Spacer()
                Button(action:{}){
                    Text("Info")
                }
                
            }
            .padding(.bottom, 30)
            
        }
    }
    func pointsScored() -> Int{
        let points: Int = 100 - abs(Int(sliderValue) - target)
        if points == 100{return 200}
        else{
        return points
        }
    }
    func dismissMessage(score: Int) -> String{
        if score > 95 {return "Perfect! \nBonus points: 100"}
        else if score > 80 {return "Good!"}
        else if score > 50 { return "Just Ok!"}
        else {return "Fail! 😂"}
    }
    func startNewGame(){
        self.round = 1
        self.totalScore = 0
        self.target = (Int.random(in: 1...10000)%100)
        self.sliderValue = 50.0
    }
}

// for preview showing
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
