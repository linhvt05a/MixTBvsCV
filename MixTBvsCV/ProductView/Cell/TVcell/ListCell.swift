//
//  ListCell.swift
//  MixTBvsCV
//
//  Created by admin on 11/24/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class ListCell: UITableViewCell {
    
    var itemModel = [ItemModel]()
    lazy var collectionList: UICollectionView = {
       let listItem = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        listItem.delegate = self
        listItem.dataSource = self
        listItem.backgroundColor = .black
        return listItem
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configCV()
    }
    
    func configCV(){
        
        collectionList.register(UINib(nibName: String(describing:ListCVCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: ListCVCell.self))
        
    }
    func setupCV(_ data: [ItemModel]) -> CGFloat{
        self.itemModel = data
        contentView.addSubview(collectionList)
        collectionList.translatesAutoresizingMaskIntoConstraints = false
        collectionList.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        collectionList.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        collectionList.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        collectionList.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        return 300
    }
    
}

extension ListCell : UICollectionViewDelegate {
    
}

extension ListCell : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionList.dequeueReusableCell(withReuseIdentifier: "ListCVCell", for: indexPath) as! ListCVCell
        let data = itemModel[indexPath.row]
         cell.setData(data)
        return cell
    }
    
}

extension ListCell : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.size.width, height: collectionView.bounds.size.height)
    }
}
