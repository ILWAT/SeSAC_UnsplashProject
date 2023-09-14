//
//  NewSimpleCollectionView.swift
//  SeSAC_UnsplashProject
//
//  Created by 문정호 on 2023/09/14.
//

import UIKit
import SnapKit

class NewSimpleCollectionView: UIViewController{
    
    let list = [User(name: "Hue", age: 23), User(name: "Jack", age: 21), User(name: "Kokojong", age: 20), User(name: "Bran", age: 20)]
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
    var cellRegistration: UICollectionView.CellRegistration<UICollectionViewListCell, User>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        //UICollectionView.cellRegistration : iOS 14, 메서드 대신 제네릭을 사용, 셀이 생성됟때마다 클로저가 호출
        cellRegistration = UICollectionView.CellRegistration(handler: { cell, indexPath, itemIdentifier in
            //셀 디자인 및 데이터 처리
            var content = UIListContentConfiguration.valueCell()
            content.text = itemIdentifier.name
            content.secondaryText = "\(itemIdentifier.age)"
            content.image = UIImage(systemName: "star.fill")
            content.imageProperties.tintColor = .systemRed
            content.prefersSideBySideTextAndSecondaryText = false
            content.textToSecondaryTextVerticalPadding = 20 //텍스트와 세컨더리 텍스트의 간격을 설정
            cell.contentConfiguration = content
            
            var backgroundConfig = UIBackgroundConfiguration.listPlainCell()
            backgroundConfig.backgroundColor = .lightGray
            backgroundConfig.cornerRadius = 10
            backgroundConfig.strokeColor = .systemPink
            backgroundConfig.strokeWidth = 2
            cell.backgroundConfiguration = backgroundConfig
        })
    }
    
    func createLayout() -> UICollectionViewLayout {
        var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        configuration.showsSeparators = false
        configuration.backgroundColor = .systemGreen
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        return layout
    }
}

extension NewSimpleCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: list[indexPath.item])
        return cell
        
    }
    
    
}
