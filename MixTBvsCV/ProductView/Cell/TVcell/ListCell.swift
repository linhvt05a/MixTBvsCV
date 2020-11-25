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
        listItem.isScrollEnabled = false
        listItem.showsVerticalScrollIndicator = false
        return listItem
    }()
    
    
    var estimateWidth = 200
    var cellMarginSize = 16.0
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configCV()
    }
    func setupGridView(){
        let flow = collectionList.collectionViewLayout as! UICollectionViewFlowLayout
        flow.minimumInteritemSpacing = CGFloat(self.cellMarginSize)
        flow.minimumLineSpacing = CGFloat(self.cellMarginSize)
        //          flow.sectionInset = UIEdgeInsets(top: contentView.top, left: contentView.left + 20, bottom: contentView.bottom, right: contentView.bottom - 22)
    }
    
    func configCV(){
        
        collectionList.register(UINib(nibName: String(describing:ListCVCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: ListCVCell.self))
        setupGridView()
    }
    func setupCV(_ data: [ItemModel]) -> CGFloat{
        self.itemModel = data
        contentView.addSubview(collectionList)
        collectionList.translatesAutoresizingMaskIntoConstraints = false
        collectionList.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        collectionList.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        collectionList.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        collectionList.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        return CGFloat(max(estimateWidth, estimateWidth, Int(Double(collectionList.bottom))))
    }
    
}

extension ListCell : UICollectionViewDelegate {
    
}

extension ListCell : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionList.dequeueReusableCell(withReuseIdentifier: "ListCVCell", for: indexPath) as! ListCVCell
        let data = itemModel[indexPath.row]
        let width = caculateWidth()
        cell.view.width = width
        cell.view.height = width/2
        cell.setData(data)
        return cell
    }
    
}

extension ListCell : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.caculateWidth()
        
        return CGSize(width: width, height: width)
    }
    
    func caculateWidth() -> CGFloat {
        let estimatedWidth = CGFloat(estimateWidth)
        let cellCount = floor(CGFloat(self.contentView.frame.size.width))/(estimatedWidth)
        let marginSize = CGFloat(cellMarginSize)
        let width = (self.contentView.frame.size.width - CGFloat(cellMarginSize)*(cellCount - 1) - marginSize)
        
        return width
    }
}
