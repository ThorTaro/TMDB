//
//  MovieViewModel.swift
//  TMDB_etude
//
//  Created by Taro on 2019/05/21.
//  Copyright © 2019 Taro. All rights reserved.
//

import Moya
import RxSwift
import RxCocoa

class SearchMovieViewModel {
    private let movieProvider = MoyaProvider<TMDBAPI>()

    public let searchResultMovies = BehaviorRelay<[MovieDataJSON]>(value: [])
    
    
    public func searchMovie(word: String){
        self.movieProvider.request(.search(word: word)){ [weak self] result in
            guard let weakSelf = self else { return }
            switch result {
            case .success(let response):
                do{
                    let json = try JSONDecoder().decode(SearchResultJSON.self, from: response.data).results
                    weakSelf.searchResultMovies.accept(json)
                } catch {
                    weakSelf.searchResultMovies.accept([]) // I DON'T KNOW WHTA SHOULD I DO
                }
            case .failure(_):
                weakSelf.searchResultMovies.accept([]) // I DON'T KNOW WHTA SHOULD I DO
            }
        }
    }
}
