//
//  NextButton.swift
//  CatApiApp
//
//  Created by Kamil Caglar on 25/11/2022.
//

import UIKit

class IButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
 
    
    func setupButton() {
        setShadow()
        setTitleColor(.white, for: .normal)
        titleLabel?.font     = UIFont(name: "AvenirNext-DemiBold", size: 18)
        layer.cornerRadius   = 25
        layer.borderWidth    = 1.0
        layer.borderColor    = UIColor.white.cgColor
    }
    
    
    private func setShadow() {
        layer.shadowColor   = UIColor.black.cgColor
        layer.shadowOffset  = CGSize(width: 0.0, height: 6.0)
        layer.shadowRadius  = 8
        layer.shadowOpacity = 0.5
        clipsToBounds       = true
        layer.masksToBounds = false
    }
    
    func bounce() {
        
        let bounce = CASpringAnimation(keyPath: "opacity")
        bounce.duration = 0.2
        bounce.fromValue = 0
        bounce.toValue = 1
        //bounce.autoreverses = true
        //bounce.repeatCount = 0.2
       // bounce.initialVelocity = 0.3
      //  bounce.damping = 0.7
        layer.add(bounce, forKey: nil)
    }
    
    func position() {
        
    }
    
    
    
    func cornerRadiusAnimation() {
        
        
        let cornerRadius           = CABasicAnimation(keyPath: "cornerRadius")
        cornerRadius.duration      = 0.5
        cornerRadius.repeatCount   = 0.99
        cornerRadius.autoreverses  = true
        
       // let fromPoint       = CGPoint(x: center.x - 1, y: center.y)
        let fromValue       = 0.0
        
      //  let toPoint         = CGPoint(x: center.x + 100, y: center.y)
        let toValue         = 300
        
        cornerRadius.fromValue     = fromValue
        cornerRadius.toValue       = toValue
        
        layer.add(cornerRadius, forKey: "position")
    }
    
    
//    func styleNextButton() {
//
//       backgroundColor = .white
//
//       layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
//
//       layer.cornerRadius = 35
//
//    }
    
    
}
