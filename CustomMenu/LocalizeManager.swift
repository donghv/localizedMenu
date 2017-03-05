//
//  LocalizeManager.swift
//  CustomMenu
//
//  Created by Dong Hoang on 3/5/17.
//  Copyright © 2017 Dong Hoang. All rights reserved.
//

import Foundation

let LANGUAGE_CHANGED_NOTIFICATION = "LANGUAGE_CHANGED_NOTIFICATION"

enum LanguageKey: String {
    
    case English = "en"
    case French = "fr"
    case Japanese = "ja"
}

class LocalizedManager {
    
    static let shared = LocalizedManager()
    
    var languageKey:LanguageKey {
        set
        {
            key = newValue
            textResource = Bundle(path: Bundle.main.path(forResource: key.rawValue, ofType: "lproj")!)
            
            // Notify language changed
            NotificationCenter.default.post(name:
                NSNotification.Name(rawValue: LANGUAGE_CHANGED_NOTIFICATION),
                                            object: nil)
        }
        get
        {
            return key
        }
    }
    
    private var key:LanguageKey = LanguageKey.English
    private var textResource = Bundle(path: Bundle.main.path(forResource: "en", ofType: "lproj")!)
    
    func localizedString(forKey key:String) -> String?
    {
        return textResource?.localizedString(forKey: key, value: nil, table: nil)
    }
}
