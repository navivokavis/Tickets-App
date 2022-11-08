//
//  ViewController.swift
//  Tickets App
//
//  Created by Ivan Sivakou on 23.09.22.
//

import UIKit

class FindViewController: UIViewController {
    
    var fromPlaceTextField = UITextField()
    var toPlaceTextField = UITextField()
    var fromDateTextFeidl = UITextField()
    var fromDatePicker = UIDatePicker()
    var toDateTextField = UITextField()
    var toDatePicker = UIDatePicker()
    var passengersTextField = UITextField()
    var findButton = UIButton()
    var newsScrollView = UIScrollView()
    var newsStackView = UIStackView()
    var newsImageView = UIImageView()
    var imageNewsOne = UIImage()
    var imageNewsTwo = UIImage()
    var imageNewsThree = UIImage()
    var changeButton = UIButton()
    
    var ticket = TicketModel(travelFrom: "", travelTo: "", departDate: "", returnDate: "", passenger: "", adult: 0, bike: 0, child: 0, ticketPrice: "")
    
    
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
        view.addSubview(fromPlaceTextField)
        view.addSubview(toPlaceTextField)
        view.addSubview(fromDateTextFeidl)
        view.addSubview(toDateTextField)
        view.addSubview(passengersTextField)
        view.addSubview(findButton)
        view.addSubview(newsScrollView)
        view.addSubview(changeButton)
        newsScrollView.addSubview(newsStackView)
    }
    
    func configureSubviews() {
        view.backgroundColor = #colorLiteral(red: 0.962770164, green: 0.9748905301, blue: 0.9746772647, alpha: 1)
        
        self.navigationController?.setupNavigationController()
        
        fromPlaceTextField.borderStyle = .roundedRect
        fromPlaceTextField.placeholder = "Откуда"
        fromPlaceTextField.font = .boldSystemFont(ofSize: 20)
        fromPlaceTextField.textAlignment = .left
        fromPlaceTextField.addTarget(self, action: #selector(changeValue), for: .editingChanged)
        
        toPlaceTextField.borderStyle = .roundedRect
        toPlaceTextField.placeholder = "Куда"
        toPlaceTextField.font = .boldSystemFont(ofSize: 20)
        toPlaceTextField.textAlignment = .left
        fromPlaceTextField.addTarget(self, action: #selector(changeValue), for: .editingChanged)
        
        fromDateTextFeidl.borderStyle = .roundedRect
        fromDateTextFeidl.placeholder = "Туда"
        fromDateTextFeidl.font = .boldSystemFont(ofSize: 20)
        fromDateTextFeidl.textAlignment = .left
        fromDateTextFeidl.addTarget(self, action: #selector(changeValue), for: .editingChanged)
        
        createFromDatePicker()
        
        toDateTextField.borderStyle = .roundedRect
        toDateTextField.placeholder = "Обратно"
        toDateTextField.font = .boldSystemFont(ofSize: 20)
        toDateTextField.textAlignment = .left
        toDateTextField.addTarget(self, action: #selector(changeValue), for: .editingChanged)
        
        createToDatePicker()
        
        passengersTextField.borderStyle = .roundedRect
        passengersTextField.placeholder = "Пассажиры"
        passengersTextField.font = .boldSystemFont(ofSize: 20)
        passengersTextField.textAlignment = .left
        passengersTextField.addTarget(self, action: #selector(presentModal), for: .editingDidBegin)
//        passengersTextField.addTarget(self, action: #selector(openSheetPassengersTextField), for: .editingDidBegin)
//        passengersTextField.addTarget(self, action: #selector(presentModal), for: .editingChanged)
//        passengersTextField.textField.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(presentModal)))
        
        findButton.setTitle("НАЙТИ БИЛЕТЫ", for: .normal)
        findButton.backgroundColor = .gray
        findButton.tintColor = .white
        findButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        findButton.layer.cornerRadius = 10
        
        changeButton.setImage(UIImage(systemName: "arrow.up.arrow.down"), for: .normal)
        changeButton.layer.cornerRadius = 25
        changeButton.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        changeButton.layer.borderWidth = 2
        changeButton.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        changeButton.tintColor = .gray
        
        newsScrollView.isPagingEnabled = true
        
        newsStackView.axis = .horizontal
        newsStackView.distribution = .fillEqually
        
        addImageOnStackView()
        
    }
    
    func layoutSubviews() {
        fromPlaceTextField.translatesAutoresizingMaskIntoConstraints = false
        fromPlaceTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        fromPlaceTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        fromPlaceTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        fromPlaceTextField.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        toPlaceTextField.translatesAutoresizingMaskIntoConstraints = false
        toPlaceTextField.topAnchor.constraint(equalTo: fromPlaceTextField.bottomAnchor, constant: 5).isActive = true
        toPlaceTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        toPlaceTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        toPlaceTextField.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        fromDateTextFeidl.translatesAutoresizingMaskIntoConstraints = false
        fromDateTextFeidl.topAnchor.constraint(equalTo: toPlaceTextField.bottomAnchor, constant: 5).isActive = true
        fromDateTextFeidl.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        fromDateTextFeidl.rightAnchor.constraint(equalTo: view.centerXAnchor, constant: -5).isActive = true
        fromDateTextFeidl.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        toDateTextField.translatesAutoresizingMaskIntoConstraints = false
        toDateTextField.topAnchor.constraint(equalTo: toPlaceTextField.bottomAnchor, constant: 5).isActive = true
        toDateTextField.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: 5).isActive = true
        toDateTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        toDateTextField.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        passengersTextField.translatesAutoresizingMaskIntoConstraints = false
        passengersTextField.topAnchor.constraint(equalTo: toDateTextField.bottomAnchor, constant: 5).isActive = true
        passengersTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        passengersTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        passengersTextField.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        findButton.translatesAutoresizingMaskIntoConstraints = false
        findButton.topAnchor.constraint(equalTo: passengersTextField.bottomAnchor, constant: 5).isActive = true
        findButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        findButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        findButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        newsScrollView.translatesAutoresizingMaskIntoConstraints = false
        newsScrollView.topAnchor.constraint(equalTo: findButton.bottomAnchor, constant: 5).isActive = true
        newsScrollView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        newsScrollView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        newsScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        
        newsStackView.translatesAutoresizingMaskIntoConstraints = false
        newsStackView.topAnchor.constraint(equalTo: findButton.bottomAnchor, constant: 5).isActive = true
        newsStackView.leftAnchor.constraint(equalTo: newsScrollView.leftAnchor, constant: 0).isActive = true
        newsStackView.rightAnchor.constraint(equalTo: newsScrollView.rightAnchor, constant: 0).isActive = true
        newsStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        
        changeButton.translatesAutoresizingMaskIntoConstraints = false
        changeButton.topAnchor.constraint(equalTo: fromPlaceTextField.bottomAnchor, constant: -25).isActive = true
        changeButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
        changeButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        changeButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    
    //MARK: - Create DatePicker
    func createFromToolBar() -> UIToolbar {
        //toolbar
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        //Button
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneFromPressed))
        toolBar.setItems([doneButton], animated: true)
        
        return toolBar
    }
    
    func createToToolBar() -> UIToolbar {
        //toolbar
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        //Button
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneToPressed))
        toolBar.setItems([doneButton], animated: true)
        
        return toolBar
    }
    
    func createFromDatePicker() {
        fromDatePicker.preferredDatePickerStyle = .inline
        fromDatePicker.datePickerMode = .date
        fromDateTextFeidl.inputView = fromDatePicker
        fromDateTextFeidl.inputAccessoryView = createFromToolBar()
    }
    
    func createToDatePicker() {
        toDatePicker.preferredDatePickerStyle = .inline
        toDatePicker.datePickerMode = .date
        toDateTextField.inputView = toDatePicker
        toDateTextField.inputAccessoryView = createToToolBar()
    }
    
    @objc func doneFromPressed() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        fromDateTextFeidl.text = dateFormatter.string(from: fromDatePicker.date)
        view.endEditing(true)
    }
    
    @objc func doneToPressed() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        toDateTextField.text = dateFormatter.string(from: toDatePicker.date)
        view.endEditing(true)
    }
    
    
    //MARK: - Change color of find button
    func changeColorOfFindButton() {
        if fromPlaceTextField.text != "" && toPlaceTextField.text != "" && passengersTextField.text != "" && fromDateTextFeidl.text != "" && toDateTextField.text != "" {
            findButton.backgroundColor = .green
        }
    }
    
    @objc func changeValue() {
        changeColorOfFindButton()
    }
    
    //MARK: - Open Sheet
//    @objc func openSheetPassengersTextField() {
//        let bottomSheetWindow = PassengersViewController()
//        if let sheet = bottomSheetWindow.sheetPresentationController {
//            sheet.detents = [.medium()]
//            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
//            sheet.prefersGrabberVisible = true
//
//        }
//        present(bottomSheetWindow, animated: true)
//    }
    
    //MARK: - add Image On StackView
    func addImageOnStackView() {
        let numberofImage = 4
        for i in 0...numberofImage {
            guard let imageNews = UIImage(named: "ImageForScrollView") else { return }
            let imageView = UIImageView(image: imageNews)
            newsStackView.addArrangedSubview( imageView )
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        }
    }
    
    
    
    
    @objc func presentModal() {
        let detailViewController = DetailViewController()
        
        detailViewController.threeInt = { [weak self] adult, bike, child in
            
            self?.ticket.adult = adult
            self?.ticket.bike = bike
            self?.ticket.child = child
            self?.passengersTextField.text = self?.stringToShow(adult: adult, bike: bike, child: child)
            
            
//            self?.textFieldsIsNotEmpty()
            
            
        }
        
        detailViewController.adultCounter = ticket.adult
        detailViewController.bikeCounter = ticket.bike
        detailViewController.childCounter = ticket.child
        
        detailViewController.transitioningDelegate  = detailViewController.overlayTransitioningDelegate
        detailViewController.modalPresentationStyle = .custom
        self.present(detailViewController, animated: true, completion: nil)
        
        //        let nav = UINavigationController(rootViewController: detailViewController)
        //        nav.modalPresentationStyle = .pageSheet
        //
        //        if let sheet = nav.sheetPresentationController {
        //
        //            sheet.detents = [.medium()]
        //            sheet.prefersGrabberVisible = true
        //            sheet.preferredCornerRadius = 15
        //            sheet.prefersEdgeAttachedInCompactHeight = true
        //            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
        //        }
        //        present(nav, animated: true, completion: nil)
    }
    
    func stringToShow(adult: Int, bike: Int, child: Int) -> String {
        
        var finalString = ""
        
        if adult != 0 {
            finalString =  "Взрослые: \(adult) "
        }
        
        if bike != 0 {
            finalString += "Велосипеды: \(bike) "
        }
        
        if child != 0 {
            finalString += "Дети: \(child) "
        }
        
        return finalString
    }
    
    
}


