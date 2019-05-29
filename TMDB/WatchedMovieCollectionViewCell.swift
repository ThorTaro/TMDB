//
//  WatchedMovieCollectionViewCell.swift
//  TMDB
//
//  Created by Taro on 2019/05/27.
//  Copyright © 2019 Taro. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Nuke

class WatchedMovieCollectionViewCell: UICollectionViewCell {
    private let posterImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.darkGray.cgColor
        return imageView
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.posterImageView.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        self.contentView.addSubview(self.posterImageView)
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
}
