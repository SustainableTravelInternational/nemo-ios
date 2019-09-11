//
//  HomeManger.swift
//  NEMO
//
//  Created by Manar Magdy on 10/09/2019.
//  Copyright © 2019 Manar Magdy. All rights reserved.
//

import Foundation
import ObjectMapper


class HomeManger {
    
    static func getDivingSitesList(_ completionHandler: (([SiteModel]?, Error?) -> Void)!) {
        
        NemoServiceManager.doRequest(path: .home, method: .get, success: {
            (response) in
            
            if let dataList = response as? [[String: Any]] {
                var sites: [SiteModel] = []
                for item in dataList {
                    sites.append(Mapper<SiteModel>().map(JSON: item)!)
                }
                completionHandler(sites, nil)
            } else {
                completionHandler(nil, genericError())
            }
        }, failure: { (error) in
            debugPrint(error.localizedDescription)
            completionHandler(nil, genericError())
        })
    }
}

