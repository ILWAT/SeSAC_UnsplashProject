//
//  NumberViewController.swift
//  SeSAC_UnsplashProject
//
//  Created by 문정호 on 2023/09/18.
//

import UIKit

class NumberViewController: UIViewController{
    
    @IBOutlet weak var numberTextField: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    let viewModel = NumberViewModel()
    
    override func viewDidLoad() {
        
        bindData()
        
        numberTextField.addTarget(self, action: #selector(numberTextFieldChanged), for: .editingChanged)
    }
    
    func bindData(){
        viewModel.number.bind { number in
            self.numberTextField.text = number
        }
        
        viewModel.result.bind { value in
            self.resultLabel.text = value
        }
    }
    
    @objc func numberTextFieldChanged(){
        viewModel.number.value = numberTextField.text
        viewModel.convertNumber()
    }
    
}
