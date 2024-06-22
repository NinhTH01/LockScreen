//
//  HomeViewController.swift
//  LockScreen
//
//  Created by Trần Hải Ninh on 20/6/24.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet var screen: UIView!
    
    
    
    
    func assignBackground() {
        let background = UIImage(named: "Background")
        let imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
        
        let firstView = UIView()
               firstView.backgroundColor = .red
               firstView.translatesAutoresizingMaskIntoConstraints = false
               
               let secondView = UIView()
               secondView.backgroundColor = .blue
               secondView.translatesAutoresizingMaskIntoConstraints = false
               
               view.addSubview(firstView)
               view.addSubview(secondView)
    }
    
    
    
    override func viewDidLoad() {
//        screen.backgroundColor = .yellow
        
        assignBackground()
    }
}
