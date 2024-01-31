//
//  ContentView.swift
//  StudyApp
//
//  Created by admin on 15.06.2023.
//

import SwiftUI

struct TaskItem :Identifiable, Codable{
    let id = UUID()
    let name: String
    let importance: String
    let time: Int
}

class TItems: ObservableObject {
    @Published var items = [TaskItem]() {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items){
                UserDefaults.standard.set(encoded, forKey: "TasksList")
            }
        }
    }
    init() {
        if let items = UserDefaults.standard.data(forKey: "TasksList") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([TaskItem].self, from: items) {
                self.items = decoded
                return
            }
        }
    }
}

struct ContentView: View {
    
    @ObservedObject var tItems = TItems()
    @State private var showAddView = false
    var body: some View {
        NavigationView {
            List {
                ForEach(tItems.items ) { item in
                    HStack {
                        VStack (alignment: .leading){
                            Text(item.name)
                                .font(.headline)
                            Text(item.importance)
                        }
                        Spacer()
                        Text("^[\(item.time) hour](inflect: true)")
                    }
                }.onDelete(perform: removeItem)
            }.navigationBarTitle("Сделанные дела")
                .navigationBarItems(trailing: Button(action: {
                    self.showAddView = true
                }){
                    Image(systemName: "plus")
                }.sheet(isPresented: $showAddView) {
                    TaskView(tItems: self.tItems)
                })
        }
        
    }
    
    func removeItem(as offsets:IndexSet) {
        tItems.items.remove(atOffsets: offsets)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
