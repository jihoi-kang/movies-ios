//
//  DiContainer.swift
//  movies
//
//  Created by Jihoi Kang on 2022/06/09.
//

import Swinject
import Moya
import Then

class DiContainer {
    static let instance: DiContainer = DiContainer()
    let container = Container()
    
    private init() {
        self.setupViewController()
        self.setupViewModel()
        self.setupRepository()
        self.setupDataSource()
        self.setupUseCase()
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
                $0.title = "Movie"
            }
        }
        self.container.register(SettingViewController.self) { r in
            let storyboard = UIStoryboard(name: "Setting", bundle: nil)
            return (storyboard.instantiateViewController(withIdentifier: "Setting") as! SettingViewController).then {
                $0.viewModel = r.resolve(SettingViewModel.self)
                $0.title = "Setting"
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
            return MovieListViewModel(getMoviesUseCase: r.resolve(GetMoviesUseCase.self)!)
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
    private func setupRepository() {
        self.container.register(MovieRepository.self) { r in
            return MovieRepositoryImpl(remoteDataSource: r.resolve(MovieRemoteDataSource.self)!)
        }
    }
}

extension DiContainer {
    private func setupDataSource() {
        self.container.register(MovieRemoteDataSource.self) { _ in
            return MovieRemoteDataSourceImpl(provider: MoyaProvider<MovieApi>())
        }
    }
}

extension DiContainer {
    private func setupUseCase() {
        self.container.register(GetMoviesUseCase.self) { r in
            return GetMoviesUseCaseImpl(movieRepository: r.resolve(MovieRepository.self)!)
        }
    }
}
