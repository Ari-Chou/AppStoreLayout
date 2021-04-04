//
//  SearchResultsCell.swift
//  AppleStore
//
//  Created by AriChou on 4/3/21.
//

import UIKit

class SearchResultsCell: UICollectionViewCell {
    
    var searchResult: Result! {
        didSet {
            nameLabel.text = searchResult.trackName
            categoryLabel.text = searchResult.primaryGenreName
            ratingsLabel.text = "Rating\(searchResult.averageUserRating ?? 0)"
            appIcomImageView.sd_setImage(with: URL(string: searchResult.artworkUrl100), completed: nil)
            screenshot1ImageView.sd_setImage(with: URL(string:searchResult.screenshotUrls[0]), completed: nil)
            if searchResult.screenshotUrls.count > 1 {
                screenshot2ImageView.sd_setImage(with: URL(string:searchResult.screenshotUrls[1]), completed: nil)
            }
            if searchResult.screenshotUrls.count > 2 {
                screenshot3ImageView.sd_setImage(with: URL(string:searchResult.screenshotUrls[2]), completed: nil)
            }
        }
    }
    
    // MARK: - Properties
    let appIcomImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .systemGray
        iv.clipsToBounds = true
        iv.widthAnchor.constraint(equalToConstant: 64).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 64).isActive = true
        iv.layer.cornerRadius = 12
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "APP NAME"
        return label
    }()
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Photos & Video"
        return label
    }()
    
    let ratingsLabel: UILabel = {
        let label = UILabel()
        label.text = "9.26M"
        return label
    }()
    
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
    
    lazy var screenshot1ImageView = self.createScreenshotImageView()
    lazy var screenshot2ImageView = self.createScreenshotImageView()
    lazy var screenshot3ImageView = self.createScreenshotImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//.......................................................................................
// MARK: - Functions
//.......................................................................................
extension SearchResultsCell {
    private func createScreenshotImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.contentMode = .scaleAspectFill
        return imageView
    }
}


// MARK: - Lyout SubViews
extension SearchResultsCell {
    private func layoutUI() {
        let labelStackView = VerticalStackView(arrangeSubViews: [nameLabel, categoryLabel, ratingsLabel], spacing: 0)
        
        let topInfoStackView = UIStackView(arrangedSubviews: [appIcomImageView, labelStackView, getButton])
        topInfoStackView.spacing = 12
        topInfoStackView.alignment = .center
        
        let screenshotsStackView = UIStackView(arrangedSubviews: [screenshot1ImageView, screenshot2ImageView, screenshot3ImageView])
        screenshotsStackView.spacing = 12
        screenshotsStackView.distribution = .fillEqually
        
        let overallStackView = VerticalStackView(arrangeSubViews: [topInfoStackView, screenshotsStackView], spacing: 16)
        
        addSubview(overallStackView)
        NSLayoutConstraint.activate([
            overallStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            overallStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            overallStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            overallStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
        ])
    }
}
