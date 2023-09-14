//
//  SampleViewModel.swift
//  SeSAC_UnsplashProject
//
//  Created by 문정호 on 2023/09/12.
//

import Foundation

struct User {
    let name: String
    let age: Int
    
    var introduce: String {
        return "\(name), \(age)살"
    }
}

class SampleViewModel {
    let list = [User(name: "Hue", age: 23), User(name: "Jack", age: 21), User(name: "Kokojong", age: 20), User(name: "Bran", age: 20)]
    
    var numberofRowsInSection: Int{
        get{ return list.count}
    }
    
    func cellForRowAt(at indexPath: IndexPath) -> User {
        return list[indexPath.row]
    }
}
