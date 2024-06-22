//
//  RoundViewButton.swift
//  LockScreen
//
//  Created by Trần Hải Ninh on 18/6/24.
//

import Foundation
import UIKit

class RoundViewButton: UIButton {
    
    override func layoutSubviews() {
        super .layoutSubviews()
        
        switch (traitCollection.horizontalSizeClass, traitCollection.verticalSizeClass) {
        case (.compact, .regular), (.regular, .compact):
            titleLabel?.font = UIFont.systemFont(ofSize: 42.0)
            subtitleLabel?.font = UIFont.systemFont(ofSize: 13.0)
        case (.compact, .compact), (.regular, .regular):
            titleLabel?.font = UIFont.systemFont(ofSize: 32.0)
            subtitleLabel?.font = UIFont.systemFont(ofSize: 9.0)
        default:
            return
        }
        
        titleLabel?.textAlignment = .center
        subtitleLabel?.textAlignment = .center
        
        if (traitCollection.userInterfaceStyle == .dark) {
            makeRound(borderColour: .white, borderWidth: 1.0)
        } else {
            makeRound(borderColour: .black, borderWidth: 1.0)
        }
    }
    
}
