//
//  ContentView.swift
//  Weight Index Watch App
//
//  Created by admin on 08.06.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var name = ""
    @State private var weight = ""
    @State private var height = ""
    @State private var showRes = false
    @State private var showErr = false
    @State var res:Double = 0.0
    @State var w_work:Double? = 0.0
    @State var h_work:Double? = 0.0
    
    var body: some View {
        ScrollView {
            Text("Калькулятор индекса массы тела")
                .font(.title3)
                .multilineTextAlignment(.center)
            TextField("Введите свое имя", text: $name)
                .textFieldStyle(.automatic)
                .padding()
            TextField("Введите свой вес", text: $weight)
                .textFieldStyle(.automatic)
                .padding()
            TextField("Введите свой рост", text: $height)
                .textFieldStyle(.automatic)
                .padding()
            Button(action: {
                w_work = Double(weight)
                h_work = Double(height)
                if w_work != nil && h_work != nil {
                    if w_work! > 0 && h_work! > 0 {
                        showErr = false
                        showRes = true
                        
                        res = w_work!*10000/h_work!/h_work!
                    }
                    else {
                        showErr = true
                        showRes = false
                    }
                }
                else {
                    showErr = true
                    showRes = false
                }
            })
            {
                Text("Подсчитать ИМТ")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
            }
            .buttonStyle(BorderedButtonStyle(tint: Color.orange.opacity(255)))
            //.padding()
            //.clipShape(RoundedRectangle(cornerRadius: 10))
            
            if showRes{
                Text("\(name), ваш индекс массы тела = \(res)")
            }
            if showErr {
                Text("Неверные данные")
                    .font(.title3)
            }
        }
    }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
