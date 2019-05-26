//
//  secondViewController.swift
//  TMDB_etude
//
//  Created by Taro on 2019/05/17.
//  Copyright © 2019 Taro. All rights reserved.
//

import UIKit

class WatchListViewController: UIViewController {
    private let myTableView:UITableView = {
        let tableView = UITableView()
            tableView.translatesAutoresizingMaskIntoConstraints = false
            tableView.backgroundColor = .black
            tableView.indicatorStyle = .white
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
        self.configureNavBar()
        
        self.myTableView.dataSource = self
    }
    
    private func configureView(){
        self.view.backgroundColor = .black
        self.view.addSubview(self.myTableView)
    }
    
    private func configureNavBar(){
        self.title = "Watch list"
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.myTableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.myTableView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.myTableView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        self.myTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
}


extension WatchListViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "TableViewCellID")
            cell.textLabel?.text = indexPath.row.description
            cell.backgroundColor = .clear
            cell.textLabel?.textColor = .lightGray
        return cell
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
