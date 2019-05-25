//
//  MovieJSON.swift
//  TMDB_etude
//
//  Created by Taro on 2019/05/20.
//  Copyright © 2019 Taro. All rights reserved.
//

import Foundation

struct MovieJSON:Codable {
    let results:[MovieData]
}

struct MovieData:Codable {
    let title:String
    let poster_path:String? // WARNING Not all data has "poster_path". It maybe null.
}

