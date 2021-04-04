//
//  AppsHeaderHorizontalController.swift
//  AppleStore
//
//  Created by AriChou on 4/4/21.
//

import UIKit
import SDWebImage

class AppsHeaderHorizontalController: BaseCollectionViewController, UICollectionViewDelegateFlowLayout {
    // MARK: - Propertise
    fileprivate let cellID = "cell"
    var socialApps = [SocialApp]()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(AppsHeaderCell.self, forCellWithReuseIdentifier: cellID)
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
    }
    
    // MARK: - Functions
    
}


// MARK: - Layout Collection View
extension AppsHeaderHorizontalController {
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! AppsHeaderCell
        let socialApp = socialApps[indexPath.item]
        
        cell.componeyLabel.text = socialApp.name
        cell.titleLabel.text = socialApp.tagline
        cell.imageView.sd_setImage(with: URL(string: socialApp.imageUrl), completed: nil)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return socialApps.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 48, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 16, bottom: 0, right: 16)
    }
}

