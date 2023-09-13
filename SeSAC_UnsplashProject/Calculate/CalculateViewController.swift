//
//  CalculateViewController.swift
//  SeSAC_UnsplashProject
//
//  Created by 문정호 on 2023/09/13.
//

import UIKit

class CalculateViewController: UIViewController{
    
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    let viewModel = CalculateViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstTextField.addTarget(self, action: #selector(firstTextFieldChanged), for: .editingChanged)
        secondTextField.addTarget(self, action: #selector(secondTextFieldChanged), for: .editingChanged)
        
        viewModel.firstNumber.bind { number in
            self.firstTextField.text = number
            self.viewModel.calculate()
            print("firstNumber changed \(number)")
        }
        
        viewModel.secondNumber.bind { number in
            self.secondTextField.text = number
            self.viewModel.calculate()
            print("secondNumber changed \(number)")
        }
        
        viewModel.resultText.bind { text in
            self.resultLabel.text = text
        }
        
        viewModel.tempText.bind { text in
            self.tempLabel.text = text
        }
   
        /*
        let person = Person(/*name:*/ "새싹이") //와일드 카드 변수 선언으로 인한 키워드 삭제
        
        person.name = "카스타스"
        
        person.name  = "칙촉"
        
        person.introduce { value in
            self.resultLabel.text = value
            self.view.backgroundColor = [UIColor.orange, UIColor.lightGray, UIColor.magenta].randomElement()!
        }
        
        person.introduce(Int.random(in: 1...10)) {
          self.view.backgroundColor = [UIColor.orange, UIColor.lightGray, UIColor.magenta].randomElement()!
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
            person.name = "바나나"
            print("===1초뒤?===")
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now()+5) {
            person.name = "키위"
            print("===5초뒤?===")
        }
        */
        
        
        firstTextField.text = viewModel.firstNumber.value
        secondTextField.text = viewModel.secondNumber.value
    }
    
    @objc func firstTextFieldChanged(_ sender: UITextField){
        viewModel.firstNumber.value = firstTextField.text
        viewModel.calculate()
        viewModel.presentNumberFormat()
    }
    
    
    @objc func secondTextFieldChanged(_ sender: UITextField){
        viewModel.secondNumber.value = secondTextField.text!
    }
    
    
}
