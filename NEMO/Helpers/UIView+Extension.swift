//
//  UIView+Extension.swift
//  NEMO
//
//  Created by Manar Magdy on 10/09/2019.
//  Copyright © 2019 Manar Magdy. All rights reserved.
//

import UIKit

public extension UIView {
    
    /**
     This method provides rounded rectangle mask to the view.
     */
    func roundView() {
        self.layer.cornerRadius = 8;
        self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.layer.shadowRadius = 5;
        self.layer.shadowOpacity = 0.6;
        self.clipsToBounds = true;
        self.layer.shadowColor = UIColor.black.cgColor
    }
    
    /**
     This method provides rounded rectangle mask to the view with specific border color
     
     - parameter borderColor: the color that we want to use to color the view border, will use `lightGray` as a default value
    */
    func roundViewWithBorder(_ borderColor: UIColor?) {
        self.layer.borderWidth = 1.0
        self.layer.borderColor = borderColor?.cgColor ?? UIColor.lightGray.cgColor
        self.roundView()
    }
    
    /**
     This method provides circular view with border
     
     - parameter color: the color  that we want to circular
     
     */
    func circularView(color: CGColor? = nil) {
        self.layer.borderWidth = 1.0
        self.layer.masksToBounds = false
        self.layer.borderColor = color ?? UIColor.lightGray.cgColor
        self.layer.cornerRadius = self.frame.size.width/2
        self.clipsToBounds = true
    }
    
    /**
     This method provides circular view with border
     
     - parameter borderColor: the view border color
     
     */
    func circularViewWithBorder(_ borderColor: UIColor) {
        self.layer.borderWidth = 1.0
        self.layer.masksToBounds = false
        self.layer.borderColor = borderColor.cgColor
        self.layer.cornerRadius = self.frame.size.width/2
        self.clipsToBounds = true
    }
    
    /**
     This method provides a shadow for the view
     
     - parameter view: the view that we want to circular
     - parameter borderColor: the view border color
     
     */
    func dropCardShadow(){
        self.clipsToBounds = false
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize(width: 0, height: 1.5)
        self.layer.shadowRadius = 1.3
    }
}

