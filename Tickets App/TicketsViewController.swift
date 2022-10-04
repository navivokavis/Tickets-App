//
//  TicketsViewController.swift
//  Tickets App
//
//  Created by s x on 25.09.22.
//

import UIKit

class TicketsViewController: UIViewController {
    
    var addButton = UIButton()
    var ticketImageView = UIImageView()
    var ticketImage = UIImage()
    
    
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
        view.addSubview(addButton)
        view.addSubview(ticketImageView)
        
    }
    
    func configureSubviews() {
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        self.navigationController?.setupNavigationController()
        
        addButton.setTitle("Добавить билет", for: .normal)
        addButton.tintColor = .white
        
        view.addSubview(ticketImageView)
        ticketImageView.image = UIImage(named: "QRTicket")
//        guard let ticketImage = UIImage(named: "ImageForScrollView") else { return }
//        ticketImageView = UIImageView(image: ticketImage)
//        ticketImageView.contentMode = .scaleToFill
        
        ticketImageView.frame = CGRect(x: 0, y: 0, width: 200, height: 300)
        ticketImageView.center = view.center
        
    }
    
    func buildHierarchy() {
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        addButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        addButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        
                ticketImageView.translatesAutoresizingMaskIntoConstraints = false
                ticketImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 180).isActive = true
                ticketImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
                ticketImageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
                ticketImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150).isActive = true
//                ticketImageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
    }
    
}
