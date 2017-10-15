//
//  CountryViewModel.swift
//  RxSamples
//
//  Created by aybek can kaya on 15/10/2017.
//  Copyright © 2017 aybek can kaya. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import Moya
import Moya_ModelMapper

class CountryViewModel: NSObject {
    
    fileprivate let disposeBag = DisposeBag()
    fileprivate var provider: RxMoyaProvider<CountryEndpoint>!
    fileprivate var countriesArr:[Country] = [] {
        didSet{
            countries.onNext(countriesArr)
        }
    }
    
    var countryName:Observable<String>?
    var countries = BehaviorSubject<[Country]>(value:[])
    
    func setUpRx() {
        provider = RxMoyaProvider<CountryEndpoint>()
        countryName?.subscribe(onNext: { (text) in
            guard !text.isEmpty else {
                self.countries.onNext(self.countriesArr)
                return
            }
            
            let filtered = self.countriesArr.filter{country in
                let name = (country.name?.characters.count)! >= text.characters.count ?   country.name![0..<text.characters.count] : country.name
                return text.lowercased() == name?.lowercased()
            }
            self.countries.onNext(filtered)
        }).addDisposableTo(disposeBag)
        
    }
}

extension CountryViewModel {
    func setAllCountries() {
        provider.request(CountryEndpoint.all).debug().map{response -> [Country] in
            let jsonArr = try! JSON(data: response.data)
            var countyArr:[Country] = []
            jsonArr.array?.forEach{
                let cnt = Country(json: $0)
                countyArr.append(cnt)
            }
            return countyArr
            }.subscribe(onNext: { (countryModels) in
            self.countriesArr = countryModels
         }, onError: { (error) in
            print(error)
           self.countriesArr = []
         }).addDisposableTo(disposeBag)
    }
    
}



