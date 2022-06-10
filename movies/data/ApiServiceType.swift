//
//  ApiServiceType.swift
//  movies
//
//  Created by Jihoi Kang on 2022/06/10.
//

import RxSwift

protocol ApiServiceType {
    func getMovieItems(query: String) -> Single<GetMovieItemsResponse>
}
