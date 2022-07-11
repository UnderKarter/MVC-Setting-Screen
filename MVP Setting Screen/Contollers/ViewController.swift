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
        models = Array(0...10).compactMap({
                StaticOption(title: "Line \($0)",
                             icon: UIImage(systemName: "bell"),
                             iconBackgroundColor: UIColor.systemRed){
                }
            })
        }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: StaticViewCell.identifier,
            for: indexPath) as? StaticViewCell else {
                return UITableViewCell()
            }
        cell.configure(with: model)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
}
