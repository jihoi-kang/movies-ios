//
//  MovieRepositoryImpl.swift
//  movies
//
//  Created by Jihoi Kang on 2022/07/15.
//

import Moya
import RxSwift

class MovieRepositoryImpl: MovieRepository {
    
    private let remoteDataSource: MovieRemoteDataSource
    
    init(remoteDataSource: MovieRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }
    
    func getMovies(query: String, page: Int) -> Single<[MovieEntity]> {
        return remoteDataSource.getMovies(query: query, page: page).map { $0.toEntity() }
    }
}
