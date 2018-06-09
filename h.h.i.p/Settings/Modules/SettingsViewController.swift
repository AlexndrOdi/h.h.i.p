//
//  SettingsViewController.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 30.05.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import UIKit

protocol SettingsViewControllerInputProtocol: class {
    func displayAllSettings(settings: [Setting])
    func displayProfileInfo(profile: Profile)
}

protocol SettingsViewControllerOutputProtocol: class {
    func fetchAllSettings()
    func fetchProfileInfo()
    func navigateToSetting()
    func navigateToProfile()
}

class SettingsViewController: UIViewController, SettingsViewControllerInputProtocol {
    
    
    @IBOutlet weak var settingsTable: UITableView!
    
    var presenter: SettingsViewControllerOutputProtocol!
    
    var settings: [Setting] = []
    var profile: Profile?
    
    override func awakeFromNib() {
        SettingsConfigurer.sharedInstance.configureCurrentChatView(viewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = navigationTitleSettings
        
        presenter.fetchAllSettings()
        presenter.fetchProfileInfo()
        // Do any additional setup after loading the view.
    }

    func displayAllSettings(settings: [Setting]) {
        self.settings = settings
        
        DispatchQueue.main.async {
            self.settingsTable.reloadData()
        }
    }
    
    func displayProfileInfo(profile: Profile) {
        self.profile = profile
        
        DispatchQueue.main.async {
            self.settingsTable.reloadRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
        }
    }
}

extension SettingsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings.count + 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 80.0
        } else {
            return 60.0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let profileCell = tableView.dequeueReusableCell(withIdentifier: ProfileCell.identifier, for: indexPath) as! ProfileCell
//            profileCell.profilePhoto =
//            profileCell.profileName =
//            profileCell.profileNumber =
            profileCell.profileName.text = profile?.firstName
            profileCell.profileNumber.text = profile?.number
            return profileCell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsCell.identifier, for: indexPath) as! SettingsCell
        
        cell.settingImage.image = UIImage(named: settings[indexPath.row - 1].image)
        cell.settingName.text = settings[indexPath.row - 1].name
        
        return cell
    }
    
}

extension SettingsViewController: UITableViewDelegate {
    //TODO: написать переход на экран с выбранной настройкой после подгона роутинга
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        switch tableView.cellForRow(at: indexPath) {
        case is ProfileCell:
            presenter.navigateToProfile()
        default:
            presenter.navigateToSetting()
        }
    }
    
}
