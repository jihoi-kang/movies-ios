//
//  MovieListViewModel.swift
//  movies
//
//  Created by Jihoi Kang on 2022/06/09.
//

import RxSwift
import RxCocoa

class MovieListViewModel: BaseViewModel, BaseViewModelType {
    
    let apiService: ApiServiceType
    
    let movieList: BehaviorSubject<[Movie]> = .init(value: [])
    
    init(apiService: ApiServiceType) {
        self.apiService = apiService
    }
    
    struct Input {
        let query: Driver<String>
    }
    
    struct Output {
        let movieList: BehaviorSubject<[Movie]>
    }
    
    func transform(input: Input) -> Output {
        input.query.asObservable()
            .debounce(.milliseconds(200), scheduler: ConcurrentDispatchQueueScheduler.init(qos: .background))
            .flatMapLatest { [weak self] query -> Observable<GetMovieItemsResponse> in
                if (query.isEmpty) {
                    return Observable.empty()
                }
                
                guard let self = self else {
                    return Observable.empty()
                }
                return self.apiService.getMovieItems(query:query).asObservable()
            }
            .map { $0.items }
            .map { $0.map { Movie(title: $0.title) } }
            .bind(to: movieList)
            .disposed(by: disposeBag)
        
        return Output(movieList: movieList)
    }
}
