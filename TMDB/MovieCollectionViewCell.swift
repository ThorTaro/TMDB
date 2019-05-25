//
//  myCollectionViewCell.swift
//  TMDB_etude
//
//  Created by Taro on 2019/05/23.
//  Copyright © 2019 Taro. All rights reserved.
//

import UIKit
import Nuke

class MovieCollectionViewCell: UICollectionViewCell {
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
        let posterURLPath = posterURL ?? "NoUrl"
        let urlToUse = URL(string: "https://image.tmdb.org/t/p/w200" + posterURLPath)!
        let options = ImageLoadingOptions(placeholder: UIImage(named: "coffee"), failureImage: UIImage(named: "coffee"))
        Nuke.loadImage(with: urlToUse, options: options, into: self.posterImageView)
    }
}
