//
//  CalObservable.swift
//  SeSAC_UnsplashProject
//
//  Created by 문정호 on 2023/09/13.
//

import Foundation

class Person {
    var listener: ((String)->Void)?
    
    var name: String {
        didSet{
            listener?(name)
            print("사용자의 이름이 \(name)로 변경되었습니다.")
        }
    }
    
    init(_ name: String) {
        self.name = name
    }
    
//    func introduce(_ number: Int, sample: @escaping (String) -> Void) {
//        print("저는 \(name)이고 행운의 숫자는 \(number)입니다.")
//        listener = sample
//        listener?()
//        luckyNumber = number
//    }
    
    func introduce(sample: @escaping (String) -> Void) {
        print("저는 \(name)입니다.")
        listener = sample
        listener?(name)
    }
}
