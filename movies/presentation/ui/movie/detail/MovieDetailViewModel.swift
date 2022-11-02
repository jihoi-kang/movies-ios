//
//  MovieDetailViewModel.swift
//  movies
//
//  Created by Jihoi Kang on 2022/06/09.
//

import RxSwift
import RxCocoa

class MovieDetailViewModel: BaseViewModel, BaseViewModelType {
    
    let movie: BehaviorRelay<UiMovieModel?> = .init(value: nil)
    
    struct Input {
        
    }
    
    struct Output {
        let movie: BehaviorRelay<UiMovieModel?>
    }
    
    
    func transform(input: Input) -> Output {
        return Output(movie: self.movie)
    }
    
}
