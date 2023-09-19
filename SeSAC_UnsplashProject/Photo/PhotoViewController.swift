//
//  PhotoViewController.swift
//  SeSAC_UnsplashProject
//
//  Created by 문정호 on 2023/09/12.
//

import UIKit

class PhotoViewController: UIViewController{

    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel = PhotoViewModel()
    
    var dataSource: UICollectionViewDiffableDataSource<Int, PhotoResult>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let searchBar = UISearchBar()
        searchBar.delegate = self
        navigationItem.titleView = searchBar
        
        collectionView.collectionViewLayout = createLayout()
        configureDataSource()
        
        viewModel.list.bind { _ in
            self.updateSnapShot()
        }
        
//        viewModel.list.bind { _ in
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//            }
//        }
    }
    
    private func createLayout() -> UICollectionViewLayout {
        var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        configuration.showsSeparators = false
        configuration.backgroundColor = .systemGreen
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        return layout
    }
    
    private func configureDataSource() {
        
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, PhotoResult> { cell, indexPath, itemIdentifier in
            var content = UIListContentConfiguration.valueCell()
            content.text = "\(itemIdentifier.likes)"
            DispatchQueue.global().async {
                let url = URL(string: itemIdentifier.urls.thumb)!
                let data = try? Data(contentsOf: url)
                DispatchQueue.main.async {
                    content.image = UIImage(data: data!)
                    cell.contentConfiguration = content
                }
            }
            
            
            
            
        }
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
            return cell
        })
    }
    
    private func updateSnapShot() {
        var snapshot = NSDiffableDataSourceSnapshot<Int, PhotoResult>()
        snapshot.appendSections([0])
        snapshot.appendItems(viewModel.list.value.results!)
        dataSource.apply(snapshot)
    }
    
}

extension PhotoViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        viewModel.fetchPhoto(text: searchBar.text!)
    }
}


//TalbeView + MVVM

//extension PhotoViewController: UITableViewDelegate, UITableViewDataSource{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return viewModel.rowCount
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "photoCell") else {return UITableViewCell()}
//
//        let data = viewModel.cellForRowAt(at: indexPath)
//
//        cell.backgroundColor = .lightGray
//
//        return cell
//    }
//}
