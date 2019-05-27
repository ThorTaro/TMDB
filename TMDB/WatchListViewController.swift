//
//  secondViewController.swift
//  TMDB_etude
//
//  Created by Taro on 2019/05/17.
//  Copyright © 2019 Taro. All rights reserved.
//

import UIKit

class WatchListViewController: UIViewController {
    private let watchListCollectionView: ExtendedCollectionView = {
        let collectionView = ExtendedCollectionView(frame: CGRect.zero,
                                                    collectionViewLayout: UICollectionViewFlowLayout())
            collectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: "CellID")
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            collectionView.backgroundColor = .black
        return collectionView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
        self.configureNavBar()
    }
    
    private func configureView(){
        self.view.backgroundColor = .black
        self.view.addSubview(self.watchListCollectionView)
        self.watchListCollectionView.delegate = self
    }
    
    private func configureNavBar(){
        self.title = "Watch list"
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.configureViewsConstraints()
    }
    
    private func configureViewsConstraints(){
        self.watchListCollectionView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 12).isActive = true
        self.watchListCollectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.watchListCollectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        self.watchListCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
}

extension WatchListViewController:UICollectionViewDelegateFlowLayout {
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

extension WatchListViewController {
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
}
