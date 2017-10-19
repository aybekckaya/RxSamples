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
    
    func readJson(from fileName:String)->Data {
        let url = Bundle.main.url(forResource: fileName, withExtension: "json")!
        return try! Data(contentsOf:url)
    }
    
}


extension CountryEndpoint:TargetType {
    
    var sampleData: Data {
        switch self {
        case .all:
            return readJson(from:"all")
        case .country(let name):
            return readJson(from:"all")
        }
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





