//
//  ViewController.swift
//  MixTBvsCV
//
//  Created by admin on 11/24/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var listItem : UITableView = {
        let tableview = UITableView()
        return tableview
    }()
    let data = [
        ItemModel(title: "After Weeks of Delay, Process Starts for a New White House Team https://www.nytimes.com/2020/11/23/climate/general-motors-trump.html?action=click&module=Spotlight&pgtype=Homepage", image: "1"),
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(listItem)
        setupTable()
         registerCell()
      
        view.backgroundColor = .white
        listItem.delegate = self
        listItem.dataSource = self
    }
    
    
    func setupTable(){
       
        listItem.translatesAutoresizingMaskIntoConstraints = false
        listItem.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        listItem.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        listItem.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        listItem.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func registerCell(){
        listItem.register(UINib(nibName: String(describing: ListCell.self), bundle: nil), forCellReuseIdentifier: String(describing: ListCell.self))
    }
}



extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = listItem.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath)as! ListCell
        tableView.rowHeight = cell.setupCV(data)
        return cell
    }
    
    
}

extension ViewController : UITableViewDelegate {
  
}
