//
//  ChoosePassengersViewController.swift
//  Tickets App
//
//  Created by s x on 12.10.22.
//

import UIKit

class ChoosePassengersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var infoTableView = UITableView()
    var indentifire = "MyCell"
    var plusMinusView = UIView()
    var plusButton = UIButton()
    var minusButton = UIButton()
    var textLabel = UILabel()
    
    
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
        plusMinusView.addSubview(minusButton)
        plusMinusView.addSubview(textLabel)
        plusMinusView.addSubview(plusButton)
    }
    
    func configureSubviews() {
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        self.navigationController?.setupNavigationController()
        
        infoTableView.delegate = self
        infoTableView.dataSource = self
        infoTableView.register(UITableViewCell.self, forCellReuseIdentifier: indentifire)
//        infoTableView.insertRows(at: <#T##[IndexPath]#>, with: <#T##UITableView.RowAnimation#>)
        
        minusButton.setTitle("-", for: .normal)
        minusButton.layer.cornerRadius = 15
        minusButton.layer.borderWidth = 1
        minusButton.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        minusButton.setTitleColor(.gray, for: .normal)

        
        textLabel.text = "0"
        textLabel.textAlignment = .center
        
        plusButton.setTitle("+", for: .normal)
        plusButton.setTitleColor(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1), for: .normal)
        plusButton.layer.cornerRadius = 15
        plusButton.layer.borderWidth = 1
        plusButton.layer.borderColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)

    }
    
    func buildHierarchy() {
        infoTableView.translatesAutoresizingMaskIntoConstraints = false
        infoTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        infoTableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        infoTableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        infoTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        plusButton.topAnchor.constraint(equalTo: plusMinusView.topAnchor, constant: 10).isActive = true
//        plusButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        plusButton.rightAnchor.constraint(equalTo: plusMinusView.rightAnchor, constant: -10).isActive = true
//        plusButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        plusButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        plusButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.topAnchor.constraint(equalTo: plusMinusView.topAnchor, constant: 0).isActive = true
//      textLabelon.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        textLabel.rightAnchor.constraint(equalTo: plusButton.leftAnchor, constant: 0).isActive = true
//      textLabelon.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        textLabel.widthAnchor.constraint(equalToConstant: 30).isActive = true
        textLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        minusButton.translatesAutoresizingMaskIntoConstraints = false
        minusButton.topAnchor.constraint(equalTo: plusMinusView.topAnchor, constant: 10).isActive = true
//      minusButtonon.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        minusButton.rightAnchor.constraint(equalTo: textLabel.leftAnchor, constant: 0).isActive = true
//      minusButtonon.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        minusButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        minusButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        plusMinusView.translatesAutoresizingMaskIntoConstraints = false
        plusMinusView.heightAnchor.constraint(equalToConstant: 50).isActive = true
//        plusMinusView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        plusMinusView.widthAnchor.constraint(equalToConstant: 200).isActive = true
//        plusMinusView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        
        
    }
    
    
    //MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: indentifire, for: indexPath)
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "Взрослых:"
            cell.insertSubview(plusMinusView, at: 1)
            cell.addSubview(plusMinusView)
            
        case 1:
            cell.textLabel?.text = "Велосипедов:"
            cell.addSubview(plusMinusView)
        case 2:
            cell.textLabel?.text = "Детей:"
            cell.addSubview(plusMinusView)
        default:
            break
        }
//        cell.accessoryType = .disclosureIndicator
        
        
        return cell
    }

    //MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
       
    }
    
}
