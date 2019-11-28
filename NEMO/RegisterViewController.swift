//
//  RegisterViewController.swift
//  NEMO
//
//  Created by Manar Magdy on 09/09/2019.
//  Copyright © 2019 Manar Magdy. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet private weak var logoImageView: UIImageView!
    @IBOutlet private var inputViews: [UITextField]!
    
    public static func create() -> RegisterViewController {
        return UIStoryboard(name: kStoryboardName, bundle: Bundle.main).instantiateViewController(withIdentifier: String(describing: self)) as! RegisterViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboardWhenTappedAround()
        logoImageView.circularViewWithBorder(.white)
        logoImageView.dropCardShadow()
    }
    
    @IBAction private func registerNewUser() {
        
        if !validateUserData() { return }
        
        let registerationData: [String: String] = ["name" : inputViews[0].text!,
                                                   "email" : inputViews[1].text!,
                                                   "password" : inputViews[2].text!,
                                                   "password_confirmation" : inputViews[3].text!]
        
        AuthenticationManager.registerNewUser(registerationData) {
            [unowned self] (loginModel, error) in
            
            if let error = error {
                self.showAlertView(error.localizedDescription, title: General.errorViewTitle)
                return
            }
            
            if loginModel?.statusCode != 200 {
                self.showAlertView(loginModel?.message ?? "Something went wrong please try again late!", title: General.errorViewTitle)
            } else {
                self.showAlertView("Registeration done successfully!", title: General.successViewTitle, isSuccess: true)
//                self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    // MARK: - Validate User Data
    private func validateUserData() -> Bool {
        for field in inputViews {
            if field.text?.isEmpty == true {
                showAlertView("Please, enter all the required information!", title: General.errorViewTitle)
                return false
            }
        }
        if !Generic.isValidEmail(inputViews[1].text!){
            showAlertView( "Please, enter a valid mail!", title: General.errorViewTitle)
            return false
        }
        if inputViews[3].text != inputViews[2].text {
            showAlertView( "The password confirmation does not match.", title: General.errorViewTitle)
            return false
        }
        return true
    }
    
    @IBAction private func backAction() {
        dismiss(animated: true, completion: nil)
    }
}
