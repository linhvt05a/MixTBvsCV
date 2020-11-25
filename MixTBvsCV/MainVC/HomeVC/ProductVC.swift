//
//  ViewController.swift
//  MixTBvsCV
//
//  Created by admin on 11/24/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class ProductVC: UIViewController {
    
    lazy var listItem : UITableView = {
        let tableview = UITableView()
        tableview.backgroundColor = .black
        return tableview
    }()
    fileprivate var rowHeight = 0 as CGFloat
    let data = [
        ItemModel(title: "After Weeks of Delay, Process Starts for a New White House Team https://www.nytimes.com/2020/11/23/climate/general-motors-trump.html?action=click&module=Spotlight&pgtype=Homepage", image: "1"),
        ItemModel(title: "After Weeks of Delay, Process Starts for a New White House Team https://www.nytimes.com/2020/11/23/climate/general-motors-trump.html?action=click&module=Spotlight&pgtype=Homepage", image: "1"),
        ItemModel(title: "After Weeks of Delay, Process Starts for a New White House Team https://www.nytimes.com/2020/11/23/climate/general-motors-trump.html?action=click&module=Spotlight&pgtype=Homepage", image: "1"),
               
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(listItem)
        setupTable()
        registerCell()
        listItem.dataSource = self
        listItem.delegate = self
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
        listItem.register(UINib(nibName: String(describing: SeconTVCell.self), bundle: nil), forCellReuseIdentifier: String(describing: SeconTVCell.self))
        listItem.register(UINib(nibName: String(describing: ThirstTVCell.self), bundle: nil), forCellReuseIdentifier: String(describing: ThirstTVCell.self))
    }
}



extension ProductVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = listItem.dequeueReusableCell(withIdentifier: String(describing: ListCell.self), for: indexPath) as! ListCell
            rowHeight = cell.setupCV(data)
            return cell
        }
        
        if indexPath.row == 1 {
            let cell = listItem.dequeueReusableCell(withIdentifier: String(describing: SeconTVCell.self), for: indexPath) as! SeconTVCell
            rowHeight = cell.setup()
            return cell
        }
        else {
            let cell = listItem.dequeueReusableCell(withIdentifier: String(describing: ThirstTVCell.self), for: indexPath) as! ThirstTVCell
            let datas = data[indexPath.row]
            rowHeight = cell.setupCV(datas)
            return cell
        }
    }
}

extension ProductVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowHeight
    }
}
