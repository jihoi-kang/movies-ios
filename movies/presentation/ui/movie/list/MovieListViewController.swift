//
//  MovieListViewController.swift
//  movies
//
//  Created by Jihoi Kang on 2022/06/09.
//

import RxCocoa
import RxSwift
import UIKit
import Moya
import Then

class MovieListViewController: BaseViewController<MovieListViewModel> {
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUi()
        setupObserve()
    }
    
    private func setupUi() {
        tableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieTableViewCell")
        tableView.tableFooterView = UIView()
    }
    
    private func setupObserve() {
        assert(viewModel != nil)

        let query = searchBar.rx
            .searchButtonClicked.map { [weak self] _ in
                return self?.searchBar.text ?? ""
            }
            .do(onNext: { [weak self] _ in
                self?.view.endEditing(true)
            })
            .filter { $0.count > 0 }
            .asObservable()
        
        let loadMore = tableView.rx.onReachedEnd
        
        let input = MovieListViewModel.Input(query: query, loadMore: loadMore)
        
        let output = viewModel.transform(input: input)
        
        output.movieList
            .asDriver(onErrorJustReturn: [])
            .drive(tableView.rx.items(cellIdentifier: "MovieTableViewCell")) { (_: Int, item: UiMovieModel, cell: MovieTableViewCell) in
                cell.bind(item)
            }
            .disposed(by: disposeBag)
        
        tableView.rx
            .modelSelected(UiMovieModel.self)
            .subscribe(onNext: { item in
                let vc: MovieDetailViewController = (DiContainer.instance.container.resolve(MovieDetailViewController.self)!).then {
                    $0.title = "\(item.title)"
                    $0.navigationItem.largeTitleDisplayMode = .always
                    $0.movie = item
                }
                
                self.navigationController?.pushViewController(vc, animated: true)
            })
            .disposed(by: disposeBag)
    
        tableView.rx
            .itemSelected
            .subscribe(onNext: { indexPath in
                self.tableView.deselectRow(at: indexPath, animated: true)
            })
            .disposed(by: disposeBag)
        
    }
}
