//
//  CustomPassengerTableViewCell.swift
//  Tickets App
//
//  Created by s x on 12.10.22.
//

import UIKit

class CustomPassengerTableViewCell: UITableViewCell {

    static let identifier = "CustomPassengerTableViewCell"
    var plusMinusView = UIView()
    var plusButton = UIButton()
    var minusButton = UIButton()
    var _textLabel = UILabel()
    
    private let _lefttextLabel: UILabel = {
        let _lefttextLabel = UILabel()
//        _lefttextLabel.backgroundColor = .blue
        return _lefttextLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(_lefttextLabel)
        plusMinusView.addSubview(minusButton)
        plusMinusView.addSubview(_textLabel)
        plusMinusView.addSubview(plusButton)
        contentView.addSubview(plusMinusView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(text: String) {
        _textLabel.text = text
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        _lefttextLabel.frame = CGRect(x: 5,
                                  y: 5,
                                  width: 100,
                                  height: contentView.frame.size.height - 10)
        
        minusButton.setTitle("-", for: .normal)
        minusButton.layer.cornerRadius = 15
        minusButton.layer.borderWidth = 1
        minusButton.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        minusButton.setTitleColor(.gray, for: .normal)
        
        _textLabel.text = "0"
        _textLabel.textAlignment = .center
        
        plusButton.setTitle("+", for: .normal)
        plusButton.setTitleColor(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1), for: .normal)
        plusButton.layer.cornerRadius = 15
        plusButton.layer.borderWidth = 1
        plusButton.layer.borderColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        plusButton.topAnchor.constraint(equalTo: plusMinusView.topAnchor, constant: 10).isActive = true
//        plusButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        plusButton.rightAnchor.constraint(equalTo: plusMinusView.rightAnchor, constant: -10).isActive = true
//        plusButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        plusButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        plusButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        _textLabel.translatesAutoresizingMaskIntoConstraints = false
        _textLabel.topAnchor.constraint(equalTo: plusMinusView.topAnchor, constant: 0).isActive = true
//      _textLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        _textLabel.rightAnchor.constraint(equalTo: plusButton.leftAnchor, constant: 0).isActive = true
//      _textLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        _textLabel.widthAnchor.constraint(equalToConstant: 30).isActive = true
        _textLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        minusButton.translatesAutoresizingMaskIntoConstraints = false
        minusButton.topAnchor.constraint(equalTo: plusMinusView.topAnchor, constant: 10).isActive = true
//      minusButtonon.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        minusButton.rightAnchor.constraint(equalTo: _textLabel.leftAnchor, constant: 0).isActive = true
//      minusButtonon.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        minusButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        minusButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        plusMinusView.translatesAutoresizingMaskIntoConstraints = false
        plusMinusView.heightAnchor.constraint(equalToConstant: 50).isActive = true
//        plusMinusView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        plusMinusView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        plusMinusView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
    }
}
