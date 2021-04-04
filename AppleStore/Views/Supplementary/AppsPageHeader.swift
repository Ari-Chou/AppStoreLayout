//
//  AppsPageHeader.swift
//  AppleStore
//
//  Created by AriChou on 4/4/21.
//

import UIKit

class AppsPageHeader: UICollectionReusableView {
    
    // MARK: - Propertise
    let appsHeaderHorizontalController = AppsHeaderHorizontalController()
    
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
extension AppsPageHeader {
    private func layoutUI() {
        addSubview(appsHeaderHorizontalController.view)
        appsHeaderHorizontalController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            appsHeaderHorizontalController.view.topAnchor.constraint(equalTo: self.topAnchor),
            appsHeaderHorizontalController.view.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            appsHeaderHorizontalController.view.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            appsHeaderHorizontalController.view.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
