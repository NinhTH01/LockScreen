//
//  ButtonViewExtension.swift
//  LockScreen
//
//  Created by Trần Hải Ninh on 20/6/24.
//

import UIKit

extension UIButton {
    func setTitleKeepingFont(_ title: String?) {
            guard
                configuration != nil,
                let title,
                let currentFont = titleLabel?.font
            else {
                setTitle(title, for: .normal)
                return
            }

            let attributes: [NSAttributedString.Key: Any] = [
                .font: currentFont
            ]
            let attributedTitle = NSAttributedString(string: title, attributes: attributes)
            setAttributedTitle(attributedTitle, for: .normal)
        }
}
