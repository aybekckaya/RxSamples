//
//  RxNetworkVC.swift
//  RxSamples
//
//  Created by aybek can kaya on 15/10/2017.
//  Copyright © 2017 aybek can kaya. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa


// DATA : https://restcountries.eu/#api-endpoints-all


class RxNetworkVC: UIViewController,UITableViewDelegate {

    fileprivate let searchController = UISearchController(searchResultsController: nil)
    var latestRepositoryName: Observable<String> {
        return searchController.searchBar
            .rx.text
            .orEmpty
            .debounce(0.5, scheduler: MainScheduler.instance)
            .distinctUntilChanged()
    }
    
    fileprivate let viewModel = CountryViewModel()
    fileprivate let disposeBag = DisposeBag()
    
    @IBOutlet weak var tableviewCountry: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpRx()
    }

    private func setUpRx() {
        
        let cellNib = UINib(nibName: CountryCell.identifier, bundle: nil)
        tableviewCountry.register(cellNib, forCellReuseIdentifier: CountryCell.identifier)
        tableviewCountry.tableFooterView = UIView()
        tableviewCountry.delegate = self
        
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableviewCountry.tableHeaderView = searchController.searchBar
        tableviewCountry.keyboardDismissMode = UIScrollViewKeyboardDismissMode.onDrag
        
        viewModel.countryName = searchController.searchBar
            .rx.text
            .orEmpty
            .debounce(0.5, scheduler: MainScheduler.instance)
            .distinctUntilChanged()
        
        searchController.rx.didDismiss.subscribe(onNext: { _ in
            self.viewModel.countries.onNext(self.viewModel.countriesArr)
        }).addDisposableTo(disposeBag)
        
        viewModel.countries.bind(to: tableviewCountry.rx.items(cellIdentifier: CountryCell.identifier,cellType:CountryCell.self)){(row,element,cell) in
            cell.update(countryName: element.name!)
        }.addDisposableTo(disposeBag)
     
        viewModel.setUpRx()
        viewModel.setAllCountries()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 54
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
