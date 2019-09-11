//
//  InformationTableViewCell.swift
//  NEMO
//
//  Created by Manar Magdy on 11/09/2019.
//  Copyright © 2019 Manar Magdy. All rights reserved.
//

import UIKit

class InformationTableViewCell: UITableViewCell {

    @IBOutlet private var categoryViews: [UIView]!
    @IBOutlet private weak var notesTextField: UITextField!
    @IBOutlet private weak var postButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
//        
//        for categoryView in categoryViews {
//            categoryView.roundView()//(UIColor.lightGray)
//        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
