//
//  CountryEndpoint.swift
//  RxSamples
//
//  Created by aybek can kaya on 15/10/2017.
//  Copyright © 2017 aybek can kaya. All rights reserved.
//



import Foundation
import Moya

enum CountryEndpoint {
    case all
    case country(name:String)
}


extension CountryEndpoint:TargetType {
    
    var sampleData: Data {
        return "sample-data".data(using: String.Encoding.utf8)!
    }
    
    var baseURL: URL { return URL(string: "https://restcountries.eu/rest/v2/")! }
    var path:String {
        switch self {
        case .all:
            return "all"
        case .country(let name):
            return "name/"+name
        }
    }
    
    var method:Moya.Method {
        return .get
    }
    
    var parameters: [String: Any]? {
        return nil
    }
    
    var task: Task {
        return .request
    }
    var parameterEncoding: ParameterEncoding {
        return JSONEncoding.default
    }
}
