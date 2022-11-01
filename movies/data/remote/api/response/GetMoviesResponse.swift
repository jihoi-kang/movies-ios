//
//  GetMoviesResponse.swift
//  movies
//
//  Created by Jihoi Kang on 2022/06/10.
//

struct GetMoviesResponse: Decodable {
    let movies: [Movie]
    let totalPages: Int
    
    enum CodingKeys: String, CodingKey {
        case movies = "results"
        case totalPages = "total_pages"
    }
}

extension GetMoviesResponse {
    struct Movie: Decodable {
        let id: Int
        let posterPath: String?
        let adult: Bool
        let overview: String
        let releaseDate: String
        let genreIds: [Int]
        let originalTitle: String
        let originalLanguage: String
        let title: String
        let backdropPath: String?
        let popularity: Float
        let voteCount: Int
        let video: Bool
        let voteAverage: Float
        
        enum CodingKeys: String, CodingKey {
            case id
            case posterPath = "poster_path"
            case adult
            case overview
            case releaseDate = "release_date"
            case genreIds = "genre_ids"
            case originalTitle = "original_title"
            case originalLanguage = "original_language"
            case title
            case backdropPath = "backdrop_path"
            case popularity
            case voteCount = "vote_count"
            case video
            case voteAverage = "vote_average"
        }
    }
}

extension GetMoviesResponse {
    func toEntity() -> [MovieEntity] {
        return movies.map { $0.toEntity() }
    }
}

private let BASE_IMAGE_URL = "https://image.tmdb.org/t/p/w780"

extension GetMoviesResponse.Movie {
    func toEntity() -> MovieEntity {
        return .init(
            id: id,
            posterUrl: posterPath != nil ? "\(BASE_IMAGE_URL)\(posterPath!)" : "",
            backgroundUrl: backdropPath != nil ? "\(BASE_IMAGE_URL)\(backdropPath!)" : "",
            title: title,
            overview: overview,
            releaseDate: releaseDate
        )
    }
}
