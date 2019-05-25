//
//  ExtendedCollectionView.swift
//  TMDB
//
//  Created by Taro on 2019/05/26.
//  Copyright © 2019 Taro. All rights reserved.
//

import UIKit

// CAUTION
// If we extend UICollectionView, keyboard doesn't work correctly.

class ExtendedCollectionView: UICollectionView {
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        superview?.touchesBegan(touches, with: event)
    }
    
}
