//
//  MovieRemoteDataSourceImpl.swift
//  movies
//
//  Created by Jihoi Kang on 2022/11/01.
//

import Foundation
import Moya
import RxSwift

class MovieRemoteDataSourceImpl: MovieRemoteDataSource {
    
    private let provider: MoyaProvider<MovieApi>
    
    init(provider: MoyaProvider<MovieApi>) {
        self.provider = provider
    }
    
    func getMovies(query: String, page: Int) -> Single<GetMoviesResponse> {
        return provider.rx.request(.getMovies(query, page))
            .map(GetMoviesResponse.self)
    }
    
}
