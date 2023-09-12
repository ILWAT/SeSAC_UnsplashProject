//
//  PhotoViewModel.swift
//  SeSAC_UnsplashProject
//
//  Created by 문정호 on 2023/09/12.
//

import Foundation

class PhotoViewModel {
    
    var list = Observable(Photo(total: 0, total_pages: 0, results: []))
    
    
    func fetchPhoto() {
        APIService.shared.searchPhoto(query: "sky") { photo in
            guard let photo else {return}
            self.list.value = photo
        }
    }
    
    var rowCount: Int {
        get{ return list.value.results?.count ?? 0 }
    }
    
    func cellForRowAt(at indexPath: IndexPath) -> PhotoResult {
        return list.value.results![indexPath.row]
    }
}
