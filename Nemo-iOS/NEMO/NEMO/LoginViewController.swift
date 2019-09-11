//
//  LoginViewController.swift
//  NEMO
//
//  Created by Manar Magdy on 09/09/2019.
//  Copyright © 2019 Manar Magdy. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet private weak var logoImageView: UIImageView!
    @IBOutlet private var inputViews: [UITextField]!
    
    public static func create() -> LoginViewController {
        return UIStoryboard(name: kStoryboardName, bundle: Bundle.main).instantiateViewController(withIdentifier: String(describing: self)) as! LoginViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboardWhenTappedAround()
        logoImageView.circularViewWithBorder(.white)
        logoImageView.dropCardShadow()
    }
    
    @IBAction private func backAction() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction private func login() {
        
        if inputViews[0].text!.isEmpty ||  inputViews[1].text!.isEmpty {
            showAlertView("Please, enter all the required information!", title: General.errorViewTitle)
        } else if !Generic.isValidEmail(inputViews[0].text!) {
            showAlertView( "Please, enter a valid mail!", title: General.errorViewTitle)
        } else {
            let loginData: [String: String] = ["email" : inputViews[0].text!,
                                               "password" : inputViews[1].text!]
            
            AuthenticationManager().loginUser(loginData, completionHandler: {
                [unowned self] (loginModel, error) in
                
                if let error = error {
                    self.showAlertView(error.localizedDescription, title: General.errorViewTitle)
                    return
                }
                if loginModel?.statusCode != 200 {
                    self.showAlertView(loginModel?.message ?? "Something went wrong please try again late!", title: General.errorViewTitle)
                } else {
                    
                    //                    Defaults[.username] = userModel?.nameuser ?? ""
                    //                    Defaults[.userId] = userModel?.iduser ?? ""
                    //                    self.present(HomeViewController.create(), animated: true)
                }
            })
        }
    }
}
