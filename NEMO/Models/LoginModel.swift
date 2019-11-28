//
//  LoginModel.swift
//  NEMO
//
//  Created by Manar Magdy on 10/09/2019.
//  Copyright © 2019 Manar Magdy. All rights reserved.
//

import Foundation
import ObjectMapper

class LoginModel : NSObject, NSCoding, Mappable {
    
    var token : String?
    var message : String?
    var statusCode : Int?
    
    class func newInstance(map: Map) -> Mappable?{
        return LoginModel()
    }
    required init?(map: Map){}
    private override init(){}
    
    func mapping(map: Map)
    {
        token <- map["token"]
        message <- map["message"]
        statusCode <- map["status"]
        
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        token = aDecoder.decodeObject(forKey: "token") as? String
        message = aDecoder.decodeObject(forKey: "message") as? String
        statusCode = aDecoder.decodeObject(forKey: "status") as? Int
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if token != nil{
            aCoder.encode(token, forKey: "token")
        }
        if message != nil{
            aCoder.encode(message, forKey: "message")
        }
        if statusCode != nil{
            aCoder.encode(statusCode, forKey: "status")
        }
    }
}
