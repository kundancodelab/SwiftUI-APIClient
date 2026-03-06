//
//  APIEndpoints.swift
//  APITest
//
//  Created by ibarts on 07/03/26.
//

import Foundation

enum APIEndpoints {

    static let baseURLString = "https://jsonplaceholder.typicode.com"

    static let posts = "/posts"

    static func post(id: Int) -> String {
        "posts/\(id)"
    }

    static func comments(forPostId id: Int) -> String {
        "posts/\(id)/comments"
    }
}
