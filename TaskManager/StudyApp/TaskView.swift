//
//  TaskView.swift
//  StudyApp
//
//  Created by admin on 16.06.2023.
//

import SwiftUI

struct TaskView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var tItems: TItems
    @State private var name = ""
    @State private var importance = "NOT important"
    @State private var time = ""
    
    let importances = ["NOT important", "Medium","less Important","Important", "SUPER IMPORTANT"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Название", text: $name)
                Picker("Важность",selection: $importance) {
                    ForEach(importances, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Затраченное время", text: $time)
                    .keyboardType(.numberPad)
            }
            .navigationBarTitle("Добавить")
            .navigationBarItems(trailing: Button(action: {
                if let actualTime = Int(self.time) {
                    let item = TaskItem(name: self.name, importance: self.importance, time: actualTime)
                    self.tItems.items.append(item)
                    self.presentationMode.wrappedValue.dismiss()
                }
            }) {
                Text("Сохранить")
            })
        }
    }

}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView(tItems: TItems() )
    }
}
