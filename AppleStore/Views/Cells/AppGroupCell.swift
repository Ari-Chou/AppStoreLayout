//
//  AppGroupCell.swift
//  AppleStore
//
//  Created by AriChou on 4/3/21.
//

import UIKit

class AppGroupCell: UICollectionViewCell {
    
    // MARK: - Propertise
    let titleLabel = UILabel(text: "App Section", font: UIFont.systemFont(ofSize: 30, weight: .bold), textColor: nil)
    let horizontalController = AppsHorizontalController()
    
    
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Layout SubViews
extension AppGroupCell {
    fileprivate func layoutUI() {
        addSubview(titleLabel)
        addSubview(horizontalController.view)
        horizontalController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor,constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -5),
            
            horizontalController.view.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            horizontalController.view.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            horizontalController.view.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            horizontalController.view.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
