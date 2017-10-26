//
//  LoginFormViewModel.swift
//  RxSamples
//
//  Created by aybek can kaya on 26/10/2017.
//  Copyright © 2017 aybek can kaya. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class LoginFormViewModel {
    
    private let disposeBag = DisposeBag()
    
    var bothFieldsValid:Observable<Bool>
    var loginSucceed:Observable<Bool>
    
    init(username:Observable<String> , password:Observable<String> , signInOnTap:Observable<Void>) {
        /*
        username.subscribe(onNext: {
            print("username : \($0)")
        }).addDisposableTo(disposeBag)
        */
        
        let usernameValid = username.map { (text) -> Bool in
            return text.characters.count > 0
        }.shareReplay(1)
        
        let passwordValid = password.map { (text) -> Bool in
            return text.characters.count > 3
        }.shareReplay(1)
        
        bothFieldsValid = Observable.combineLatest(passwordValid , usernameValid){ $0 && $1 }
        
        let usernameAndPassword = Observable.combineLatest(username,password) { ( username:$0 , password:$1 ) }
        
        loginSucceed = signInOnTap.withLatestFrom(usernameAndPassword).map({ (tuple) -> Bool in
            return tuple.username == "rxswift" && tuple.password == "isgood"
        }).shareReplay(1)
        
    }
    
}
