//
//  AuthenticationManager.swift
//  NEMO
//
//  Created by Manar Magdy on 10/09/2019.
//  Copyright © 2019 Manar Magdy. All rights reserved.
//

import Foundation
import ObjectMapper

class AuthenticationManager {
    
    func loginUser(_ data: [String: String], completionHandler: ((LoginModel?, Error?) -> Void)!) {
        NemoServiceManager.doRequest(path: .login,
                                     method: .post,
                                     params: data, success: {
            (response) in
            
            if let userData = response as? [String: Any] {
                let userModel: LoginModel = Mapper<LoginModel>().map(JSON: userData)!
                completionHandler(userModel, nil)
            } else {
                completionHandler(nil, genericError())
            }
        }, failure: { (error) in
            debugPrint(error.localizedDescription)
            completionHandler(nil, genericError())
        })
    }
    
    func forgotPassword(_ email: String, completionHandler: ((LoginModel?, Error?) -> Void)!) {
        NemoServiceManager.doRequest(path: .forgetPassword(email: email), method: .get, success: {
            (response) in
            
            if let userData = response as? [String: Any] {
                let userModel: LoginModel = Mapper<LoginModel>().map(JSON: userData)!
                completionHandler(userModel, nil)
            } else {
                completionHandler(nil, genericError())
            }
        }, failure: { (error) in
            debugPrint(error.localizedDescription)
            completionHandler(nil, genericError())
        })
    }
    
    static func getUserData(_ completionHandler: ((UserModel?, Error?) -> Void)!) {
        NemoServiceManager.doRequest(path: .userInfo, method: .get, success: {
            (response) in

            if let userData = response as? [String: Any] {
                let userModel: UserModel = Mapper<UserModel>().map(JSON: userData)!
                completionHandler(userModel, nil)
            } else {
                completionHandler(nil, genericError())
            }
        }, failure: { (error) in
            debugPrint(error.localizedDescription)
            completionHandler(nil, genericError())
        })
    }
    
    static func registerNewUser(_ data: [String: String], completionHandler: ((LoginModel?, Error?) -> Void)!) {
        
        NemoServiceManager.doRequest(path: .register,
                                     method: .post,
                                     params: data, success: {
                                        (response) in
                                        
                                        if let userData = response as? [String: Any] {
                                            let userModel: LoginModel = Mapper<LoginModel>().map(JSON: userData)!
                                            completionHandler(userModel, nil)
                                        } else {
                                            completionHandler(nil, genericError())
                                        }
        }, failure: { (error) in
            debugPrint(error.localizedDescription)
            completionHandler(nil, genericError())
        })
    }
    
    static func editUser(_ data: [String: String], completionHandler: ((LoginModel?, Error?) -> Void)!) {
        
        NemoServiceManager.doRequest(path: .editUserInfo,
                                     method: .post,
                                     params: data, success: {
                                        (response) in
                                        
                                        if let userData = response as? [String: Any] {
                                            let userModel: LoginModel = Mapper<LoginModel>().map(JSON: userData)!
                                            completionHandler(userModel, nil)
                                        } else {
                                            completionHandler(nil, genericError())
                                        }
        }, failure: { (error) in
            debugPrint(error.localizedDescription)
            completionHandler(nil, genericError())
        })
    }
}
