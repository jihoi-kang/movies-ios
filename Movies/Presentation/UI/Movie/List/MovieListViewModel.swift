//
//  MovieListViewModel.swift
//  movies
//
//  Created by Jihoi Kang on 2022/06/09.
//

import RxSwift
import RxCocoa

class MovieListViewModel: BaseViewModel, BaseViewModelType {
    
    let getMoviesUseCase: GetMoviesUseCase
    
    let movieList: BehaviorRelay<[UiMovieModel]> = .init(value: [])
    let currentPage: BehaviorRelay<Int> = .init(value: 1)
    
    init(getMoviesUseCase: GetMoviesUseCase) {
        self.getMoviesUseCase = getMoviesUseCase
    }
    
    struct Input {
        let query: Observable<String>
        let loadMore: Observable<Void>
    }
    
    struct Output {
        let movieList: BehaviorRelay<[UiMovieModel]>
    }
    
    func transform(input: Input) -> Output {
        let loadMore = input.loadMore
            .do(onNext: { [weak self] _ in
                guard let self = self else { return }
                self.currentPage.accept(self.currentPage.value + 1)
            })
            .withLatestFrom(input.query)
                
        let query = input.query
            .do(onNext: { [weak self] _ in
                self?.currentPage.accept(1)
            })

        Observable.merge(query, loadMore)
            .flatMapLatest { query in
                return self.getMoviesUseCase.execute(params: .init(query: query, page: self.currentPage.value))
            }
            .subscribe(onNext: { [weak self] items in
                guard let self = self else { return }
                
                var totalMovieList = self.movieList.value
                if (self.currentPage.value == 1) {
                    totalMovieList.removeAll()
                }
                totalMovieList.append(contentsOf: items)
                self.movieList.accept(totalMovieList)
            })
            .disposed(by: disposeBag)
                
        return Output(movieList: movieList)
    }
}
