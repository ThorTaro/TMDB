//
//  WatchedMovieModel.swift
//  TMDB
//
//  Created by Taro on 2019/05/29.
//  Copyright © 2019 Taro. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class WatchedMovieModel {
    private init(){} // Singleton
    static let shared = WatchedMovieModel()
    
    private let observable = BehaviorRelay<[Int]>(value: [])

    public var watchedMovieList: BehaviorRelay<[Int]>{
        return self.observable
    }
    
    public func addWatchedMovie(movieID: Int){
        self.observable.accept([movieID])
    }
    
    public func getIsWatched(movieID:Int) -> Bool {
        var isWatched:Bool = false
        for i in self.watchedMovieList.value {
            if i == movieID {
                isWatched = true
            }
        }
        return isWatched
    }
}
