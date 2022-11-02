//
//  StringExt.swift
//  movies
//
//  Created by Jihoi Kang on 2022/07/04.
//

extension String {
    func removeHtmlTags() -> String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}
