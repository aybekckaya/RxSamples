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
    
    var username:Observable<String> = Observable<String>.just("")
    var email:Observable<String> = Observable<String>.just("")
    var telephoneNumber:Observable<String> = Observable<String>.just("")
    
    private var disposeBag = DisposeBag()
    
    init() {
        
        /*
        Observable.combineLatest(username , email, telephoneNumber) {_username , _email , _telephoneNumber in
            print("username : \(_username)")
            return true
            }.shareReplay(1)
        */
        
        
        username.subscribe(onNext: { [weak self] text in
             print("text username : \(text)")
        }).addDisposableTo(disposeBag)
        
    }
    
    func pptestListen() {
        //observer.onNext("hhahhdskd")
    }
    
    
}
