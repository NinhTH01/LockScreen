//
//  NumpadView.swift
//  LockScreen
//
//  Created by Trần Hải Ninh on 21/6/24.
//

import UIKit

class NumpadView: UIView {
    // MARK: - IBInspectable
    private let titleLabel = UILabel()
    
    private let subtitleLabel = UILabel()
    
    @IBInspectable var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    @IBInspectable var subtitle: String? {
        didSet {
            subtitleLabel.text = subtitle
        }
    }
    
    // MARK: - Lifecycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        makeRound(borderColour: .white, borderWidth: 0.0)
        
        backgroundColor = UIColor(white: 1, alpha: 0.35)
        
        assignLabels()
        
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        
        longPressGesture.minimumPressDuration = 0.0
        
        addGestureRecognizer(longPressGesture)
        
    }
    
    // MARK: - @objc func
    
    @objc private func handleLongPress(_ gesture: UILongPressGestureRecognizer) {
            if gesture.state == .began {
                UIView.animate(withDuration: 0.1) {
                    self.backgroundColor = UIColor(white: 1, alpha: 0.6)
                }
            } else if gesture.state == .ended || gesture.state == .cancelled {
                UIView.animate(withDuration: 0.1) {
                    self.backgroundColor = UIColor(white: 1, alpha: 0.35)
                }
            }
        }
    
    //MARK: - func
    
    func assignLabels() {
        self.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 42)
        
        print(subtitleLabel.text ?? "There is no subtitle")
        
        if (subtitleLabel.text != nil) {
            self.addSubview(subtitleLabel)
            subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
            subtitleLabel.textColor = UIColor.white
            subtitleLabel.font = UIFont.systemFont(ofSize: 13)
            
            NSLayoutConstraint.activate([
                titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: frame.height * 0.1),
                titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
                
                subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0),
                subtitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            ])
        } else {
            NSLayoutConstraint.activate([
                titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
                titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            ])
        }
    }
    
}
