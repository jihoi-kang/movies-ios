//
//  DiContainer.swift
//  movies
//
//  Created by Jihoi Kang on 2022/06/09.
//

import Swinject
import Then

class DiContainer {
    static let instance: DiContainer = DiContainer()
    let container = Container()
    
    private init() {
        self.setupViewController()
        self.setupViewModel()
        self.setupNetwork()
    }
}

extension DiContainer {
    private func setupViewController() {
        self.container.register(MainViewController.self) { r in
            return MainViewController()
        }
        self.container.register(MovieListViewController.self) { r in
            let storyboard = UIStoryboard(name: "MovieList", bundle: nil)
            return (storyboard.instantiateViewController(withIdentifier: "MovieList") as! MovieListViewController).then {
                $0.viewModel = r.resolve(MovieListViewModel.self)
            }
        }
        self.container.register(SettingViewController.self) { r in
            let storyboard = UIStoryboard(name: "Setting", bundle: nil)
            return (storyboard.instantiateViewController(withIdentifier: "Setting") as! SettingViewController).then {
                $0.viewModel = r.resolve(SettingViewModel.self)
            }
        }
        self.container.register(MovieDetailViewController.self) { r in
            let storyboard = UIStoryboard(name: "MovieDetail", bundle: nil)
            return (storyboard.instantiateViewController(withIdentifier: "MovieDetail") as! MovieDetailViewController).then {
                $0.viewModel = r.resolve(MovieDetailViewModel.self)
            }
        }
    }
}

extension DiContainer {
    private func setupViewModel() {
        self.container.register(MovieListViewModel.self) { r in
            return MovieListViewModel(apiService: r.resolve(ApiServiceType.self)!)
        }
        self.container.register(SettingViewModel.self) { _ in
            return SettingViewModel()
        }
        self.container.register(MovieDetailViewModel.self) { _ in
            return MovieDetailViewModel()
        }
    }
}

extension DiContainer {
    private func setupNetwork() {
        self.container.register(ApiServiceType.self) { _ in
            return ApiService()
        }
    }
}
