//
//  RxNetworkTests.swift
//  RxSamplesTests
//
//  Created by aybek can kaya on 18/10/2017.
//  Copyright © 2017 aybek can kaya. All rights reserved.
//

import XCTest
import RxCocoa
import RxSwift
import Moya
import Moya_ModelMapper

@testable import RxSamples

class RxNetworkTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetAllCountries() {
        let model = CountryViewModel()
        model.setProvider(theProvider:RxMoyaProvider<CountryEndpoint>(stubClosure: MoyaProvider.immediatelyStub))
        model.setAllCountries()
        XCTAssert(model.countriesArr.count > 0, "Countries count cannot be zero")
    }
        
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
