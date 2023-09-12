//
//  LoginViewModel.swift
//  SeSAC_UnsplashProject
//
//  Created by 문정호 on 2023/09/12.
//

import Foundation


class LoginViewModel {

    var id = Observable("a@a.com")
    var pw = Observable("1234")
    var isValid = Observable(false)
    
    func checkValidation() {
        if id.value.count >= 6 {
            isValid.value = true
        } else {
            isValid.value = false
        }
    }
    
    func signIn(completionHandler: @escaping ()->Void) {
        //서버, 닉네임, id
        UserDefaults.standard.set(id.value, forKey: "id")
        
        completionHandler()
    
    }
}
