//
//  secondViewController.swift
//  TMDB_etude
//
//  Created by Taro on 2019/05/17.
//  Copyright © 2019 Taro. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {
    private let myTableView:UITableView = {
        let tableView = UITableView()
            tableView.translatesAutoresizingMaskIntoConstraints = false
            tableView.backgroundColor = .lightGray
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
        self.configureNavBar()
        
        self.myTableView.dataSource = self
    }
    
    private func configureView(){
        self.view.backgroundColor = .white
        self.view.addSubview(self.myTableView)
    }
    
    private func configureNavBar(){
        self.title = "Second"
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.myTableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.myTableView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.myTableView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        self.myTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
}


extension secondViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "TableViewCellID")
            cell.textLabel?.text = indexPath.row.description
        return cell
    }
    
    
}
