//
//  SampleViewModel.swift
//  SeSAC_UnsplashProject
//
//  Created by 문정호 on 2023/09/12.
//

import Foundation


//struct를 class로 바꾸게 되면 다음과 같이 2가지 메서드를 추가로 구현해줘야함.
class User: Hashable {
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id) //아이디를 가지고 판별
    }
    
    let name: String
    let age: Int
    let id = UUID().uuidString //Unique. name age가 같더라도 문제가 생기지 않게
    
    var introduce: String {
        return "\(name), \(age)살"
    }
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
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
