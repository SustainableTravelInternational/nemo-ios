//
//  NemoServiceManager.swift
//  NEMO
//
//  Created by Manar Magdy on 10/09/2019.
//  Copyright © 2019 Manar Magdy. All rights reserved.
//

import Foundation
import SVProgressHUD
import Alamofire

class NemoServiceManager {
    
    class func doRequest(path: NemoURLs.Path,
                         method: HTTPMethod,
                         params: [String: Any]? = nil,
                         success: @escaping (_ result: Any) -> Void,
                         failure: @escaping (_ err: Error) -> Void) {
        
        SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.black)
        SVProgressHUD.show()
        
        let urlString = "\(urlEnvironment.getBaseUrl())\(path.absolutePath)"
        let pathUrl = URL(string: urlString)!
        debugPrint("Get Request URL: \(pathUrl)")
        let header = ["Content-Type": "application/json"]
        Alamofire.request(pathUrl,
                          method: method,
                          parameters: params,
                          encoding: JSONEncoding.default,
                          headers: header).responseJSON { (response: DataResponse<Any>) in
                            
                            DispatchQueue.main.async(execute: {
                                SVProgressHUD.dismiss()
                            })
                            
                            switch response.result {
                            case .success(let value):
                                success(value)
                            case .failure(let error):
                                debugPrint(error)
                                failure(error)
                            }
        }
    }
    
    class var urlEnvironment: NemoURLs.UrlEnvironment {
        return .baseUrl
    }
}

func genericError() -> NSError {
    return NSError(domain: "somedomain",
                   code: 123,
                   userInfo: [NSLocalizedDescriptionKey : "Something went wrong, Please try again later!"])
}

