//
//  movies++Bundle.swift
//  movies
//
//  Created by Jihoi Kang on 2022/06/10.
//

import Foundation

extension Bundle {
    var clientId: String {
        guard let file = self.path(forResource: "KeyInfo", ofType: "plist") else { return "" }
        guard let resource = NSDictionary(contentsOfFile: file) else { return "" }
        guard let key = resource["X_NAVER_CLIENT_ID"] as? String else { fatalError("Please enter the X_NAVER_CLIENT_ID at KeyInfo.plist") }
        return key
    }
    var clientSecret: String {
        guard let file = self.path(forResource: "KeyInfo", ofType: "plist") else { return "" }
        guard let resource = NSDictionary(contentsOfFile: file) else { return "" }
        guard let key = resource["X_NAVER_CLIENT_SECRET"] as? String else { fatalError("Please enter the X_NAVER_CLIENT_SECRET at KeyInfo.plist") }
        return key
    }
}
