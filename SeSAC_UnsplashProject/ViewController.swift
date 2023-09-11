//
//  ViewController.swift
//  SeSAC_UnsplashProject
//
//  Created by 문정호 on 2023/09/11.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nicknameTextField: UITextField!
    
    @IBOutlet weak var changeButton: UIButton!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nicknameTextField.placeholder = NSLocalizedString("nickname_placeholder", comment: "")
        nicknameTextField.placeholder = "nickname_placehoder".localized
        
        let value = NSLocalizedString("nickname_result", comment: "")
        resultLabel.text = String(format: value, "고래밥", "다마고치", "콩딱핑")
        
        resultLabel.text = "age_result".localized(number: 55)
        
        //mcd ctrl e
        let searchBar = UISearchBar()
        searchBar.placeholder = "self"
        searchBar.text = "ASDf"
        searchBar.showsCancelButton = false

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated) //ctrl + shift + 클릭
        print(#function)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated) //ctrl + shift + 클릭
        print(#function)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated) //ctrl + shift + 클릭
        print(#function)
    }

}

