//
//  Restaurant.swift
//  FoodTaskerMobile
//
//  Created by Leo Trieu on 9/23/16.
//  Copyright © 2016 Leo Trieu. All rights reserved.
//

import Foundation
import SwiftyJSON

class Restaurant {
    
    var id: Int?
    var name: String?
    var address: String?
    var logo: String?
    
    init(json: JSON) {
        self.id = json["id"].int
        self.name = json["name"].string
        self.address = json["address"].string
        self.logo = json["logo"].string
    }
}
