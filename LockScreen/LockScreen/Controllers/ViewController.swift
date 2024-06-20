//
//  ViewController.swift
//  LockScreen
//
//  Created by Trần Hải Ninh on 19/6/24.
//

import UIKit


struct CirclePasswordColor {
    var emptyColor: UIColor
    var fullColor: UIColor
}

struct ButtonInformation {
    var title: String?
    var subTitle: String?
    var tag: Int
}

class ViewController: UIViewController {
    
    let correctPassword = [1,2,3,4,5,6]
    
    var enteredPassword: [Int] = []
    
    var circlePasswordColor = CirclePasswordColor(emptyColor: .white, fullColor: .black)
    
    @IBOutlet var viewController: UIView!
    
    @IBOutlet var numButtons: [RoundViewButton]!
    
    @IBOutlet var circlePasswordHolders: [RoundView]!
    
    func removeEnteredPassword() {
        for (index, circle) in circlePasswordHolders.enumerated() {
            if (index < enteredPassword.count) {
                fadedCircle(circle: circle)
            }
        }
        updateCircleViews()
        enteredPassword.removeAll()
    }
    
    func updateCircleViews() {
        for (index, circle) in circlePasswordHolders.enumerated() {
            if index < enteredPassword.count {
                circle.backgroundColor = circlePasswordColor.fullColor
            } else {
                circle.backgroundColor = circlePasswordColor.emptyColor
            }
        }
    }
    
    func shakeCircles() {
        let shakeDuration: TimeInterval = 0.1
        let shakeDistance: CGFloat = 15.0
        
        UIView.animate(withDuration: shakeDuration, animations: {
            for circle in self.circlePasswordHolders {
                circle.transform = CGAffineTransform(translationX: -shakeDistance, y: 0)
            }
        }) { _ in
            UIView.animate(withDuration: shakeDuration, animations: {
                for circle in self.circlePasswordHolders {
                    circle.transform = CGAffineTransform(translationX: shakeDistance, y: 0)
                }
            }) { _ in
                UIView.animate(withDuration: shakeDuration, animations: {
                    for circle in self.circlePasswordHolders {
                        circle.transform = CGAffineTransform.identity
                    }
                })
            }
        }
    }
    
    func fadedCircle(circle: UIView) {
        UIView.animate(withDuration: 0.1, animations: {circle.alpha = 0.0})
        {
            _ in
            UIView.animate(withDuration: 0.1, animations: {
                circle.alpha = 1.0
                circle.backgroundColor = self.circlePasswordColor.emptyColor
                circle.transform = CGAffineTransform.identity
            })
        }
    }
    
    func suffleNumberButtons() {
        
        var suffleButtons: [ButtonInformation] = []
        
        for button in numButtons {
            suffleButtons.append(ButtonInformation(title: button.titleLabel?.text, subTitle: button.subtitleLabel?.text, tag: button.tag))
        }
        
        for (button, suffleButton) in zip(numButtons, suffleButtons.shuffled()) {
            button.tag = suffleButton.tag
            button.setTitleKeepingFont(suffleButton.title)
            button.configuration?.subtitle = suffleButton.subTitle
        }
        
    }
    
    
    
    @IBAction func numButtonsPressed(_ sender: UIButton) {
        
        enteredPassword.append(sender.tag)
        print(enteredPassword)
        updateCircleViews()
        
        if (enteredPassword.count == 6) {
            if (enteredPassword == correctPassword) {
                let controller = storyboard?.instantiateViewController(identifier: "HomeVC")
                
                controller?.modalPresentationStyle = .fullScreen
                
                present(controller!, animated: true)
            } else {
                shakeCircles()
                removeEnteredPassword()
            }
        }
    }
    
    @IBAction func clearButtonPressed(_ sender: Any) {
        removeEnteredPassword()
    }
    
    @IBAction func deleteButtonPressed(_ sender: Any) {
        if(!enteredPassword.isEmpty) {
            
            enteredPassword.removeLast()
            
            fadedCircle(circle: circlePasswordHolders[enteredPassword.count])
            
            updateCircleViews()
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        suffleNumberButtons()
        
        viewController.backgroundColor = .yellow
        
        if (traitCollection.userInterfaceStyle == .dark) {
            circlePasswordColor.emptyColor = .black
            circlePasswordColor.fullColor = .white
        } else {
            circlePasswordColor.emptyColor = .white
            circlePasswordColor.fullColor = .black
        }
        
        updateCircleViews()
    }
    
}
