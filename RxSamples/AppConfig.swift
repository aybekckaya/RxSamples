//
//  AppConfig.swift
//  RxSamples
//
//  Created by aybek can kaya on 19/10/2017.
//  Copyright © 2017 aybek can kaya. All rights reserved.
//

import UIKit

enum AppRoute {
    case defaultRoute
    case NetworkRoute
    case FormRoute
    case LoginRoute
}

class AppConfig {
    internal static let sharedInstance:AppConfig = AppConfig()
    
    // application forced route position . default: no forced route 
    let currentRoute:AppRoute = AppRoute.NetworkRoute
}



