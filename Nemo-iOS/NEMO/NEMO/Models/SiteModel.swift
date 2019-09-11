//
//  SiteModel.swift
//  NEMO
//
//  Created by Manar Magdy on 11/09/2019.
//  Copyright © 2019 Manar Magdy. All rights reserved.
//

import Foundation
import ObjectMapper

class SiteModel : NSObject, NSCoding, Mappable {
    
    var name : String?
    var profilePhoto : String?
    var sitePhoto : String?
    var creationDate : String?
    var notes : String?
    var divingSiteName : String?
    

    class func newInstance(map: Map) -> Mappable?{
        return SiteModel()
    }
    required init?(map: Map){}
    private override init(){}
    
    func mapping(map: Map)
    {
        name <- map["name"]
        profilePhoto <- map["profile_photo"]
        sitePhoto <- map["photo"]
        creationDate <- map["created_at"]
        notes <- map["notes"]
        divingSiteName <- map["diving_site"]
        
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        name = aDecoder.decodeObject(forKey: "name") as? String
        profilePhoto = aDecoder.decodeObject(forKey: "profile_photo") as? String
        sitePhoto = aDecoder.decodeObject(forKey: "photo") as? String
        creationDate = aDecoder.decodeObject(forKey: "created_at") as? String
        notes = aDecoder.decodeObject(forKey: "notes") as? String
        divingSiteName = aDecoder.decodeObject(forKey: "diving_site") as? String
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if profilePhoto != nil{
            aCoder.encode(profilePhoto, forKey: "profile_photo")
        }
        if sitePhoto != nil{
            aCoder.encode(sitePhoto, forKey: "photo")
        }
        if creationDate != nil{
            aCoder.encode(creationDate, forKey: "created_at")
        }
        if notes != nil{
            aCoder.encode(notes, forKey: "notes")
        }
        if divingSiteName != nil{
            aCoder.encode(divingSiteName, forKey: "diving_site")
        }
    }
}

