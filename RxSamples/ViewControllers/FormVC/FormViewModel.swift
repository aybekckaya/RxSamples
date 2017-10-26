//
//  FormViewModel.swift
//  RxSamples
//
//  Created by Can Kaya on 19/10/2017.
//  Copyright © 2017 aybek can kaya. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class FormViewModel {

    //var observer = PublishSubject<String>()
    
    var username:Observable<String>?
    var password:Observable<String>?
    
    var everythingValid:Observable<Bool>?
    
    private var disposeBag = DisposeBag()
    
    init() {
        
        /*
        Observable.combineLatest(username , email, telephoneNumber) {_username , _email , _telephoneNumber in
            print("username : \(_username)")
            return true
            }.shareReplay(1)
        */
        
    }
    
    func setUpRx() {
       
        let validUsername = username!.map { $0.characters.count > 0 }
        let validPassword = password!.map{ $0.characters.count > 0 }
       
        everythingValid = Observable.combineLatest(validUsername, validPassword) { $0 && $1 }.shareReplay(1)
        
        everythingValid?.subscribe(onNext: { tt in
            print("tt:\(tt)")
        }).addDisposableTo(disposeBag)
        
        username!.subscribe(onNext: { text in
            print("text : \(text)")
        }).addDisposableTo(disposeBag)
        
    }
    
    func pptestListen() {
        //observer.onNext("hhahhdskd")
    }
    
    
}
