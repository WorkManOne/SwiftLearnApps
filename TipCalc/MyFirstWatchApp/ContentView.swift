//
//  ContentView.swift
//  MyFirstApp
//
//  Created by admin on 26.03.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var money = ""
    @State private var people = 0
    @State private var percentage = 0
    @State private var Red = UserDefaults.standard.double(forKey: "Red")
    @State private var Green = UserDefaults.standard.double(forKey: "Green")
    @State private var Blue = UserDefaults.standard.double(forKey: "Blue")
    @State private var showHelp = false
    @State private var setToDef = false
    let tipP = [0, 5, 10, 15, 20]
    @State private var someDel = ["Man", "Shut", "Yo", "Ass", "Up"]

    
    var resultPerPerson:Double {
        let peopleCount = Double(people + 2)
        let tip = Double(tipP[percentage])
        let moneyAmount = Double(money) ?? 0
        let res = moneyAmount/100*tip/peopleCount + moneyAmount/peopleCount
        return res
    }
    
    func delete(at offsets: IndexSet ){
        someDel.remove(atOffsets: offsets)
    }
    func move(from source: IndexSet, to destination:Int ){
        someDel.move(fromOffsets: source, toOffset: destination)
    }
    
    var body: some View {
        TabView {
            NavigationView() {
                Form {
                    Section{
                        TextField("Money amount", text: $money)
                        Picker("Amount of people", selection: $people) {
                            ForEach (2..<100) { i in
                                Text("\(i)")
                            }
                        }.pickerStyle(.navigationLink)
                    }
                    Section(header: Text("Сколько чаевых вы хотите оставить?")){
                        Picker("Tip percentage", selection: $percentage) {
                            ForEach(0..<tipP.count) {
                                Text("\(self.tipP[$0])%")
                            }
                        }.pickerStyle(.segmented)
                    }
                    Section(header: Text("Результат")) {
                        Text("\(resultPerPerson, specifier: "%.2f")")
                            .foregroundColor((Red + Green + Blue)/3 < 0.5 ? .white: .black)
                    }.listRowBackground(Color.init(red: Red, green: Green, blue: Blue))
                    Button("Вернуть на значения по умолчанию"){
                        setToDef = true
                    }.alert(isPresented: $setToDef) {
                        Alert(title: Text("Вернуть?"),
                              message: Text("Вы действительно хотите вернуть все значения по умолчанию?"),
                              primaryButton: .destructive(Text("Да")) {
                            people = 0
                            percentage = 0
                            Red = 0
                            Green = 0.0
                            Blue = 0
                            money = ""
                        },
                              secondaryButton: .cancel(Text("Нет"))
                        )
                    }
                }
                .navigationBarItems(trailing: Button("Help"){
                    showHelp = true
                }.alert(isPresented: $showHelp) {
                    Alert(title: Text("Помощь"), message: Text("Приложение создано для подсчета чаевых, введите необходимые данные в поля ввода"), dismissButton: .default(Text("OK")))
                })
                .navigationBarTitle("Калькулятор чаевых", displayMode: .inline)
            }.tabItem{
                Text("Calculator")
                Image(systemName: "dollarsign.circle.fill")
            }
            NavigationView() {
                Form {
                    Section("Цвет фона результата"){
                        Slider(value: $Red, in: 0...1, label: {Text("Red")})
                        Slider(value: $Green, in: 0...1, label: {Text("Green")})
                        Slider(value: $Blue, in: 0...1, label: {Text("Blue")})
                        Rectangle()
                            .foregroundColor(Color.init(red: Red, green: Green, blue: Blue))
                        Button("Сохранить настройки") {
                            UserDefaults.standard.set(Red, forKey: "Red")
                            UserDefaults.standard.set(Green, forKey: "Green")
                            UserDefaults.standard.set(Blue, forKey: "Blue")
                        }
                    }
                    Section{
                        List {
                            ForEach (someDel, id:\.self){ index in
                                Text(index)
                            }.onDelete(perform: delete)
                                .onMove(perform: move)
                        }
                    }
                }
                .navigationBarItems(trailing: EditButton())
                .navigationBarTitle("Настройки", displayMode: .inline)
            }.tabItem{
                Text("Settings")
                Image(systemName: "gear")
                
            }
        }
    }
}









struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
