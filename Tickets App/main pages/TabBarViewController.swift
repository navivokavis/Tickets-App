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
//        tabBar.tintColor = .label
        tabBar.tintColor = .green
        setupVCs()
        
    }
    
    
    
    fileprivate func createNavController(for rootViewController: UIViewController,
                                         toptitle: String,
                                         title: String,
                                         image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true
        navController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navController.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        rootViewController.navigationItem.title = toptitle
        return navController
    }
    
    func setupVCs() {
        viewControllers = [
            createNavController(for: FindViewController(), toptitle: "Найти билеты", title: "Поиск", image: UIImage(systemName: "magnifyingglass")!),
            createNavController(for: TicketsViewController(), toptitle: "Билеты", title: "Билеты", image: UIImage(systemName: "ticket")!),
            createNavController(for: HelpViewController(), toptitle: "Помощь", title: "Помощь", image: UIImage(systemName: "info")!)
        ]
    }
}

