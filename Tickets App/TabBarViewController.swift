//
//  TabBarViewController.swift
//  Tickets App
//
//  Created by s x on 25.09.22.
//

import UIKit


class TabBar: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
        setupVCs()
        
    }
    
    
    
    fileprivate func createNavController(for rootViewController: UIViewController,
                                         title: String,
                                         image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true
//        navController.navigationBar.tintColor = .white
        navController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        rootViewController.navigationItem.title = title
        return navController
    }
    
    func setupVCs() {
        viewControllers = [
            createNavController(for: FindViewController(), title: "Поиск", image: UIImage(systemName: "magnifyingglass")!),
            createNavController(for: TicketsViewController(), title: "Билеты", image: UIImage(systemName: "ticket")!),
            createNavController(for: HelpViewController(), title: "Помощь", image: UIImage(systemName: "info")!)
        ]
    }
}

