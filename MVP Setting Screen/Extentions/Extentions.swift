//
//  Extentions.swift
//  MVP Setting Screen
//
//  Created by temp user on 12.07.2022.
//

import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].opitions[indexPath.row]
        
        switch model.self {
        case .staticCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: StaticViewCell.identifier,
                for: indexPath) as? StaticViewCell else {
                    return UITableViewCell()
                }
            cell.configure(with: model)
            return cell
        case .switchCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SwitchViewCell.identifier,
                for: indexPath) as? SwitchViewCell else {
                    return UITableViewCell()
                }
            cell.configure(with: model)
            return cell
        case .boolCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: BoolViewCell.identifier,
                for: indexPath) as? BoolViewCell else {
                    return UITableViewCell()
                }
            cell.configure(with: model)
            return cell
        case .notificationCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: NotificationViewCell.identifier,
                for: indexPath) as? NotificationViewCell else {
                    return UITableViewCell()
                }
            cell.configure(with: model)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].opitions.count
    }
}
