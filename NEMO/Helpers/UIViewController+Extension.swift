//
//  UIViewController+Extension.swift
//  NEMO
//
//  Created by Manar Magdy on 10/09/2019.
//  Copyright © 2019 Manar Magdy. All rights reserved.
//

import UIKit
import SCLAlertView

public var kStoryboardName = "Main"

extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    func showAlertView(_ msg: String, title: String, isSuccess: Bool? = false) {
        let alert = getCustomizedAlertView()
        alert.addButton("Done") {}
        if (isSuccess == true) {
            alert.showSuccess(title, subTitle: msg)
            return
        }
        alert.showError(title, subTitle: msg)
    }
    
    func getCustomizedAlertView() -> SCLAlertView {
        
        let appearance = SCLAlertView.SCLAppearance(
            kTitleFont: UIFont.boldSystemFont(ofSize: 20),
            kTextFont: UIFont.systemFont(ofSize: 14),
            kButtonFont: UIFont.systemFont(ofSize: 16),
            showCloseButton: false
        )
        
        return SCLAlertView(appearance: appearance)
    }
}
