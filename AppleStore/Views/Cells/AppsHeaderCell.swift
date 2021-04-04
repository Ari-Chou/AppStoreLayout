//
//  AppsHeaderCell.swift
//  AppleStore
//
//  Created by AriChou on 4/4/21.
//

import UIKit

class AppsHeaderCell: UICollectionViewCell {
    
    // MARK: - Propertise
    let componeyLabel = UILabel(text: "Facebook", font: UIFont.systemFont(ofSize: 12, weight: .bold), textColor: nil)
    let titleLabel = UILabel(text: "Keeping up whith friends fast than ever!", font: UIFont.systemFont(ofSize: 24, weight: .semibold), textColor: nil)
    let imageView = UIImageView(cornerRadius: 5)
    
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
extension AppsHeaderCell {
    fileprivate func layoutUI() {
        titleLabel.numberOfLines = 2
        imageView.backgroundColor = .red
        let verticalStackview = VerticalStackView(arrangeSubViews: [componeyLabel, titleLabel, imageView], spacing: 12)
        addSubview(verticalStackview)
        
        NSLayoutConstraint.activate([
            verticalStackview.topAnchor.constraint(equalTo: self.topAnchor),
            verticalStackview.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            verticalStackview.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            verticalStackview.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
