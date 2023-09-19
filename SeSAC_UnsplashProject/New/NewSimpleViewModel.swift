//
//  NewSimpleViewModel.swift
//  SeSAC_UnsplashProject
//
//  Created by 문정호 on 2023/09/18.
//

import Foundation

class NewSimpleViewModel{
    var list2 = [User(name: "Jack", age: 23),User(name: "Jack", age: 23), User(name: "Hue", age: 21), User(name: "Kokojong", age: 20), User(name: "Bran", age: 20)]
    
    let list: Observable<[User]> = Observable([])
    
    func append(){
        list.value = [User(name: "Hue", age: 23),User(name: "Hue", age: 23), User(name: "Jack", age: 21), User(name: "Kokojong", age: 20), User(name: "Bran", age: 20)]
    }
    
    func remove(){
        list.value = []
    }
    
    func removeUser(_ idx: Int) {
        list.value.remove(at: idx)
    }
    
    func insertUser(name: String){
        let user = User(name: name, age: Int.random(in: 1...70))
        list.value.insert(user, at: Int.random(in: 0...2))
                
    }
}
