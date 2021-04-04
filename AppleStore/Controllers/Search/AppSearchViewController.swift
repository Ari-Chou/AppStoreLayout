//
//  AppSearchViewController.swift
//  AppleStore
//
//  Created by AriChou on 4/3/21.
//

import UIKit
import SDWebImage

class AppSearchViewController: BaseCollectionViewController, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Propertise
    fileprivate let cellID = "cell"
    fileprivate var searchResults = [Result]()
    fileprivate var timer: Timer?
    fileprivate let searchController = UISearchController(searchResultsController: nil)
    
    fileprivate let enterSearchTermLabel: UILabel = {
       let label = UILabel()
        label.text = "Game, App, and More"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .systemGray
        return label
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(SearchResultsCell.self, forCellWithReuseIdentifier: cellID)
        setupSearchBar()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.addSubview(enterSearchTermLabel)
        enterSearchTermLabel.frame = collectionView.bounds
    }
    
    // MARK: - Functions
    private func fetchItunesApp() {
        APIService.shared.fetchApps(searchTerm: "instagram") {[weak self] (results) in
            self?.searchResults = results
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }
    
    // Setup Search Bar
    private func setupSearchBar() {
        definesPresentationContext = true
        navigationItem.searchController = self.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
}

extension AppSearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            APIService.shared.fetchApps(searchTerm: searchText) {[weak self] (results) in
                self?.searchResults = results
                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                }
            }
        })
    }
}

// MARK: - Layout Collection View
extension AppSearchViewController {
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! SearchResultsCell
        let searchResult = searchResults[indexPath.item]
        cell.searchResult = searchResult
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        enterSearchTermLabel.isHidden = searchResults.count != 0
        return searchResults.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
}
