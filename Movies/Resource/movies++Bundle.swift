//
//  movies++Bundle.swift
//  movies
//
//  Created by Jihoi Kang on 2022/06/10.
//

import Foundation

extension Bundle {
    var tmdbApiKey: String {
        guard let file = self.path(forResource: "KeyInfo", ofType: "plist") else { return "" }
        guard let resource = NSDictionary(contentsOfFile: file) else { return "" }
        guard let key = resource["TMDB_API_KEY"] as? String else { fatalError("Please enter the TMDB_API_KEY at KeyInfo.plist") }
        return key
    }
}
