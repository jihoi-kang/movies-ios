//
//  MovieRemoteSource.swift
//  movies
//
//  Created by Jihoi Kang on 2022/11/01.
//

import Foundation
import RxSwift

protocol MovieRemoteDataSource {
    func getMovies(query: String, page: Int) -> Single<GetMoviesResponse>
}
