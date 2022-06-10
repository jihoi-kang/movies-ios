//
//  GetMovieItemsResponse.swift
//  movies
//
//  Created by Jihoi Kang on 2022/06/10.
//

struct GetMovieItemsResponse: Decodable {
    let items: [MovieItem]
}

struct MovieItem: Decodable {
    let title: String
}
