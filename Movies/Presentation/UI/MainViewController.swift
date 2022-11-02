//
//  MainViewController.swift
//  movies
//
//  Created by Jihoi Kang on 2022/06/09.
//

import UIKit
import Then

class MainViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mainVc = UINavigationController(
            rootViewController: DiContainer.instance.container.resolve(MovieListViewController.self)!
        ).then {
            $0.navigationBar.tintColor = .label
            $0.tabBarItem = UITabBarItem(title: "Movie", image: UIImage(systemName: "film"), tag: 1)
        }
        
        let settingVc = UINavigationController(
            rootViewController: DiContainer.instance.container.resolve(SettingViewController.self)!
        ).then {
            $0.navigationBar.tintColor = .label
            $0.tabBarItem = UITabBarItem(title: "Setting", image: UIImage(systemName: "gearshape.fill"), tag: 1)
        }
        
        setViewControllers([mainVc, settingVc], animated: false)
        
    }
    
}
