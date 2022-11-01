//
//  Movie.swift
//  movies
//
//  Created by Jihoi Kang on 2022/06/10.
//

struct UiMovieModel {
    let id: Int
    let posterUrl: String
    let backgroundUrl: String
    let title: String
    let overview: String
    let releaseDate: String
}

extension MovieEntity {
    func toUiModel() -> UiMovieModel {
        return .init(
            id: id,
            posterUrl: posterUrl,
            backgroundUrl: backgroundUrl,
            title: title,
            overview: overview,
            releaseDate: releaseDate
        )
    }
}
