//
//  UploadImageTableViewCell.swift
//  NEMO
//
//  Created by Manar Magdy on 11/09/2019.
//  Copyright © 2019 Manar Magdy. All rights reserved.
//

import UIKit

class UploadImageTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func openGallery(_ sender: Any) {
    }
}




