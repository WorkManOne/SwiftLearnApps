

import SwiftUI

struct ContentView: View {
    @State private var food = ["g1","g2","g3","g4","g5","burgers + pizza","b2","b3","b4","b5"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var score = 0
    @State private var showScore = false
    @State private var scoreTitle = ""
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.red, .brown]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            VStack (spacing: 30){
                VStack {
                    Text("Выбери пищу")
                        .foregroundColor(.white)
                        .font(.title)
                    Text("\(food[correctAnswer])")
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                ForEach (0..<3) { number in
                    Button(action: {
                        self.buttonTap(number)
                        self.showScore = true
                    }){
                        Image(food[number])
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 300, height: 100)
                            .clipShape(Capsule())
                            .overlay(Capsule().stroke(Color.white, lineWidth: 5))
                            .shadow(radius: 5)
                    }
                }
                Text("Общий счёт: \(score)")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundColor(.white)
                Spacer()
            }
        }.alert(isPresented: $showScore) {
            Alert(title: Text(scoreTitle), message: Text("Общий счет:  \(score)"), dismissButton: .default(Text("Продолжить")){
                askQuestion()
            })
        }
        
    }
    func askQuestion() {
        food.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    func buttonTap(_ number: Int){
        if number == correctAnswer{
            scoreTitle = "Правильный ответ"
            score += 1
        }
        else {
            scoreTitle = "Неправильно, это картинка \(food[number])"
            if score > 0 {
                score -= 1
                
            }
        }
    }
}









struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
