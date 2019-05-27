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
    
    private let heartButton:UIButton = {
        let button = UIButton()
            button.backgroundColor = .clear
            button.setImage(UIImage(named: "notWatched"), for: .normal)
        return button
    }()
    
    private var isTapped:Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.posterImageView.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        self.contentView.addSubview(self.posterImageView)
        self.heartButton.frame = CGRect(x: self.frame.width * 0.75, y: 0, width: self.frame.width * 0.25, height: self.frame.height * 0.25)
        self.contentView.addSubview(self.heartButton)
        self.heartButton.addTarget(self, action: #selector(didTapeed), for: .touchUpInside)
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
    
    @objc func didTapeed(sender:UIButton){
        if self.isTapped {
            self.heartButton.setImage(UIImage(named: "watched"), for: .normal)
            self.isTapped = false
        }else {
            self.heartButton.setImage(UIImage(named: "notWatched"), for: .normal)
            self.isTapped = true
        }
        
    }
    
    override func prepareForReuse() { // Does anyone know the better idea about reusing cell?
        super.prepareForReuse()
        self.isTapped = false
        self.heartButton.setImage(UIImage(named: "notWatched"), for: .normal)
    }
}


