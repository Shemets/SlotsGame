//
//  UIButton + Underline.swift
//  SlotsTest
//
//  Created by Shemets on 02/01/2023.
//

import Foundation
import UIKit

extension UIButton {
    func underline() {
        guard let text = self.titleLabel?.text else { return }
       
        
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: text.count))

        self.setAttributedTitle(attributedString, for: .normal)
    }
}

extension NSMutableAttributedString {

func underline(term: String) -> NSMutableAttributedString {
    guard let underlineRange = string.range(of: term) else {
        return NSMutableAttributedString()
    }
    let startPosition = string.distance(from: term.startIndex, to: underlineRange.lowerBound)
    let nsrange = NSRange(location: startPosition, length: term.count)
    addAttribute(
        .underlineStyle,
        value: NSUnderlineStyle.single.rawValue,
        range: nsrange)
    return self
    }
}
