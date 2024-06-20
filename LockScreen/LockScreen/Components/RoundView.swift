//
//  RoundView.swift
//  LockScreen
//
//  Created by Trần Hải Ninh on 18/6/24.
//


import Foundation
import UIKit

class RoundView: UIView {
    override func awakeFromNib() {
        super .awakeFromNib()
        if (traitCollection.userInterfaceStyle == .dark) {
            makeRound(borderColour: .white, borderWidth: 1.0)
        } else {
            makeRound(borderColour: .black, borderWidth: 1.0)
        }
    }
}
