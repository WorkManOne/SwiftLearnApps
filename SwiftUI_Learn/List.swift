//
//  ContentView.swift
//  MyFirstApp
//
//  Created by admin on 26.03.2023.
//

import SwiftUI

struct RecipeRow: View {
    
    var name: String
    
    var body: some View {
        Text("Рецепт: \(name)")
    }
}

struct Recipe: Identifiable {
    var id = UUID()
    var name:String
}

struct YourRecipeRow: View {
    var recipe: Recipe
    var body: some View {
        Text("Ваш рецепт: \(recipe.name)")
    }
}

struct ContentView: View {
    
    var body: some View {
        var salad = Recipe(name:"мой салат")
        var saladG = Recipe(name:"салат с говном")
        var kuritsa = Recipe(name:"Это курица? Нет это естся")
        var recipees = [salad, saladG, kuritsa]
        List {
            Section(header: Text("Наши рецепты") .foregroundColor(.red) ) {
                RecipeRow(name: "Удмуртский салат")
                RecipeRow(name: "Cалат узбек")
                RecipeRow(name: "Серьезная нарезка")
                RecipeRow(name: "Сочный сок")
            }
            Section(header: Text("Ваши рецепты")
                .foregroundColor(.green)) {
                ForEach(recipees) { i in
                    YourRecipeRow(recipe: i)
                }
                }.listRowBackground(Color.green)
                .foregroundColor(.white)
                .font(.headline)
        }.listStyle(.sidebar)
    }
}









struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
