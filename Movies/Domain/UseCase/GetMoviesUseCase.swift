//
//  GetMoviesUseCase.swift
//  movies
//
//  Created by Jihoi Kang on 2022/11/01.
//

import Foundation
import RxSwift

protocol GetMoviesUseCase {
    func execute(params: GetMoviesUseCaseImpl.Params) -> Single<[UiMovieModel]>
}


final class GetMoviesUseCaseImpl: GetMoviesUseCase {
    
    private let movieRepository: MovieRepository
    
    init(movieRepository: MovieRepository) {
        self.movieRepository = movieRepository
    }
    
    func execute(params: Params) -> Single<[UiMovieModel]> {
        return movieRepository.getMovies(query: params.query, page: params.page).map { $0.map { $0.toUiModel() } }
    }
    
    struct Params {
        let query: String
        let page: Int
    }
    
}
