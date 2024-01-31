//
//  ContentView.swift
//  MyFirstApp
//
//  Created by admin on 26.03.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var amount = 0
    
    var body: some View {
        VStack{
            Stepper("Amount of taps to get smiley face", value: $amount, in: 0...100)
            Text("Tap me: \(amount) times to get smiley face")
                .foregroundColor(.white)
                .padding()
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .onTapGesture {
                    if amount > 0 {
                        amount -= 1
                    }
                }
                .onLongPressGesture (minimumDuration: 3) {
                    amount = 100
                }
                .gesture(
                    DragGesture(minimumDistance: 50)
                        .onEnded {_ in
                            amount = 0
                        }
                )
            if amount == 0 {
                Text(":)")
            }
        }
    }
}









struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
