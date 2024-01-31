//
//  ContentView.swift
//  study
//
//  Created by admin on 18.06.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var rotation = 0.0
    
    var body: some View {
        VStack (spacing: 60){
            HStack (spacing: 40){
                Circle()
                    .stroke(.red, style:
                                StrokeStyle(lineWidth: 10, dash: [10]))
                    .frame(width: 100, height: 100)
                    .opacity(0.6)
                Circle()
                    .strokeBorder(.orange, style:
                                    StrokeStyle(lineWidth: 10, dash: [10,30]))
                    .frame(width: 100, height: 100)
                    .blur(radius: 5)
            }
            Slider(value: $rotation, in: 0...360, step:1.0,label: {Text("Rotate")})
                .padding(20)
                .background(.yellow)
                .cornerRadius(30)
                .saturation(0.2)
                .contrast(0.4)
                .colorMultiply(.yellow)
     
                
            ZStack{
                Image(systemName: "arrowshape.right.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .scaleEffect(x:0.8, y:1.2)
                VStack {
                    Text("First")
                        .foregroundColor(.white)
                        .padding()
                        .border(.white, width: 5)
                        .rotationEffect(.degrees(rotation))
                        .offset(x: 40)
                    
                    Text("Second")
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 15)
                            .stroke(.white, lineWidth: 10)
                        )
                        .foregroundColor(.white)
                        .scaleEffect(1.5, anchor: .bottomLeading)
                        .rotationEffect(.degrees(rotation), anchor: .topLeading)
                        .offset(x:-100,y: 25)
                    Text("Third")
                        .padding()
                        .background(.white)
                        .rotation3DEffect(.degrees(rotation), axis: (1,1,0))
                        .offset(x:50)
                }
                
            }
        }.shadow(color: .cyan ,radius: 5,x: 10, y:10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
