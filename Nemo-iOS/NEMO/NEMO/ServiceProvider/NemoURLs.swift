//
//  NemoURLs.swift
//  NEMO
//
//  Created by Manar Magdy on 09/09/2019.
//  Copyright © 2019 Manar Magdy. All rights reserved.
//

import Foundation


enum NemoURLs {
    
    enum UrlEnvironment  {
        case baseUrl
        func getBaseUrl() -> String {
            switch self {
            case .baseUrl:
                return "http://10.156.26.62:8000/api/"
            }
        }
    }
    
    enum Path {
        
        case login
        case forgetPassword(email: String)
        case register
        case userInfo
        case editUserInfo
        case home
        
        var absolutePath: String {
            switch self {
            case .login:
                return "user/login"
            case .forgetPassword(let email):
                return "/\(email)"
            case .register:
                return "user/register"
            case .userInfo:
                return ""
            case .editUserInfo:
                return ""
            case .home:
                return "photoes"
            }
        }
    }
    
    enum HttpMethod: String {
        case get = "GET"
        case post = "POST"
        case put = "PUT"
    }
}
