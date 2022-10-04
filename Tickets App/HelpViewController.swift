//
//  HelpViewController.swift
//  Tickets App
//
//  Created by s x on 25.09.22.
//

import UIKit

class HelpViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var infoTableView = UITableView()
    var indentifire = "MyCell"
    var gearImage = UIImage(systemName: "gearshape.fill")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        layoutSubviews()
        configureSubviews()
        buildHierarchy()
    }

    func layoutSubviews() {
        view.addSubview(infoTableView)
    }
    
    func configureSubviews() {
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        self.navigationController?.setupNavigationController()
        
        infoTableView.delegate = self
        infoTableView.dataSource = self
        infoTableView.register(UITableViewCell.self, forCellReuseIdentifier: indentifire)
    }
    
    func buildHierarchy() {
        infoTableView.translatesAutoresizingMaskIntoConstraints = false
        infoTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        infoTableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        infoTableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        infoTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
    }
    
    
    //MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: indentifire, for: indexPath)
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "Нужна помощь?"
        case 1:
            cell.textLabel?.text = "Общие положения и условия"
        case 2:
            cell.textLabel?.text = "Политика конфиденциальности"
        case 3:
            cell.textLabel?.text = "Остановки"
        case 4:
            cell.textLabel?.text = "Контактные и регистрационные данные"
        case 5:
            cell.textLabel?.text = "\(gearImage) Настройки"
        case 6:
            cell.textLabel?.text = "Оставьте нам отзыв!"
        default:
            break
        }
        cell.accessoryType = .disclosureIndicator
        
        
        return cell
    }

    //MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            print ("lox")
        case 1:
            print("xol")
//        case 2:
//            cell.textLabel?.text = "Политика конфиденциальности"
//        case 3:
//            cell.textLabel?.text = "Остановки"
//        case 4:
//            cell.textLabel?.text = "Контактные и регистрационные данные"
//        case 5:
//            cell.textLabel?.text = "\(gearImage) Настройки"
//        case 6:
//            cell.textLabel?.text = "Оставьте нам отзыв!"
        default:
            break
        }
    }
    
}
