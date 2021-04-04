//
//  AppsViewController.swift
//  AppleStore
//
//  Created by AriChou on 4/3/21.
//

import UIKit

class AppsPageController: BaseCollectionViewController, UICollectionViewDelegateFlowLayout {
    // MARK: - Propertise
    fileprivate let cellID = "cell"
    fileprivate let headerID = "header"
    var groups = [AppGroup]()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(AppGroupCell.self, forCellWithReuseIdentifier: cellID)
        collectionView.register(AppsPageHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerID)
        fetchData()
    }
    
    // MARK: - Functions
    private func fetchData() {
        var dispatchGroup = DispatchGroup()
        var group1: AppGroup?
        var group2: AppGroup?
        var group3: AppGroup?
        
        dispatchGroup.enter()
        APIService.shared.fetchEditorChoiseGames {(editChoiseGroup, error) in
            dispatchGroup.leave()
            if let error = error {
                print("Apps Page Controller can not fetch the appGroup", error.localizedDescription)
                return
            }
            group1 = editChoiseGroup
        }
        
        dispatchGroup.enter()
        APIService.shared.fetchTopFree {(topFreeGroup, error) in
            dispatchGroup.leave()
            if let error = error {
                print("Apps Page Controller can not fetch the appGroup", error.localizedDescription)
                return
            }
            group2 = topFreeGroup
        }
        
        dispatchGroup.enter()
        APIService.shared.fetchTopGrossing {(topGrossing, error) in
            dispatchGroup.leave()
            if let error = error {
                print("Apps Page Controller can not fetch the appGroup", error.localizedDescription)
                return
            }
            group3 = topGrossing
        }
        
        dispatchGroup.notify(queue: .main) {
            if let group = group1 {
                self.groups.append(group)
            }
            if let group = group2 {
                self.groups.append(group)
            }
            if let group = group3 {
                self.groups.append(group)
            }
            self.collectionView.reloadData()
        }
    }
}

// MARK: - Layout Collection View
extension AppsPageController {
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! AppGroupCell
        let appGroup = groups[indexPath.item]
        cell.titleLabel.text = appGroup.feed.title
        cell.horizontalController.appGroup = appGroup
        cell.horizontalController.collectionView.reloadData()
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groups.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    // MARK: - Page Header
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerID, for: indexPath) as! AppsPageHeader
        return header
    }
    
    
}
