//
//  JsonManager.swift
//  App_iOS_Over-Scene
//
//  Created by imac on 30/11/2016.
//  Copyright © 2016 imac. All rights reserved.
//

import Foundation

class SettingsManager {
    
    private static var s_instance:SettingsManager?
    
    public static var instance:SettingsManager {
        if s_instance == nil {
            s_instance = SettingsManager()
        }
        return s_instance!
    }
    
    private static let FAV_EVENT_KEY = "FAV_EVENT_KEY"
    private let _userDefaults:UserDefaults
    var favEventsArray:[Event]!
    
    private init() {
        _userDefaults = UserDefaults.standard
        let eventsList:[Event] = []
        let defaultsValues = [
            SettingsManager.FAV_EVENT_KEY:eventsList
            ] as [String : Any]
        _userDefaults.register(defaults: defaultsValues)
    }
    
    func getFavEventsArray() -> [Event] {
       
        favEventsArray = _userDefaults.object(forKey: SettingsManager.FAV_EVENT_KEY) as! [Event]
        return favEventsArray
    }
    
    func setFavEventsArray(eventsArray:[String:String]){
        _userDefaults.set(eventsArray, forKey: SettingsManager.FAV_EVENT_KEY)
    }
    
    
}
