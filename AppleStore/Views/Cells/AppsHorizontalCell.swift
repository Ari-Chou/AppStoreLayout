//
//  AppsHorizontalCell.swift
//  AppleStore
//
//  Created by AriChou on 4/4/21.
//

import UIKit

class AppsHorizontalCell: UICollectionViewCell {
    
    // MARK: - Propertise
    let appIcomImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .systemGray
        iv.clipsToBounds = true
        iv.widthAnchor.constraint(equalToConstant: 64).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 64).isActive = true
        iv.layer.cornerRadius = 12
        return iv
    }()
    
    let appNameLabel = UILabel(text: "App Name", font: UIFont.systemFont(ofSize: 16), textColor: nil)
    let componeyLabel = UILabel(text: "Componey", font: UIFont.systemFont(ofSize: 16), textColor: UIColor.systemGray)
    
    let getButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("GET", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.backgroundColor = UIColor(white: 0.95, alpha: 1)
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        button.layer.cornerRadius = 16
        return button
    }()
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layoutUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Lyout SubViews
extension AppsHorizontalCell {
    private func layoutUI() {
        let labelStackView = UIStackView(arrangedSubviews: [appNameLabel, componeyLabel])
        labelStackView.axis = .vertical
        
        let overAllStackView = UIStackView(arrangedSubviews: [appIcomImageView, labelStackView, getButton])
        overAllStackView.spacing = 12
        overAllStackView.alignment = .center
        overAllStackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(overAllStackView)
        
        NSLayoutConstraint.activate([
            overAllStackView.topAnchor.constraint(equalTo: self.topAnchor),
            overAllStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            overAllStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            overAllStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
