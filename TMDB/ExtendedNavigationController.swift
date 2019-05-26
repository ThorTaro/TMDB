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
        self.navigationBar.isTranslucent = false
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.barTintColor = .black
        self.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.lightGray]
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
