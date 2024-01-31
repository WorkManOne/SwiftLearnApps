//
//  ContentView.swift
//  study
//
//  Created by admin on 18.06.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var scale:CGFloat = 1
    
    @State private var border:CGFloat = 1
    @State private var angle = 0.0
    
    @State private var showText = false
    @State private var opacity = 1.0
    
    @State private var rotation = 0.0
    @State private var scaleOnAppear:CGFloat = 1
    
    var body: some View {
        VStack{
            Rectangle()
                .fill(.green)
                .frame(width: 50, height: 50)
                .scaleEffect(scaleOnAppear)
                .onAppear {
                    let baseAnim = Animation.easeInOut(duration: 1)
                    let repeated = baseAnim.repeatForever(autoreverses: true)
                    return withAnimation (repeated) {
                        self.scaleOnAppear = 2
                    }
                }
                .padding(10)
            Rectangle()
                .fill(.green)
                .frame(width: 200, height: 200)
                .rotationEffect(.degrees(rotation))
                .animation(Animation.easeInOut(duration: 3).delay(1))
                .onTapGesture {
                    self.rotation += 360
                }
                .padding(60)
            Button(action: {
                withAnimation (.easeInOut(duration: 3)){
                    if opacity == 0 {
                        opacity += 1
                    }
                    else {
                        opacity -= 1
                    }
                }
            }){
                Text("Click to hide ME")
                    .opacity(opacity)
            }.padding()
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 5))
                .shadow(radius: 2, x:10,y:-10)
            
            Toggle(isOn: $showText.animation(.spring())) {
                Text("Show hidden text with animation")
            }
            if showText {
                Text("There is some animated text")
            }
            Button(action: {
                self.scale += 1
            }) {
                Text("Tap me")
                    .foregroundColor(.white)
                    .padding()
                    .background(.red)
                    .clipShape(Capsule())
                    .scaleEffect(scale)
                    .animation(.easeInOut(duration: 2), value: scale)
            }
            Button(action: {
                self.border += 1
                self.angle += 45
            }) {
                Text("Tap me")
                    .foregroundColor(.red)
                    .padding()
                    .border(.red, width: border)
                    .rotationEffect(.degrees(angle))
                    .animation(.interpolatingSpring(mass:1 ,stiffness: 10, damping: 1,initialVelocity: 20), value: angle)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
