//
//  ViewController.swift
//  TMDB_etude
//
//  Created by Taro on 2019/05/17.
//  Copyright © 2019 Taro. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SearchViewController: UIViewController {
    private let searchBar:UISearchBar = {
        let sb = UISearchBar(frame: CGRect.zero)
            sb.translatesAutoresizingMaskIntoConstraints = false
            sb.backgroundColor = .black
            sb.tintColor = .white
            sb.backgroundImage = UIImage()
            sb.placeholder = "Title"
        let textField = sb.value(forKey: "searchField") as! UITextField
            textField.backgroundColor = .darkGray
            textField.textColor = .white
        return sb
    }()
    
    private let movieCollectionView:ExtendedCollectionView = {
        let collectionView = ExtendedCollectionView(frame: CGRect.zero,
                                                    collectionViewLayout: UICollectionViewFlowLayout())
            collectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: "CellID")
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            collectionView.backgroundColor = .black
        return collectionView
    }()
    
    private let viewModel = SearchMovieViewModel()
    private let disposeBag = DisposeBag()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setViews()
        
        self.viewModel.searchResultMovies
            .asDriver()
            .drive( movieCollectionView.rx.items(cellIdentifier: "CellID", cellType: MovieCollectionViewCell.self)){
                (_, element, cell) in
                cell.setPosterImage(posterURL: element.poster_path)
                cell.watchedButton.rx.tap.asDriver().drive(onNext: { _ in
                    cell.didTapeed()
                }).disposed(by: cell.disposeBag)
            }
            .disposed(by: self.disposeBag)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.configureNavBar()
        self.configureViewsConstraints()
        
    }
    
    private func setViews(){
        self.view.backgroundColor = .black
        self.view.addSubview(self.movieCollectionView)
        self.movieCollectionView.delegate = self // Caution: UICollectionViewDelegate includes UICollectionViewDelegateFlowLayout
    }
    
    private func configureNavBar(){
        self.searchBar.delegate = self
        if #available(iOS 11.0, *){
            self.searchBar.heightAnchor.constraint(equalToConstant: 44).isActive = true // "44" is the default navigation bar height
            self.navigationItem.titleView = self.searchBar
        }else{
            print("Error: This project is not supported under iOS 11.0") // See you later :)
        }
    }
    
    private func configureViewsConstraints(){
        self.movieCollectionView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 12).isActive = true
        self.movieCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.movieCollectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.movieCollectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
    }
    
}

extension SearchViewController: UISearchBarDelegate{
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        self.searchBar.showsCancelButton = true
        return true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.showsCancelButton = false
        self.searchBar.text = ""
        self.searchBar.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // DISCUSSION: I think that I can replace here with RxSwift, but I don't know how to do it.
        guard let searchText = self.searchBar.text else {
            return
        }
        self.viewModel.searchMovie(word: searchText)
        self.searchBar.showsCancelButton = false
        self.searchBar.resignFirstResponder()
    }
}

extension SearchViewController:UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let sideMargin:CGFloat = 12 * 2
        let numberOfItemsAtRow:CGFloat = 3
        let interMargin:CGFloat = 4 * numberOfItemsAtRow
        let itemWidth:CGFloat = (self.view.bounds.width - sideMargin - interMargin)/numberOfItemsAtRow
        let itemHeight:CGFloat = (itemWidth/27) * 40 // Most famous poster aspect is 27 x 40.
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 12)
    }
}


extension SearchViewController {
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.searchBar.showsCancelButton = false
        self.searchBar.resignFirstResponder()
    }
}
