//
//  ABI.swift
//  MovieGram
//
//  Created by zeyad on 2/15/20.
//  Copyright © 2020 zeyad. All rights reserved.
//

import Foundation
import Moya

class API {
    static let apiKey = "6b851ce443de845e61fad54b734c7315"
    static let provider = MoyaProvider<MovieApi>(plugins: [NetworkLoggerPlugin(verbose: true)])
    
    static func requestNewMovies(page: Int , completion: @escaping ([Movie])->()) {
        provider.request(.newMovies(page: page)) { (results) in
            switch results {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(APIResults.self, from: response.data)
                    completion(results.movies)
                }catch let error {
                    print(error)
                }
            case let .failure(error):
                print(error)
            }
        }
    }
}
