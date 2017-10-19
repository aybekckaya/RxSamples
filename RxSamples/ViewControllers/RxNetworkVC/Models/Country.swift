//
//  Country.swift
//  RxSamples
//
//  Created by aybek can kaya on 15/10/2017.
//  Copyright © 2017 aybek can kaya. All rights reserved.
//

import Foundation

struct Country {
    var name:String?
    var flagPath:String?
    var callingCode:String?
    
    init() {}
    
    init(json: JSON) {
        name = json["name"].string
        flagPath = json["flag"].string
        callingCode = json["callingCode"] == nil ? nil:json["callingCode"][0].string
    }
   
}
