//
//  LoginViewController.swift
//  SeSAC_UnsplashProject
//
//  Created by 문정호 on 2023/09/12.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var idTextField: UITextField!
    
    var viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginButton.addTarget(self, action: #selector(loginButtonClicked), for: .touchUpInside)
        idTextField.addTarget(self, action: #selector(idtextFieldChanged), for: .editingChanged)
        
        viewModel.id.bind { text in
            print("ID Bind \(text)")
            self.idTextField.text = text
        }
        
        viewModel.pw.bind { text in
            print("PW Bind \(text)")
            self.pwTextField.text = text
        }
        
        viewModel.isValid.bind { bool in
            self.loginButton.isEnabled = bool
            self.loginButton.backgroundColor = bool ? .green : .lightGray
        }
        
    }
    
    
    @objc func loginButtonClicked(_ sender: UIButton) { //유효성 검사가 성공했을때만 isEnable -> 로그인 버튼을 클릭 할 수 있기 때문에 눌리면
        
        viewModel.signIn {
            print("로그인 성공했기 때문에 얼럿 띄우기")
        }
    }
    
    @objc func idtextFieldChanged(){
        print("==",idTextField.text)
        viewModel.pw.value = idTextField.text!
        viewModel.checkValidation()
    }
    
    @objc func pwtextFieldChanged(){
        print("==",pwTextField.text)
        viewModel.id.value = idTextField.text!
        viewModel.checkValidation()
    }
    

}
