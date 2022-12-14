//
//  HelpViewController.swift
//  Tickets App
//
//  Created by Ivan Sivakou on 25.09.22.
//

import UIKit

class HelpViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var infoTableView = UITableView()
    var indentifire = "MyCell"
    var gearImage = UIImage()
    var exclamationImage = UIImage()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        buildHierarchy()
        configureSubviews()
        layoutSubviews()
    }

    func buildHierarchy() {
        view.addSubview(infoTableView)
    }
    
    func configureSubviews() {
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        self.navigationController?.setupNavigationController()
        
        infoTableView.delegate = self
        infoTableView.dataSource = self
        infoTableView.register(UITableViewCell.self, forCellReuseIdentifier: indentifire)
        
        gearImage = UIImage(systemName: "gearshape.fill")!
        
        exclamationImage = UIImage(systemName: "exclamationmark.bubble.fill")!
    }
    
    func layoutSubviews() {
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
            cell.textLabel?.text = "?????????? ?????????????"
        case 1:
            cell.textLabel?.text = "?????????? ?????????????????? ?? ??????????????"
        case 2:
            cell.textLabel?.text = "???????????????? ????????????????????????????????????"
        case 3:
            cell.textLabel?.text = "??????????????????"
        case 4:
            cell.textLabel?.text = "???????????????????? ?? ?????????????????????????????? ????????????"
        case 5:
            cell.imageView?.image = gearImage
            cell.textLabel?.text = "??????????????????"
        case 6:
            cell.imageView?.image = exclamationImage
            cell.textLabel?.text = "???????????????? ?????? ??????????!"
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
       
    }
    
}
