//
//  MovieApi.swift
//  MovieGram
//
//  Created by zeyad on 2/15/20.
//  Copyright © 2020 zeyad. All rights reserved.
//

import Moya

import Foundation
enum MovieApi {
    case reco(id:Int)
    case topRated(page:Int)
    case newMovies(page:Int)
    case video(id:Int)
}
extension MovieApi: TargetType {
    var headers: [String : String]? {
        return nil
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var baseURL: URL {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/")else{fatalError("baseURL could not be configured")}
        return url
    }
    
    var path: String {
       switch self {
             case .reco(let id):
                 return "\(id)/recommendations"
             case .topRated:
                 return "popular"
             case .newMovies:
                 return "now_playing"
             case .video(let id):
                 return "\(id)/videos"
             }
    }
    
    var method: Moya.Method {
        switch self {
        case .reco, .topRated, .newMovies, .video:
            return .get
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .reco, .video:
            return ["api_key": API.apiKey]
        case .topRated(let page), .newMovies(let page):
            return ["page": page, "api_key": API.apiKey]
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        switch self {
        case .reco, .topRated, .newMovies, .video:
            return URLEncoding.queryString
        }
    }
    
    var task: Task {
           switch self {
             case .reco, .topRated, .newMovies, .video:
                return .requestParameters(parameters: parameters!, encoding: parameterEncoding)
             }
    }
    
   
    
    
}
