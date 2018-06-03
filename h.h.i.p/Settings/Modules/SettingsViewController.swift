//
//  SettingsViewController.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 30.05.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import UIKit

protocol SettingsViewControllerInputProtocol: class {
    
}

protocol SettingsViewControllerOutputProtocol: class {
    
}

class SettingsViewController: UIViewController, SettingsViewControllerInputProtocol {
    
    @IBOutlet weak var settingsTable: UITableView!
    
    var presenter: SettingsViewControllerOutputProtocol!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.view.backgroundColor = UIColor.green
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension SettingsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let profileCell = tableView.dequeueReusableCell(withIdentifier: ProfileCell.identifier, for: indexPath) as! ProfileCell
//            profileCell.profilePhoto =
//            profileCell.profileName =
//            profileCell.profileNumber =
            return profileCell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsCell.identifier, for: indexPath) as! SettingsCell
        
//        cell.settingImage =
//        cell.settingName =
        
        
        return cell
    }
    
}

extension SettingsViewController: UITableViewDelegate {
    //TODO: написать переход на экран с выбранной настройкой после подгона роутинга
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
