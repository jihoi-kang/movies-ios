//
//  MovieRepository.swift
//  movies
//
//  Created by Jihoi Kang on 2022/07/15.
//

import RxSwift

protocol MovieRepository {
    func getMovies(query: String, page: Int) -> Single<[MovieEntity]>
}
