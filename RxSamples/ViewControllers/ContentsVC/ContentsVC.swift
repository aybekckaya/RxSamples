//
//  ContentsVC.swift
//  RxSamples
//
//  Created by aybek can kaya on 12/10/2017.
//  Copyright © 2017 aybek can kaya. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ContentsVC: UIViewController {

    enum Content:String {
        case networking  = "Networking with RxSwift"
        case formPage = "Form page"
        case loginPage = "Login Sample"
        
        func viewController()->UIViewController {
            switch self {
            case .networking:
                return RxNetworkVC(nibName: "RxNetworkVC", bundle: nil)
            case .formPage:
                return FormVC(nibName: "FormVC", bundle: nil)
            case .loginPage:
                return LoginFormVC(nibName: "LoginFormVC", bundle: nil)
            }
        }
    }
    
    fileprivate let contentsArr = [Content.networking , Content.formPage]
    
    fileprivate let disposeBag = DisposeBag()
    
    @IBOutlet weak var tableviewContents: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        routeApp()
    }
    
    
    private func routeApp() {
        
        switch AppConfig.sharedInstance.currentRoute {
        case .FormRoute:
            let vc = Content.formPage.viewController()
            navigationController?.pushViewController(vc, animated: false)
            break
        case .NetworkRoute:
            let vc = Content.networking.viewController()
            navigationController?.pushViewController(vc, animated: false)
            break
        case .LoginRoute:
            let vc = Content.loginPage.viewController()
            navigationController?.pushViewController(vc, animated: false)
            break 
        default:
            setUpRx()
        }
    }
    
    func setUpRx() {
        let cellNib = UINib(nibName: ContentCell.identifier, bundle: nil)
        tableviewContents.register(cellNib, forCellReuseIdentifier: ContentCell.identifier)
        
        tableviewContents.tableFooterView = UIView()
        let contents = Observable.of(contentsArr)
        contents.bind(to: tableviewContents.rx.items(cellIdentifier: ContentCell.identifier,cellType:ContentCell.self)){(row,element,cell) in
            cell.update(contentTitle: element.rawValue)
        }.disposed(by: disposeBag)
     
        tableviewContents.rx.itemSelected.subscribe(onNext: { [weak self] indexPath in
            let vc = self?.contentsArr[indexPath.row].viewController()
            self?.navigationController?.pushViewController(vc!, animated: true)
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
