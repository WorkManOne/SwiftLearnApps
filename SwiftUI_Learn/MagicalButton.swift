//
//  ContentView.swift
//  MyFirstApp
//
//  Created by admin on 26.03.2023.
//

import SwiftUI

var myColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)

struct ContentView: View {
    
    @State private var showHello = true
    
    var body: some View {
        VStack {
            Button(action: {self.showHello.toggle()}) {
                let buttColor = Color.init(UIColor(
                    red: .random(in: 0.0...255.0)/255.0,
                    green: .random(in: 0.0...255.0)/255.0,
                    blue: .random(in: 0.0...255.0)/255.0,
                    alpha: 1.0))
                Text("Button")
                    .padding(15)
                    .background(buttColor)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
            }
            Spacer()
            if showHello {
                
                Text("Hello")
                    .font(.largeTitle)
                
            }
        }
    }
}









struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
