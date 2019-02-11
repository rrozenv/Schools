//
//  Fonts.swift
//  Library
//
//  Created by Robert Rozenvasser on 2/11/19.
//  Copyright © 2019 Cluk Labs. All rights reserved.
//

import Foundation

extension UIFont {
    /// Returns a bolded version of `self`.
    public var bolded: UIFont {
        return self.fontDescriptor.withSymbolicTraits(.traitBold)
            .map { UIFont(descriptor: $0, size: 0.0) } ?? self
    }
    
    /// Returns a italicized version of `self`.
    public var italicized: UIFont {
        return self.fontDescriptor.withSymbolicTraits(.traitItalic)
            .map { UIFont(descriptor: $0, size: 0.0) } ?? self
    }
    
    /// regular, 17pt font, 22pt leading, -24pt tracking
    public static func body(size: CGFloat? = nil) -> UIFont {
        return .preferredFont(style: .body, size: size)
    }
    
    /// regular, 16pt font, 21pt leading, -20pt tracking
    public static func callout(size: CGFloat? = nil) -> UIFont {
        return .preferredFont(style: .callout, size: size)
    }
    
    /// regular, 12pt font, 16pt leading, 0pt tracking
    public static func caption1(size: CGFloat? = nil) -> UIFont {
        return .preferredFont(style: .caption1, size: size)
    }
    
    /// regular, 11pt font, 13pt leading, 6pt tracking
    public static func caption2(size: CGFloat? = nil) -> UIFont {
        return .preferredFont(style: .caption2, size: size)
    }
    
    /// regular, 13pt font, 18pt leading, -6pt tracking
    public static func footnote(size: CGFloat? = nil) -> UIFont {
        return .preferredFont(style: .footnote, size: size)
    }
    
    /// semi-bold, 17pt font, 22pt leading, -24pt tracking
    public static func headline(size: CGFloat? = nil) -> UIFont {
        return .preferredFont(style: .headline, size: size)
    }
    
    /// regular, 15pt font, 20pt leading, -16pt tracking
    public static func subhead(size: CGFloat? = nil) -> UIFont {
        return .preferredFont(style: .subheadline, size: size)
    }
    
    /// light, 28pt font, 34pt leading, 13pt tracking
    public static func title1(size: CGFloat? = nil) -> UIFont {
        return .preferredFont(style: .title1, size: size)
    }
    
    /// regular, 22pt font, 28pt leading, 16pt tracking
    public static func title2(size: CGFloat? = nil) -> UIFont {
        return .preferredFont(style: .title2, size: size)
    }
    
    /// regular, 20pt font, 24pt leading, 19pt tracking
    public static func title3(size: CGFloat? = nil) -> UIFont {
        return .preferredFont(style: .title3, size: size)
    }
    
    /// Returns a monospaced font for numeric use.
    public var monospaced: UIFont {
        let monospacedDescriptor = self.fontDescriptor
            .addingAttributes(
                [
                    UIFontDescriptor.AttributeName.featureSettings: [
                        [
                            UIFontDescriptor.FeatureKey.featureIdentifier: kNumberSpacingType,
                            UIFontDescriptor.FeatureKey.typeIdentifier: kMonospacedNumbersSelector
                        ]
                    ]
                ]
        )
        
        return UIFont(descriptor: monospacedDescriptor, size: 0.0)
    }
    
    private static func preferredFont(style: UIFont.TextStyle, size: CGFloat? = nil) -> UIFont {
        
        let defaultSize: CGFloat
        let fontType: FontType
        
        switch style {
        case UIFont.TextStyle.body:
            defaultSize = 17
            fontType = .AvenirMedium
        case UIFont.TextStyle.callout:
            defaultSize = 16
            fontType = .AvenirHeavy
        case UIFont.TextStyle.caption1:
            defaultSize = 12
            fontType = .AvenirMedium
        case UIFont.TextStyle.caption2:
            defaultSize = 11
            fontType = .AvenirMedium
        case UIFont.TextStyle.footnote:
            defaultSize = 13
            fontType = .AvenirMedium
        case UIFont.TextStyle.headline:
            defaultSize = 17
            fontType = .AvenirMedium
        case UIFont.TextStyle.subheadline:
            defaultSize = 15
            fontType = .AvenirMedium
        case UIFont.TextStyle.title1:
            defaultSize = 28
            fontType = .AvenirMedium
        case UIFont.TextStyle.title2:
            defaultSize = 22
            fontType = .AvenirMedium
        case UIFont.TextStyle.title3:
            defaultSize = 20
            fontType = .AvenirMedium
        default:
            defaultSize = 17
            fontType = .AvenirMedium
        }
        
        return UIFontMetrics.default
            .scaledFont(for: UIFont(name: fontType.rawValue, size: size ?? defaultSize)!)
    }
    
    public enum FontType: String {
        case AvenirMedium = "Avenir-Medium"
        case AvenirHeavy = "Avenir-Heavy"
        case AvenirBlack = "Avenir-Black"
    }
    
}
