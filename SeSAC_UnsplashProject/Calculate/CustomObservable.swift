//
//  CustomObservable.swift
//  SeSAC_UnsplashProject
//
//  Created by 문정호 on 2023/09/13.
//

import Foundation

class CustomObservable<T> {
    var listener: ((T)->Void)?
    
    var value: T {
        didSet{
            listener?(value)
            print("값이 \(value)로 변경되었습니다.")
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(sample: @escaping (T) -> Void) {
        listener = sample
        listener?(value)
    }
}
