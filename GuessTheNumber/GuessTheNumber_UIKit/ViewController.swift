//
//  ViewController.swift
//  GuessTheNumber_UIKit
//
//  Created by Кирилл Архипов on 06.06.2024.
//

import UIKit

class ViewController: UIViewController {
    var randomNum = 0
    var triesCounter = 0
    var table = UITableView()
    
    
    @IBOutlet weak var guessTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        randomNum = Int.random(in: 0...100)
        triesCounter = 0
    }

    @IBAction func tryGuessButton(_ sender: Any) {
        if let guessedNumber = Int(guessTextField.text ?? "") {
            var title = ""
            var message = ""
            triesCounter += 1
            if guessedNumber == randomNum {
                title = "Верно!"
                message = "Вы угадали число за \(triesCounter) шагов"
                randomNum = Int.random(in: 0...100)
                triesCounter = 0
            }
            else if guessedNumber > randomNum {
                title = "Неверно"
                message = "Загаданное число меньше вашего"
            }
            else {
                title = "Неверно"
                message = "Загаданное число больше вашего"
            }
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default)
            alertController.addAction(action)
            self.present(alertController, animated: true)
        }
        else {
            let alertController = UIAlertController(title: "Некорректный ввод", message: "Введите целое число", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default)
            alertController.addAction(action)
            self.present(alertController, animated: true)
        }
    }
    
}

