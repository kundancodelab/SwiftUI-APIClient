//
//  HomeViewModel.swift
//  APITest
//
//  Created by ibarts on 07/03/26.
//

import Foundation
import Combine
class HomeViewModel: ObservableObject {

    @Published var posts: [Post] = []
    @Published var isLoadingData:Bool = false
    @Published var isError:Bool = false
    @Published var errorMessage:String = ""

    init() {
        fetchPosts()
    }

    func fetchPosts() {
     isLoadingData = true
        APIClients.shared.request(
            urlString: APIEndpoints.baseURLString + APIEndpoints.posts
            
        ) { [weak self] (result: Result<[Post], APIError>) in

            switch result {

            case .success(let posts):
                self?.posts = posts
                self?.isLoadingData = false

            case .failure(let error):
                print(error)
                self?.isLoadingData = false
                self?.isError = true
                self?.errorMessage = error.localizedDescription
                
            }
        }
    }
}
