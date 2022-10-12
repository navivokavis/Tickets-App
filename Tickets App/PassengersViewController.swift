//
//  PassengersViewController.swift
//  Tickets App
//
//  Created by s x on 12.10.22.
//

import UIKit

class PassengersViewController: UIViewController {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CustomPassengerTableViewCell.self,
                           forCellReuseIdentifier: CustomPassengerTableViewCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
}

//MARK: - UITableViewDelegate
extension PassengersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        
    }
}

//MARK: - UITableViewDataSource
extension PassengersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomPassengerTableViewCell.identifier,
                                                 for: indexPath)
        
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "Взрослых:"
            
            
        case 1:
            cell.textLabel?.text = "Велосипедов:"
            
        case 2:
            cell.textLabel?.text = "Детей:"
            
        default:
            break
            
        }
        return cell
    }
        
        
        
        
    }
