//
//  UILabel+EXT.swift
//  AppleStore
//
//  Created by AriChou on 4/3/21.
//

import UIKit

extension UILabel {
    convenience init(text: String, font: UIFont, textColor: UIColor?) {
        self.init(frame: .zero)
        self.text = text
        self.font = font
        self.textColor = textColor
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UIImageView {
    convenience init(cornerRadius: CGFloat) {
        self.init(image: nil)
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
        self.contentMode = .scaleAspectFill
    }
}
