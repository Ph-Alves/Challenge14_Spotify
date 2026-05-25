//
//  Helpers.swift
//  Spotify
//
//  Created by Daniela Valadares on 19/05/26.
//

import UIKit

// MARK: - Asset helpers

public extension UIColor {
    static func asset(_ name: String) -> UIColor {
        guard let color = UIColor(named: name) else {
            fatalError("Color '\(name)' não encontrada em Assets.xcassets")
        }
        return color
    }
    static let appBackground = UIColor(red: 0.09, green: 0.09, blue: 0.09, alpha: 1)
    static let appSeparator = UIColor(white: 0.22, alpha: 1)
}

public extension UIImage {
    static func asset(_ name: String) -> UIImage {
        guard let img = UIImage(named: name) else {
            fatalError("Image '\(name)' não encontrada em Assets.xcassets")
        }
        return img
    }
}

public extension UIFont {
    func weighted(_ weight: UIFont.Weight) -> UIFont {
        UIFont(descriptor: fontDescriptor.addingAttributes(
            [.traits: [UIFontDescriptor.TraitKey.weight: weight]]), size: 0)
    }
}

public func activate(_ constraint: [NSLayoutConstraint]) { NSLayoutConstraint.activate(constraint) }
