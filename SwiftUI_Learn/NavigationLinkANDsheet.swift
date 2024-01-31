

import SwiftUI

struct AboutView : View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack {
            Text("Our recipes is high detailed by steps! We check all of them before release!")
            Button("Back") {
                self.presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

struct Recipe: Identifiable {
    var id = UUID()
    var name: String
}

struct RecipeRow: View {
    var recipe:Recipe
    var body: some View {
        Text(recipe.name)
    }
}

struct RecipeView: View {
    @State private var showAbout = false
    
    var recipe:Recipe
    var body: some View {
        VStack {
            Text("Import this recipe: \(recipe.name)")
                .font(.largeTitle)
            Button(action: {self.showAbout.toggle()}) {
                Text("About our recipes")
            }.sheet(isPresented: $showAbout) {
                AboutView()
            }
        }
    }
}

struct ContentView: View {
    
    var body: some View {
        let first = Recipe(name: "Kura")
        let recipees = [first]
        
        NavigationView {
            List(recipees) { recipee in
                NavigationLink(destination: RecipeView(recipe: recipee)) {
                    RecipeRow(recipe: recipee)
                }
            }.navigationBarTitle("Choose a recipe")
        }
    }
}









struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
