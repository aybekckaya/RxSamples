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
    case email
    case password
    case phoneNumber
    
    func placeholderText()->String {
        switch self {
        case .username:
            return "Username"
        case .email:
            return "Email"
        default : return ""
        }
    }
}


class FormCell: UITableViewCell {

    @IBOutlet weak var textForm: UITextField!
    
    fileprivate var cellType:FormCellType = FormCellType.undefined
    
    fileprivate var subject = BehaviorSubject<String>(value:"")
    
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
            subject.bind(to: textForm.rx.text).addDisposableTo(disposeBag)
            viewModel.username.bind(to: textForm.rx.text).addDisposableTo(disposeBag)
        }
        else if cellType == .email {
            viewModel.email.bind(to: textForm.rx.text).addDisposableTo(disposeBag)
        }
        
        subject.subscribe(onNext: { text in
            print("current:\(text)")
        }).addDisposableTo(disposeBag)
    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
