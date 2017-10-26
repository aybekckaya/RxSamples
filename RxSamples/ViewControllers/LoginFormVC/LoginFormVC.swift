//
//  LoginFormVC.swift
//  RxSamples
//
//  Created by aybek can kaya on 26/10/2017.
//  Copyright © 2017 aybek can kaya. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class LoginFormVC: UIViewController {

    @IBOutlet weak var tfUsername: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnHint: UIButton!
    
    @IBOutlet weak var lblHint: UILabel!
    
    fileprivate var viewModel:LoginFormViewModel?
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       setUpRx()
    }
    
    private func setUpRx() {
        
        // setting up view Model
        viewModel = LoginFormViewModel(
            username: tfUsername.rx.text.orEmpty.asObservable(),
            password: tfPassword.rx.text.orEmpty.asObservable(),
            signInOnTap : btnLogin.rx.tap.asObservable()
        )
        
        viewModel?.bothFieldsValid.subscribe(onNext: { [weak self] fieldsValid in
            self?.btnLogin.alpha = fieldsValid ? 1 : 0.5
            self?.btnLogin.isEnabled = fieldsValid ? true : false
        }).addDisposableTo(disposeBag)
        
        self.lblHint.alpha = 0
        btnHint.rx.tap.bind{
            self.lblHint.alpha = self.lblHint.alpha == 1 ? 0 : 1
        }.addDisposableTo(disposeBag)
        
        viewModel?.loginSucceed.subscribe(onNext: { loginDidSucceed in
            loginDidSucceed ? print("login succeed") : print("login unsuccessful")
        }).addDisposableTo(disposeBag)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
