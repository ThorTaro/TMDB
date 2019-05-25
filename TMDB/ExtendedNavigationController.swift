//
//  navigationController.swift
//  TMDB_etude
//
//  Created by Taro on 2019/05/24.
//  Copyright © 2019 Taro. All rights reserved.
//

import UIKit

class ExtendedNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ExtendedNavigationController {
    override var childForStatusBarStyle: UIViewController? {
        return self.visibleViewController
    }
    
    override var childForStatusBarHidden: UIViewController? {
        return self.visibleViewController
    }
}
