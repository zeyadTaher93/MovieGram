//
//  Movie.swift
//  MovieGram
//
//  Created by zeyad on 2/15/20.
//  Copyright © 2020 zeyad. All rights reserved.
//

import Foundation

struct APIResults: Decodable {
    let page: Int
    let numResults: Int
    let numPages: Int
    let movies: [Movie]
    
    private enum CodingKeys: String, CodingKey {
        case page
        case numResults = "total_results"
        case numPages = "total_pages"
        case movies  = "results"
    }
}


struct Movie: Decodable {
    
    let id:Int
    let posterPath:String
    let videoPath:String?
    let backdrop:String
    let title:String
    var releaseDate:String
    var rating:String
    let overview:String
    
     enum CodingKeys: String , CodingKey {
        case  id
        case  posterPath = "poster_path"
        case  videoPath
        case  backdrop = "backdrop_path"
        case  title
        case  releaseDate = "release_date"
        case  rating = "vote_average"
        case  overview
    }
}

struct VideoResults: Decodable {
    let details: [VideoKey]
    private enum CodingKeys: String, CodingKey {
        case details = "results"
    }
}

struct VideoKey: Decodable {
    let key: String
}
