//
//  MovieListViewController.swift
//  movies
//
//  Created by Jihoi Kang on 2022/06/09.
//

import RxCocoa
import RxSwift
import UIKit

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
            .text
            .orEmpty
            .changed
            .asDriver()

        let input = MovieListViewModel.Input(query: query)
        
        let output = viewModel.transform(input: input)

        output.movieList
            .asDriver(onErrorJustReturn: [])
            .drive(tableView.rx.items(cellIdentifier: "MovieTableViewCell")) { (_: Int, item: Movie, cell: MovieTableViewCell) in
                cell.bind(item)
            }
            .disposed(by: disposeBag)
    }
}
