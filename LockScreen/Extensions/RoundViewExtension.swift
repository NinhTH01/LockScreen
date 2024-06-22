//
//  RoundViewExtension.swift
//  LockScreen
//
//  Created by Trần Hải Ninh on 18/6/24.
//

import UIKit

extension UIView {
    func makeRound(borderColour: UIColor, borderWidth: CGFloat) {
        layer.cornerRadius = (frame.size.width < frame.size.height) ? frame.size.width / 2.0 : frame.size.height / 2.0
        layer.borderColor = borderColour.cgColor
        layer.borderWidth = borderWidth
    }
    
}
