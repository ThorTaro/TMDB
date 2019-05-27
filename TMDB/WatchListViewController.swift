//
//  secondViewController.swift
//  TMDB_etude
//
//  Created by Taro on 2019/05/17.
//  Copyright © 2019 Taro. All rights reserved.
//

import UIKit

class WatchListViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
        self.configureNavBar()
        
        
    }
    
    private func configureView(){
        self.view.backgroundColor = .black
        
    }
    
    private func configureNavBar(){
        self.title = "Watch list"
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
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
