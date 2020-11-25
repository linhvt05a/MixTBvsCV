//
//  ProductDetailViewController.swift
//  MixTBvsCV
//
//  Created by admin on 11/24/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {
     var titles = ""
    lazy var listDetail : UITableView = {
        let list = UITableView()
        list.delegate = self
        list.dataSource = self
        return list
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "\(titles)"
    }
    
    func setData(_ txt: String){
        self.titles = txt
    }
}


extension ProductDetailViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}

extension ProductDetailViewController: UITableViewDelegate {
    
}
