//
//  VerticalStackView.swift
//  AppleStore
//
//  Created by AriChou on 4/3/21.
//

import UIKit

class VerticalStackView: UIStackView {
    init(arrangeSubViews: [UIView], spacing: CGFloat) {
        super.init(frame: .zero)
        self.axis = .vertical
        self.spacing = spacing
        arrangeSubViews.forEach({addArrangedSubview($0)})
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
