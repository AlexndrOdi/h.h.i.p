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
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50.0
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 0 {
            let footerView = UIView()
            footerView.backgroundColor = footerColor
            return footerView
        } else {
            return UIView()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return settings.count
        }
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 80.0
        } else {
            return 60.0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            guard let profileCell = tableView.dequeueReusableCell(withIdentifier: ProfileCell.identifier, for: indexPath) as? ProfileCell else {
                fatalError("The dequeued cell is not an instance of ProfileCell")
            }
//            profileCell.profilePhoto =
//            profileCell.profileName =
//            profileCell.profileNumber =
            profileCell.profileName.text = profile?.firstName
            profileCell.profileNumber.text = profile?.number
            return profileCell
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingsCell.identifier, for: indexPath) as? SettingsCell else {
            fatalError("The dequeued cell is not an instance of SettingsCell")
        }
        
        cell.settingImage.image = UIImage(named: settings[indexPath.row].image)
        cell.settingName.text = settings[indexPath.row].name
        
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
