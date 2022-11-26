//
//  RoundedImageView.swift
//  CatApiApp
//
//  Created by Kamil Caglar on 25/11/2022.
//

import UIKit

@IBDesignable
class RoundedImageView: UIImageView {
    override init(image: UIImage?) {
        super.init(image: image)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
       //layoutSubviews()
        corder()
        //doSomething()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.masksToBounds = true
        self.layer.cornerRadius = 50
        self.clipsToBounds = true
    }
    func doSomething() {
        layer.cornerRadius = 75
        clipsToBounds = true
        
    }
    func corder() {
        layer.cornerRadius = 100
        clipsToBounds = true
        layer.borderWidth = 1
        layer.borderColor = UIColor.white.cgColor
    }
    
}
