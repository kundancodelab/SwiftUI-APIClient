//
//  APIClients.swift
//  APITest
//
//  Created by ibarts on 07/03/26.
//

import Foundation
enum HTTPMethod: String {
    case GET
    case POST
    case PUT
    case DELETE
}

enum APIError : Error {
    case invalidURL
    case invalidResponse
    case decodingError
    case networkError(Error)
    case somethingWentWrong(Error)
    case serverError(Int)
}

class APIClients {
    static let shared = APIClients()
    private init() {}
    
    func request<T:Decodable>( urlString:String, _ httpsMethod:HTTPMethod = .GET, _ param : [String:String]? = nil , _ token:String? = nil , _ completionHandler: @escaping (Result<T,APIError>) -> Void ) {
          /// check url
         print("URL: \(urlString)")
         guard let url = URL(string: urlString) else {
             completionHandler(.failure(.invalidURL))
             return
        }
        
        /// make request
        ///
        
        var request = URLRequest(url: url)
        request.httpMethod = httpsMethod.rawValue
        if let token {
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        
      
        if let param = param {
            guard var urlComponents = URLComponents(string: urlString) else {
                completionHandler(.failure(.invalidURL))
                return
            }

            urlComponents.queryItems = param.map {
                URLQueryItem(name: $0.key, value: $0.value)
            }
            guard let urlWithParams = urlComponents.url else {
                completionHandler(.failure(.invalidURL))
                return
            }
            request.url = urlWithParams
        }
        
        /// create a task
        ///
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error {
                DispatchQueue.main.async {
                    completionHandler(.failure(.networkError(error)))
                }
                return
            }
            guard let httpResponse = response as? HTTPURLResponse else {
                DispatchQueue.main.async {
                    completionHandler(.failure(.invalidResponse))
                }
             
                return
            }

            guard 200...299 ~= httpResponse.statusCode else {
                DispatchQueue.main.async {
                    completionHandler(.failure(.serverError(httpResponse.statusCode)))
                }
              
                return
            }
            
            guard let data else {
                DispatchQueue.main.async {
                    completionHandler(.failure(.decodingError))
                }
               
                return
            }
            
            /// now, we have raw data decode it.
            ///
            
            let decoder = JSONDecoder()
            do {
                print("JSON Response: \(String(decoding: data, as: UTF8.self))")
                let decodedData = try decoder.decode(T.self, from: data)
                DispatchQueue.main.async {
                    completionHandler(.success(decodedData))
                }
            } catch {
                print("Error: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    completionHandler(.failure(.decodingError))
                }
            }
            
        }.resume()
   
        
    
    }
}
