//
//  AddNewTicketViewController.swift
//  Tickets App
//
//  Created by Ivan Sivakou on 4.10.22.
//

import UIKit

class AddNewTicketViewController: UIViewController {

    var addNumberOfBookingTextField = UITextField()
    var addEmailTextField = UITextField()
    var searchButton = UIButton()
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
        view.addSubview(addNumberOfBookingTextField)
        view.addSubview(addEmailTextField)
        view.addSubview(searchButton)
        view.addSubview(textLabel)
    }

    func configureSubviews() {
        title = "Добавить билет"
        view.backgroundColor = .white
        
        tabBarController?.tabBar.isHidden = true
        
        addNumberOfBookingTextField.borderStyle = .roundedRect
        addNumberOfBookingTextField.placeholder = "Номер бронирования"
        addNumberOfBookingTextField.font = .boldSystemFont(ofSize: 20)
        addNumberOfBookingTextField.textAlignment = .left
        addNumberOfBookingTextField.addTarget(self, action: #selector(changeValue), for: .editingChanged)
        
        addEmailTextField.borderStyle = .roundedRect
        addEmailTextField.placeholder = "Адрес электронной почты"
        addEmailTextField.font = .boldSystemFont(ofSize: 20)
        addEmailTextField.textAlignment = .left
        addEmailTextField.addTarget(self, action: #selector(changeValue), for: .editingChanged)
     
        searchButton.setTitle("НАЙТИ БИЛЕТЫ", for: .normal)
        searchButton.backgroundColor = .gray
        searchButton.tintColor = .white
        searchButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        searchButton.layer.cornerRadius = 10
        
        textLabel.numberOfLines = 0
        textLabel.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        textLabel.textAlignment = .center
        textLabel.font = .boldSystemFont(ofSize: 15)
        textLabel.text = "Добавьте свой билет, указав номер\nбронирования и адрес электронной почты"
        
        self.navigationItem.leftBarButtonItem?.tintColor = .white
        self.navigationController!.navigationBar.tintColor = .white

    }
    
    func buildHierarchy() {
        addNumberOfBookingTextField.translatesAutoresizingMaskIntoConstraints = false
        addNumberOfBookingTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        addNumberOfBookingTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        addNumberOfBookingTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        addNumberOfBookingTextField.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        addEmailTextField.translatesAutoresizingMaskIntoConstraints = false
        addEmailTextField.topAnchor.constraint(equalTo: addNumberOfBookingTextField.bottomAnchor, constant: 10).isActive = true
        addEmailTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        addEmailTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        addEmailTextField.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.topAnchor.constraint(equalTo: addEmailTextField.bottomAnchor, constant: 10).isActive = true
        searchButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        searchButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        searchButton.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.topAnchor.constraint(equalTo: searchButton.bottomAnchor, constant: 10).isActive = true
        textLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        textLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        textLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true

    }
    //MARK: - Change color of find button
    
    func changeColorOfFindButton() {
        if addNumberOfBookingTextField.text != "" && addEmailTextField.text != "" {
            searchButton.backgroundColor = .green
        }
    }
        
        @objc func changeValue() {
            changeColorOfFindButton()
        }
    
    //MARK: - Show TabBar Item
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        tabBarController?.tabBar.isHidden = false
    }
    
}
