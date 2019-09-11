//
//  HomeViewController.swift
//  NEMO
//
//  Created by Manar Magdy on 09/09/2019.
//  Copyright © 2019 Manar Magdy. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    fileprivate var sitesList: [SiteModel]?

    override func viewDidLoad() {
        super.viewDidLoad()
        getSitesList()
    }
    
    public static func create() -> HomeViewController {
        
        return UIStoryboard(name: kStoryboardName, bundle: Bundle.main).instantiateViewController(withIdentifier: String(describing: self)) as! HomeViewController
    }
    
    private func getSitesList() {
        
        HomeManger.getDivingSitesList { [unowned self] (sites, error) in
            if let error = error {
                self.showAlertView(error.localizedDescription, title: General.errorViewTitle)
            } else {
                self.sitesList = sites
                self.tableView.reloadData()
            }
        }
    }
    
    @IBAction private func searchAction() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction private func editAccountAction() {
        present(RegisterViewController.create(), animated: true)
    }
    
    @IBAction private func uploadAction() {
//        if UserDefaults.standard.object(forKey: General.loggedInKey) == nil {
//            present(LoginViewController.create(), animated: true)
//            return
//        }
        present(UploadImageViewController.create(), animated: true)
    }
}




extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sitesList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        cell.setupCell(sitesList![indexPath.row])
        return cell
    }
}
