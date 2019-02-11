//
//  Theme.swift
//  Library
//
//  Created by Robert Rozenvasser on 2/11/19.
//  Copyright © 2019 Cluk Labs. All rights reserved.
//

import Foundation

// MARK: Theme
/// Supports multiple color themes of app.
public enum Theme: Int {
    case theme1
    
    private enum Keys {
        static let selectedTheme = "SelectedTheme"
    }
    
    /// Current app color theme.
    public static var current: Theme {
        let storedTheme = UserDefaults.standard.integer(forKey: Keys.selectedTheme)
        return Theme(rawValue: storedTheme) ?? .theme1
    }
    
    /// Applies current theme.
    public func apply() {
        UserDefaults.standard.set(rawValue, forKey: Keys.selectedTheme)
        UserDefaults.standard.synchronize()
    }

    public var primaryTextColor: UIColor {
        switch self {
        case .theme1: return .black
        }
    }
    
    public var secondaryTextColor: UIColor {
        switch self {
        case .theme1: return .lightGray
        }
    }
    
}

// MARK: Custom Color Palette
public enum Palette {
    case appBackground
    
    public var color: UIColor {
        switch self {
        case .appBackground: return UIColor(hex: 0xFCFEFF)
        }
    }
}

// MARK: - Hex Color Extension
extension UIColor {
    
    convenience init(hex: Int) {
        let components = (
            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255
        )
        self.init(red: components.R, green: components.G, blue: components.B, alpha: 1)
    }
    
    class func forGradient(_ red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: 1.0)
    }
    
}
