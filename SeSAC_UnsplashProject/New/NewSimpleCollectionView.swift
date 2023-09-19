//
//  NewSimpleCollectionView.swift
//  SeSAC_UnsplashProject
//
//  Created by 문정호 on 2023/09/14.
//

import UIKit
import SnapKit

class NewSimpleCollectionView: UIViewController{
    //MARK: - Enum
    enum Section: Int, CaseIterable{
        case first = 1000
        case second = 1
    }
    //MARK: - Properteis
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
//    var cellRegistration: UICollectionView.CellRegistration<UICollectionViewListCell, User>!
    
    var datasource: UICollectionViewDiffableDataSource<String, User>!
    
    var viewModel = NewSimpleViewModel()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGreen
        
        let searchBar = UISearchBar()
        searchBar.delegate = self
        navigationItem.titleView = searchBar
        
        view.addSubview(collectionView)
//        collectionView.delegate = self
//        collectionView.dataSource = self
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        configureDataSource()
        
        updateSnapshot()
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//            self.list.insert(User(name: "무너", age: 2), at: 2)
//            self.updateSnapshot()
//        }
//        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
//            self.list.remove(at: 2)
//            self.updateSnapshot()
//        }
        
        collectionView.delegate = self
        
        viewModel.list.bind { user in
            self.updateSnapshot()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.viewModel.append()
        }
    }
    
    //MARK: - Helper
    
    private func createLayout() -> UICollectionViewLayout {
        var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        configuration.showsSeparators = false
        configuration.backgroundColor = .systemGreen
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        return layout
    }
    
    func configureDataSource() {
        
        //UICollectionView.cellRegistration : iOS 14, 메서드 대신 제네릭을 사용, 셀이 생성될때마다 클로저가 호출
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, User> (handler: { cell, indexPath, itemIdentifier in
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
        
        datasource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueConfiguredReusableCell(using:cellRegistration, for: indexPath, item: itemIdentifier)
            return cell
        })
    }
    
    func updateSnapshot(){
        var snapshot = NSDiffableDataSourceSnapshot<String, User>()
        snapshot.appendSections(["고래밥", "Jack"]) //[first, second]
        snapshot.appendItems(viewModel.list.value, toSection: "고래밥") // toSection: 해당 섹션에 해당 아이템을 넣겠다.
        snapshot.appendItems(viewModel.list2, toSection: "Jack")
        
        datasource.apply(snapshot)
    }
    
    
    
    
}

extension NewSimpleCollectionView: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let user = viewModel.list.value[indexPath.item]
        
        guard let item = datasource.itemIdentifier(for: indexPath) else {
            return
        }
        
        dump(item)
//        viewModel.removeUser(indexPath.item)
    }
}

extension NewSimpleCollectionView: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        viewModel.insertUser(name: searchBar.text!)
    }
}

//extension NewSimpleCollectionView: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return list.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: list[indexPath.item])
//        return cell
//
//    }
//
//
//}
