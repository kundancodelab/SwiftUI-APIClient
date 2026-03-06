//
//  PostModels.swift
//  APITest
//
//  Created by ibarts on 07/03/26.
//

import Foundation

struct Post: Decodable , Hashable {
    let id: Int
    let title: String
    let body: String
}

