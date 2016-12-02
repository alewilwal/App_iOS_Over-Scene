//
//  Event.swift
//  App_iOS_Over-Scene
//
//  Created by imac on 28/11/2016.
//  Copyright © 2016 imac. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

class Event: Mappable {
    
    var title:String?
    var content:String?
    var imageURL:String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        title <- map["title"]
        content <- map["content"]
        imageURL <- map["featured_image.attachment_meta.sizes.medium.url"]
    }

}
