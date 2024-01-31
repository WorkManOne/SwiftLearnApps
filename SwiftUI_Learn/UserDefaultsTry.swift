

import SwiftUI

struct userCombo :Codable {
    var login:String
    var pass:String
}

struct ContentView: View {
    
    
    @State private var user1 = userCombo(login: "MemeBoy", pass: "123qwe")
    @State private var clicksCount = UserDefaults.standard.integer(forKey: "Clicks")
    
    var body: some View {
        VStack {
            Button("Save the record for user: \(user1.login)") {
                let encoder = JSONEncoder()
                if let data = try? encoder.encode(self.user1) {
                    UserDefaults.standard.set(data, forKey: "userData")
                }
            } .padding()
                .background(.black)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            Button("Clicks count: \(clicksCount)") {
                self.clicksCount += 1
                UserDefaults.standard.set(self.clicksCount, forKey: "Clicks")
            }
            .font(.largeTitle)
            .fontWeight(.black)
            .foregroundColor(.white)
            .padding()
            .background(.red)
            .clipShape(Capsule())
        }
    }
}









struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
