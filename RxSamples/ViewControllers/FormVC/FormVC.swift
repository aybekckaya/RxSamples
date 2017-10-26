//
//  FormVC.swift
//  RxSamples
//
//  Created by Can Kaya on 19/10/2017.
//  Copyright © 2017 aybek can kaya. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class FormVC: UIViewController, UITableViewDelegate , UITableViewDataSource {
    
    @IBOutlet weak var tableForm: UITableView!
    
    enum TableField {
        case formFieldArea(cellType:FormCellType)
        case submitButtonArea
    }
    
    fileprivate let viewModel = FormViewModel()
    private let disposeBag = DisposeBag()
    
    fileprivate var fieldsTable:[TableField] = [TableField.formFieldArea(cellType: .username), TableField.formFieldArea(cellType: .password) , TableField.submitButtonArea]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpRxForm()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.setUpRx()
        
    }
    
    func setUpRxForm() {
        let nib = UINib(nibName: FormCell.identifier, bundle: nil)
        tableForm.register(nib, forCellReuseIdentifier: FormCell.identifier)
        
        let buttonNib = UINib(nibName: ButtonCell.identifier, bundle: nil)
        tableForm.register(buttonNib, forCellReuseIdentifier: ButtonCell.identifier)
        
        tableForm.delegate = self
        tableForm.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return fieldsTable.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentField = fieldsTable[indexPath.row]
        switch currentField {
        case .submitButtonArea:
            let submitButtonCell:ButtonCell = tableView.deque(at: indexPath)
            submitButtonCell.configureCell(buttonType: .submitButton, viewModel: viewModel)
            return submitButtonCell
        case .formFieldArea(cellType: .username): return formCell(with: .username, indexPath: indexPath)
        case .formFieldArea(cellType: .password) : return formCell(with: .password, indexPath: indexPath)
        
        default: return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let currentField = fieldsTable[indexPath.row]
        switch currentField {
           case .submitButtonArea: return 64
           case .formFieldArea(cellType: _): return 60
        }
    }
    
    private func formCell(with type:FormCellType , indexPath:IndexPath)->FormCell {
        let cell:FormCell = tableForm.deque(at: indexPath)
        cell.configureCell(type: type, viewModel: viewModel)
        return cell
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
