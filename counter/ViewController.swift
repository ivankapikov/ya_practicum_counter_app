//
//  ViewController.swift
//  counter
//
//  Created by Иван Капиков on 21.05.2023.
//

import UIKit


class ViewController: UIViewController {
    @IBOutlet weak var cleanButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var countBoardLabel: UILabel!
    @IBOutlet weak var historyTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cleanButton.layer.cornerRadius = 10
        plusButton.layer.cornerRadius = 10
        minusButton.layer.cornerRadius = 10
    }
    
    var number: Int = 0
    
    //MARK: Functions
    
    func plus () {
        number += 1
        
        countBoardLabel.text = "\(number)"
        historyTextView.text += """
                \nЗначение увеличено на 1 и равно \(number)
                операция совершена: \(Date().formatted())
                ----------------\n
                """
    }
    
    func minus () {
        number -= 1
        
        if number < 0 {
            number = 0
            countBoardLabel.text = "Ошибка"
            historyTextView.text += """
                \nПопытка уменьшить значение < нуля
                данная операция не поддерживается
                ошибка совершена: \(Date().formatted())
                ----------------\n
                """
        } else {
            countBoardLabel.text = "\(number)"
            historyTextView.text += """
                \nЗначение уменьшено на 1 и равно \(number)
                операция совершена: \(Date().formatted())
                ----------------\n
                """
        }
    }
    
    
    
    //MARK: Actions
    
    @IBAction func plusButtonAction(_ sender: Any) {
        plus()
    }
    @IBAction func minusButtonAction(_ sender: Any) {
        minus()
    }
    @IBAction func cleanButtonAction(_ sender: Any) {
        number = 0
        countBoardLabel.text = "\(number)"
        historyTextView.text = "History:\n"
    }
}



