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

class WatchedMovieCollectionViewCell: UICollectionViewCell {
    public let testIDLabel:UILabel = {
        let label = UILabel()
            label.backgroundColor = .clear
            label.textColor = .lightGray
            label.textAlignment = .center
            label.layer.borderWidth = 1
            label.layer.borderColor = UIColor.lightGray.cgColor
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.testIDLabel.frame = CGRect(x: 0,
                                        y: 0,
                                        width: self.bounds.width,
                                        height: self.bounds.height)
        self.contentView.addSubview(self.testIDLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var disposeBag = DisposeBag()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.disposeBag = DisposeBag()
    }
}
