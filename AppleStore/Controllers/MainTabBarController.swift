//
//  MainTabbarController.swift
//  AppleStore
//
//  Created by AriChou on 4/3/21.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [createNavController(for: AppsPageController(), image: UIImage(systemName: "square.stack.3d.up.fill")!, title: "App"),createNavController(for: AppSearchViewController(), image: UIImage(systemName: "magnifyingglass")!, title: "Search")]
    }
}

extension MainTabBarController {
    private func createNavController(for rootViewController: UIViewController, image: UIImage, title: String) -> UIViewController {
        let nav = UINavigationController(rootViewController: rootViewController)
        rootViewController.navigationItem.title = title
        rootViewController.navigationController?.navigationBar.prefersLargeTitles = true
        rootViewController.view.backgroundColor = .white
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        return nav
    }
}
