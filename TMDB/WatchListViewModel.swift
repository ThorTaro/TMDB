//
//  WatchListViewModel.swift
//  TMDB
//
//  Created by Taro on 2019/05/29.
//  Copyright © 2019 Taro. All rights reserved.
//

import Moya
import RxSwift
import RxCocoa

class WatchListViewModel {
    private let movieProvider = MoyaProvider<TMDBAPI>()
    
    private let observable = BehaviorRelay<[MovieData]>(value: [])
    public var watchMovie:BehaviorRelay<[MovieData]>{
        return self.observable
    }
    
    
    private let disposeBag = DisposeBag()
    
    init() {
        WatchedMovieModel.shared.watchedMovieList
            .filter{
                !$0.isEmpty
            }.map{
                $0.first!
            }
            .subscribe{ [weak self] movieID in
                guard let weakself = self else {
                    return
                }
                weakself.loadMovie(movieID: movieID.element!)
            }
            .disposed(by: self.disposeBag)
    }
    
    public func loadMovie(movieID: Int){
        self.movieProvider.request(.load(movieID: movieID)){ [weak self] result in
            guard let weakself = self else {
                return
            }
            switch result {
            case .success(let response):
                do{
                    let json = try JSONDecoder().decode(MovieData.self, from: response.data)
                    var copy = weakself.observable.value
                    copy.append(json)
                    weakself.observable.accept(copy)
                } catch {
                    weakself.observable.accept([])
                }
            case .failure(_):
                weakself.observable.accept([])
            }
        }
    }
}
