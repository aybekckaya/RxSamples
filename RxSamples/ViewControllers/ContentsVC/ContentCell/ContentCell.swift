//
//  ContentCell.swift
//  RxSamples
//
//  Created by aybek can kaya on 15/10/2017.
//  Copyright © 2017 aybek can kaya. All rights reserved.
//

import UIKit

class ContentCell: UITableViewCell {

    @IBOutlet weak var lblContent: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func update(contentTitle:String) {
        lblContent.text = contentTitle
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
