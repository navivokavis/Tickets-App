//
//  ChoosePassengersViewController.swift
//  Tickets App
//
//  Created by s x on 12.10.22.
//

import UIKit

class ChoosePassengersView: UIView {
    
    var titleLabel = UILabel()
    var passangerLabel = UILabel()
    var plusButton = UIButton()
    var minusButton = UIButton()
    var numberLabel = UILabel()
    
    //MARK: - State
    
    var title: String
    var infoIcon: Bool
    
    var counter = 0
    public var completionHadler: ((Int) -> Void)?
    
    //MARK: - Initializers
    
    init(title: String, infoIcon: Bool, count: Int, completionHadler: ((Int?) -> Void)? = nil, frame: CGRect = .init()) {
        
        self.title = title
        self.infoIcon = infoIcon
        self.counter = count
        self.completionHadler = completionHadler
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func setup() {
 
        self.addSubview(passangerLabel)
        self.addSubview(plusButton)
        self.addSubview(minusButton)
        self.addSubview(numberLabel)

        

//        passangerLabel.text = "Пассажиры"
//        passangerLabel.backgroundColor = .green
        passangerLabel.text = title
        passangerLabel.textColor = .black
        passangerLabel.textAlignment = .left
        passangerLabel.font = .boldSystemFont(ofSize: 18)
        passangerLabel.numberOfLines = 0
        
        minusButton.setTitle("-", for: .normal)
        minusButton.layer.cornerRadius = 15
        minusButton.layer.borderWidth = 1
        minusButton.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        minusButton.setTitleColor(.gray, for: .normal)
        
        numberLabel.text = "0"
        numberLabel.textAlignment = .center
        
        plusButton.setTitle("+", for: .normal)
        plusButton.setTitleColor(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1), for: .normal)
        plusButton.layer.cornerRadius = 15
        plusButton.layer.borderWidth = 1
        plusButton.layer.borderColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: 70).isActive = true
        self.backgroundColor = .white
        
        passangerLabel.translatesAutoresizingMaskIntoConstraints = false
        passangerLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        passangerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        passangerLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        passangerLabel.widthAnchor.constraint(equalToConstant: 120).isActive = true
        passangerLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        plusButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        plusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
        plusButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        plusButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        plusButton.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        numberLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        numberLabel.trailingAnchor.constraint(equalTo: plusButton.leadingAnchor, constant: -10).isActive = true
        numberLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        numberLabel.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        minusButton.translatesAutoresizingMaskIntoConstraints = false
        minusButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        minusButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        minusButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        minusButton.trailingAnchor.constraint(equalTo: numberLabel.leadingAnchor, constant: -10).isActive = true
        minusButton.addTarget(self, action: #selector(minusButtonTapped), for: .touchUpInside)

        
    }
    // MARK: - Handlers
    
        @objc func plusButtonTapped() {
    
            counter += 1
            numberLabel.text = String(counter)
            completionHadler?(counter)
    
        }
    
        @objc func minusButtonTapped() {
    
            if counter <= 0 {
                counter = 0
            } else {
                counter -= 1
            }
            numberLabel.text = String(counter)
            completionHadler?(counter)
        }
    
}


