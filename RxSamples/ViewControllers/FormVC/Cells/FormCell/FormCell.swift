//
//  FormCell.swift
//  RxSamples
//
//  Created by Can Kaya on 19/10/2017.
//  Copyright © 2017 aybek can kaya. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

enum FormCellType {
    case undefined
    case username
    case password
    
    func placeholderText()->String {
        switch self {
        case .username:
            return "Username"
        case .password:
            return "Password"
        default : return ""
        }
    }
}


class FormCell: UITableViewCell {

    @IBOutlet weak var textForm: UITextField!
    
    fileprivate var cellType:FormCellType = FormCellType.undefined
    private let debounceTime = 0.3
    
    private var disposeBag = DisposeBag()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(type:FormCellType , viewModel:FormViewModel) {
        cellType = type
        textForm.placeholder = cellType.placeholderText()
        selectionStyle = .none
       
        if cellType == .username {
            viewModel.username = textForm.rx.text
                .orEmpty
                .debounce(debounceTime, scheduler: MainScheduler.instance)
                .distinctUntilChanged()
        }
        else if cellType == .password {
            viewModel.password = textForm.rx.text
                .orEmpty
                .debounce(debounceTime, scheduler: MainScheduler.instance)
                .distinctUntilChanged()
        }
        
    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
