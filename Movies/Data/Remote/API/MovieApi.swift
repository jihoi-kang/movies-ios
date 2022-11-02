//
//  MovieApi.swift
//  movies
//
//  Created by Jihoi Kang on 2022/07/15.
//

import Moya

private let BASE_URL = "https://api.themoviedb.org"

enum MovieApi {
    case getMovies(_ query: String, _ page: Int)
}

extension MovieApi: TargetType {
    var baseURL: URL {
        return URL(string: BASE_URL)!
    }
        
    var path: String {
        switch self {
        case .getMovies(_, _):
            return "/3/search/movie"
        }
    }
        
    var method: Moya.Method {
        switch self {
        case .getMovies(_, _):
            return .get
        }
    }
        
    var sampleData: Data {
        return Data()
    }
        
    var task: Task {
        switch self {
        case .getMovies(let query, let page):
            let params: [String: Any] = [
                "query": query,
                "page": page,
                "api_key": Bundle.main.tmdbApiKey
            ]
                
            return .requestParameters(parameters: params, encoding: URLEncoding.queryString)
        }
    }
        
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
}
