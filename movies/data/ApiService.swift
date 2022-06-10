//
//  ApiService.swift
//  movies
//
//  Created by Jihoi Kang on 2022/06/10.
//

import Alamofire
import RxSwift

class ApiService: ApiServiceType {
    func getMovieItems(query: String) -> Single<GetMovieItemsResponse> {
        return Single<GetMovieItemsResponse>.create { observer in
            let url = "https://openapi.naver.com/v1/search/movie.json"
            AF.request(
                url,
                method: .get,
                parameters: ["query": query],
                headers: [
                    "X-Naver-Client-Id": Bundle.main.clientId,
                    "X-Naver-Client-Secret": Bundle.main.clientSecret,
                ]
            ).validate()
                .responseDecodable(of: GetMovieItemsResponse.self) { response in
                    switch response.result {
                    case let .success(data):
                        observer(.success(data))
                    case let .failure(error):
                        observer(.failure(error))
                    }
                }
            return Disposables.create()
        }
    }
}
