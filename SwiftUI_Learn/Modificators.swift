

import SwiftUI

struct CustomText:View {
    var text:String
    
    var body:some View {
        Text(text)
            .font(.largeTitle)
            .fontWeight(.heavy)
            .foregroundColor(.white)
            .padding()
            .background(.black)
            .clipShape(Capsule())
    }
    
    
}

struct customModifier:ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .multilineTextAlignment(.center)
            .foregroundColor(.white)
            .fontWeight(.black)
            .textCase(.uppercase)
            .padding()
            .background(.blue)
            .clipShape(Capsule())
    }
}

extension View {
    func customM() -> some View {
        self.modifier(customModifier())
    }
}

struct ContentView: View {
    
    @State private var useGreenText = false
    
    var body: some View {
        VStack (spacing: 30){
            Text("Text with MY MODIFICATOR")
                .modifier(customModifier())
            
            Text("Text with MY MODIFICATOR, but much useful")
                .customM()
            
            CustomText(text: "Big text")
                
            CustomText(text: "Big text 2")
            
            Button("Click me") {
                self.useGreenText.toggle()
            }.foregroundColor(useGreenText ? .blue : .red)
                .fontWeight(.semibold)
                .fontDesign(.monospaced)
                .textCase(.uppercase)
                .padding()
                .background(.black)
                .clipShape(Capsule())
        }
    }
}









struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
