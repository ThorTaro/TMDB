//
//  myCollectionViewCell.swift
//  TMDB_etude
//
//  Created by Taro on 2019/05/23.
//  Copyright © 2019 Taro. All rights reserved.
//

import UIKit
import Nuke
import RxSwift
import RxCocoa

class SearchResultCollectionViewCell: UICollectionViewCell {
    private let posterImageView:UIImageView = {
        let imageView = UIImageView()
            imageView.layer.borderWidth = 1
            imageView.layer.borderColor = UIColor.darkGray.cgColor
        return imageView
    }()
    
    public let watchedButton:UIButton = {
        let button = UIButton()
            button.backgroundColor = .clear
            button.setImage(UIImage(named: "notWatched"), for: .normal)
        return button
    }()
    
    public var isWatched:Bool = false
    
    public var disposeBag = DisposeBag()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.posterImageView.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        self.contentView.addSubview(self.posterImageView)
        
        self.watchedButton.frame = CGRect(x: self.frame.width * 0.75, y: 0, width: self.frame.width * 0.25, height: self.frame.height * 0.25)
        self.contentView.addSubview(self.watchedButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setPosterImage(posterURL: String?){
        guard let posterURLPath = posterURL else {
            self.posterImageView.image = UIImage(named: "coffee")
            return
        }
        let imageURL = URL(string: "https://image.tmdb.org/t/p/w200" + posterURLPath)!
        let options = ImageLoadingOptions(placeholder: UIImage(named: "coffee"), failureImage: UIImage(named: "coffee"))
        Nuke.loadImage(with: imageURL, options: options, into: self.posterImageView)
    }
    
    public func didTapeed(){
        if self.isWatched {
            self.watchedButton.setImage(UIImage(named: "notWatched"), for: .normal)
            self.isWatched = false
        }else {
            self.watchedButton.setImage(UIImage(named: "watched"), for: .normal)
            self.isWatched = true
        }
        
    }
    
    override func prepareForReuse() { // Does anyone know the better idea about reusing cell?
        super.prepareForReuse()
        self.disposeBag = DisposeBag()
    }
}


