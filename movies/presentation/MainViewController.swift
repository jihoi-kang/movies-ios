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
        
        let mainVc: MovieListViewController = (DiContainer.instance.container.resolve(MovieListViewController.self)!).then {
            $0.title = "Movie"
            $0.navigationItem.largeTitleDisplayMode = .always
        }
        
        let mainNavVc = UINavigationController(rootViewController: mainVc).then {
            $0.navigationBar.tintColor = .label
            $0.tabBarItem = UITabBarItem(title: "Movie", image: UIImage(systemName: "film"), tag: 1)
        }
        
        let settingVc: SettingViewController = (DiContainer.instance.container.resolve(SettingViewController.self)!).then {
            $0.title = "Setting"
            $0.navigationItem.largeTitleDisplayMode = .always
        }
        
        let settingNavVc = UINavigationController(rootViewController: settingVc).then {
            $0.navigationBar.tintColor = .label
            $0.tabBarItem = UITabBarItem(title: "Setting", image: UIImage(systemName: "gearshape.fill"), tag: 1)
        }
        
        setViewControllers([mainNavVc, settingNavVc], animated: false)
        
    }
    
}
