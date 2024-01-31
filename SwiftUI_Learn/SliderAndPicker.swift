//
//  ContentView.swift
//  MyFirstApp
//
//  Created by admin on 26.03.2023.
//

import SwiftUI

struct ContentView: View {
    
    var colors = [UIColor(.black), UIColor(.red), UIColor(.green), UIColor(.yellow), UIColor(.blue), UIColor(.orange)]
    
    @State private var amountFill:Double = 0.0
    @State private var colorPicked = 0
    
    var body: some View {
        VStack {
            Picker(selection: $colorPicked, label:
                    Text("Color of circle")) {
                ForEach(0..<colors.count) { index in
                    Text("\(index)")
                }
            } .pickerStyle(.segmented)
            Slider(value: $amountFill, in: 0...360, step: 0.1)
                .padding(.horizontal, 70)
                .padding(.top, 70)
            Text("\(amountFill)")
            ZStack {
                Circle()
                    .stroke(lineWidth: 10)
                    .opacity(0.3)
                    .frame(width: 120)
                    .foregroundColor(Color(colors[colorPicked]))
                Circle()
                    .offset(y:-60)
                    .frame(width: 10)
                    .rotationEffect(Angle(degrees: amountFill))
                    .foregroundColor(Color(colors[colorPicked]))
            }
        }
    }
}









struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
