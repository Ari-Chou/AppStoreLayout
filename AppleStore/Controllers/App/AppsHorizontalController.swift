//
//  AppsHorizontalController.swift
//  AppleStore
//
//  Created by AriChou on 4/4/21.
//

import UIKit
import SDWebImage

class AppsHorizontalController: BaseCollectionViewController, UICollectionViewDelegateFlowLayout{
    // MARK: - Propertise
    fileprivate let cellID = "cell"
    fileprivate let topBottomPadding: CGFloat = 12
    fileprivate let spacing: CGFloat = 10
    var appGroup: AppGroup?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(AppsHorizontalCell.self, forCellWithReuseIdentifier: cellID)
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
    }
}

// MARK: - Layout Collection View
extension AppsHorizontalController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appGroup?.feed.results.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! AppsHorizontalCell
        cell.appNameLabel.text = appGroup?.feed.results[indexPath.item].name
        cell.componeyLabel.text = appGroup?.feed.results[indexPath.item].artistName
        cell.appIcomImageView.sd_setImage(with:URL(string:(appGroup?.feed.results[indexPath.item].artworkUrl100)!), completed: nil)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 48, height: (view.frame.height - topBottomPadding * 2 - spacing * 2) / 3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: topBottomPadding, left: 16, bottom: topBottomPadding, right: 16)
    }
}
