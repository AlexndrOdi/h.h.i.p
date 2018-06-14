//
//  SettingDetailViewController.swift
//  h.h.i.p
//
//  Created by Alex Odintsov on 09.06.2018.
//  Copyright © 2018 Alex Odintsov. All rights reserved.
//

import UIKit

class SettingDetailViewController: UIViewController {

    @IBOutlet weak var propertyTable: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        SettingDetailConfigurer.sharedInstance.configureSettingDetail(viewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
extension SettingDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NotificationSettingCell.identifier, for: indexPath) as? NotificationSettingCell else {
            fatalError("The dequeued cell is not an instance of NotificationSettingCell")
        }
        
        //TODO: не показывает селлы, надо переделать к хренам
        switch indexPath.row {
        case 0:
            cell.settingName.text = "Уведомления о сообщениях"
            cell.settingSwitch.isHidden = true
        case 1:
            cell.settingName.text = "Показывать уведомления"
            cell.settingSwitch.isHidden = false
        case 2:
            cell.settingName.text = "Уведомления групп"
            cell.settingSwitch.isHidden = true
        case 3:
            cell.settingName.text = "Показывать уведомления"
            cell.settingSwitch.isHidden = false
        default:
            fatalError("IndexPath.row \(indexPath.row) is not presented in notification setting view.")
        }
        
        return cell
    }
}

extension SettingDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("select row")
    }
}
