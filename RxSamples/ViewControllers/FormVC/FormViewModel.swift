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
    var email:Observable<String>?
    var telephoneNumber:Observable<String>?
    
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
        username!.subscribe(onNext: { [weak self] text in
            print("text username : \(text)")
        }).addDisposableTo(disposeBag)
        
        email!.subscribe(onNext: { [weak self] text in
             print("text email : \(text)")
        }).addDisposableTo(disposeBag)
        
    }
    
    func pptestListen() {
        //observer.onNext("hhahhdskd")
    }
    
    
}
