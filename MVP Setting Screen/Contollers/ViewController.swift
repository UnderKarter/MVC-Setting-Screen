//
//  ViewController.swift
//  MVP Setting Screen
//
//  Created by temp user on 11.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(
            StaticViewCell.self,
            forCellReuseIdentifier: StaticViewCell.identifier
        )
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Настройки"
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        
        configure()
    }
    
    func configure() {
        models.append(Section(opitions: [
            StaticOption(title: "Авиарежим",
                         icon: UIImage(systemName: "airplane"),
                         iconBackgroundColor: UIColor.systemOrange){
                             print("Нажата ячейка Авиарежим")
                         },
            StaticOption(title: "Wi-Fi",
                         icon: UIImage(systemName: "wifi"),
                         iconBackgroundColor: UIColor.systemBlue){
                             print("Нажата ячейка Wi-Fi")
                         },
            StaticOption(title: "Bluetooth",
                         icon: UIImage(systemName: "airplane"),
                         iconBackgroundColor: UIColor.systemBlue){
                             print("Нажата ячейка Bluetooth")
                         },
            StaticOption(title: "Сотовая связь",
                         icon: UIImage(systemName: "airplane"),
                         iconBackgroundColor: UIColor.systemGreen){
                             print("Нажата ячейка Сотовая связь")
                         },
            StaticOption(title: "Режим модема",
                         icon: UIImage(systemName: "personalhotspot"),
                         iconBackgroundColor: UIColor.systemGreen){
                             print("Нажата ячейка Режим модема")
                         },
            StaticOption(title: "VPN",
                         icon: UIImage(systemName: "airplane"),
                         iconBackgroundColor: UIColor.systemBlue){
                             print("Нажата ячейка VPN")
                         }
        ]))
        
        models.append(Section(opitions: [
            StaticOption(title: "Уведомления",
                         icon: UIImage(systemName: "airplane"),
                         iconBackgroundColor: UIColor.systemOrange){
                             print("Нажата ячейка Уведомления")
                         },
            StaticOption(title: "Звуки, тактильные сигналы",
                         icon: UIImage(systemName: "wifi"),
                         iconBackgroundColor: UIColor.systemRed){
                             print("Нажата ячейка Звуки, тактильные сигналы")
                         },
            StaticOption(title: "Фокусирование",
                         icon: UIImage(systemName: "airplane"),
                         iconBackgroundColor: UIColor.systemPurple){
                             print("Нажата ячейка Фокусирование")
                         },
            StaticOption(title: "Экранное время",
                         icon: UIImage(systemName: "airplane"),
                         iconBackgroundColor: UIColor.systemPurple){
                             print("Нажата ячейка Экранное время")
                         }
        ]))
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].opitions[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: StaticViewCell.identifier,
            for: indexPath) as? StaticViewCell else {
                return UITableViewCell()
            }
        cell.configure(with: model)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].opitions.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = models[indexPath.section].opitions[indexPath.row]
        model.handler()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
            return models.count
        }
}
