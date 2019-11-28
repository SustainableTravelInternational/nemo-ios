//
//  HomeTableViewCell.swift
//  NEMO
//
//  Created by Manar Magdy on 11/09/2019.
//  Copyright © 2019 Manar Magdy. All rights reserved.
//

import UIKit
import SDWebImage

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak private var siteImageView: UIImageView!
    @IBOutlet weak private var userImageView: UIImageView!
    @IBOutlet weak private var siteTitleLabel: UILabel!
    @IBOutlet weak private var uploadDateLabel: UILabel!
    @IBOutlet weak private var locationNameLabel: UILabel!
    @IBOutlet weak private var userNameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        siteImageView.roundView()
        userImageView.circularView()
    }

   
    func setupCell(_ site: SiteModel) {
        
        userImageView.sd_setImage(with: URL(string: ""), placeholderImage: UIImage(named: "placeholder"))
        siteImageView.sd_setImage(with: URL(string: ""), placeholderImage: UIImage(named: "placeholder"))
        siteTitleLabel.text = site.notes
        uploadDateLabel.text = site.creationDate
        userNameLabel.text = site.name
        locationNameLabel.text = site.divingSiteName
    }
}

