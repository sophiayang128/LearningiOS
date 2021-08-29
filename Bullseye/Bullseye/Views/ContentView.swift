//
//  ContentView.swift
//  Bullseye
//
//  Created by Sophia Tang on 8/25/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var alertIsVisible: Bool = false
    
    @State private var sliderValue: Double = 10.0
    
    @State private var game: Game = Game()
    
    var body: some View {
        VStack {
            VStack {
                Text("🎯🎯🎯\nPut the Bullseye as close as you can to the target number!")
                    .bold()
                    .kerning(2.0)
                    .multilineTextAlignment(.center)
                    .lineSpacing(4.0)
                    .font(.footnote)
                Text(String(game.target))
                    .kerning(-1.0)
                    .font(.largeTitle)
                    .fontWeight(.black)
                HStack {
                    Text("1")
                        .bold()
                        .font(.body)
                    Slider(value: self.$sliderValue, in: 1.0...100.0)
                    Text("100")
                        .bold()
                        .font(.body)
                }
                Button(action: {
                    self.alertIsVisible = true
                }) {
                    Text("Hit me!")
                        .font(.title2)
                }
                .alert(isPresented: self.$alertIsVisible,
                       content: {
                        let roundedValue: Int = Int(self.sliderValue.rounded())
                        let currentPoints: Int = self.game.points(sliderValue: roundedValue)
                    return Alert(title: Text("Result"),
                                 message: Text("You've hit: \(roundedValue).\n" + "You scored: \(currentPoints) points this round."),
                                 dismissButton: .default(Text("Try again"), action: {
                                    self.game.addRound()
                                    self.game.addScore(points: currentPoints)
                                    self.game.generateTarget()
                                 }))
                })
            }
            HStack {
                Text("Round: \(self.game.round)")
                    .alignmentGuide(HorizontalAlignment.leading, computeValue: { dimension in
                        -100
                    })
                Text("Total score: \(self.game.score)")
                    .alignmentGuide(HorizontalAlignment.trailing, computeValue: { dimension in
                        20
                    })
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .padding()
        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
