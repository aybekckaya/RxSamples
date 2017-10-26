//
//  ButtonCell.swift
//  RxSamples
//
//  Created by Can Kaya on 19/10/2017.
//  Copyright © 2017 aybek can kaya. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

enum FormButtonType {
    case submitButton
    
    func textify()->String {
        switch self {
            case .submitButton: return "Submit"
        }
    }
}

class ButtonCell: UITableViewCell {

    @IBOutlet weak var btnComponent: UIButton!
    
    private let disposeBag = DisposeBag()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(buttonType:FormButtonType , viewModel:FormViewModel) {
        btnComponent.titleLabel?.text = buttonType.textify()
        
        // binders
        viewModel.everythingValid?.bind(to: btnComponent.rx.isEnabled).addDisposableTo(disposeBag)
    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
