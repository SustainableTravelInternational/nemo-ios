//
//  Generics.swift
//  NEMO
//
//  Created by Manar Magdy on 10/09/2019.
//  Copyright © 2019 Manar Magdy. All rights reserved.
//

import Foundation

class Generic {
    static let userDef = UserDefaults.standard
    
    static func isValidEmail(_ mail:String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: mail)
    }
    
    static func saveObject(_ key: String, value: Any?) {
        
        if let value = value {
            do {
                let userDataEncoded = try NSKeyedArchiver.archivedData(withRootObject: value, requiringSecureCoding: false)
                userDef.set(userDataEncoded, forKey: key)
                debugPrint("User data successfully saved.")
            } catch {
                debugPrint("Failed to save user data...")
            }
        } else {
            userDef.set(nil, forKey: key)
        }
        userDef.synchronize()
    }
    
    static func getObjectDefault(_ key: String) -> Any? {
        if let decodedNSData = UserDefaults.standard.object(forKey: key) as? NSData,
            let Data = NSKeyedUnarchiver.unarchiveObject(with: decodedNSData as Data) {
            return Data
        } else {
            debugPrint("Failed")
            return nil
        }
    }
}

