//
//  MovieJSON.swift
//  TMDB_etude
//
//  Created by Taro on 2019/05/20.
//  Copyright © 2019 Taro. All rights reserved.
//

import Foundation

struct MovieSearchResult:Codable {
    let results:[MovieData]
}

struct MovieData:Codable {
    let id:Int
    let title:String
    let poster_path:String? // WARNING Not all data has "poster_path". It maybe null.
}
