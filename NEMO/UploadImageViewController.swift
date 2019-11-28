//
//  UploadImageViewController.swift
//  NEMO
//
//  Created by Manar Magdy on 09/09/2019.
//  Copyright © 2019 Manar Magdy. All rights reserved.
//

import UIKit


class UploadImageViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    public static func create() -> UploadImageViewController {
        return UIStoryboard(name: kStoryboardName, bundle: Bundle.main).instantiateViewController(withIdentifier: String(describing: self)) as! UploadImageViewController
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func backAction() {
        dismiss(animated: true, completion: nil)
    }
}



extension UploadImageViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "UploadImageTableViewCell", for: indexPath) as! UploadImageTableViewCell
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "LocationTableViewCell", for: indexPath) as! LocationTableViewCell
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "InformationTableViewCell", for: indexPath) as! InformationTableViewCell
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 240
        case 1:
            return 211
        default:
            return 450
        }
    }
}
