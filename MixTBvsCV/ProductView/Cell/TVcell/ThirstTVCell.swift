//
//  ThirstTVCell.swift
//  MixTBvsCV
//
//  Created by admin on 11/25/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class ThirstTVCell: UITableViewCell {

    lazy var thirstlist:UICollectionView = {
        let list = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        list.delegate = self
        list.dataSource = self
        list.backgroundColor = .black
        list.showsVerticalScrollIndicator = false
        list.isScrollEnabled = false
        return list
    }()
    var estimateWidth = 172.0
    var cellMarginSize = 16.0
    override func awakeFromNib() {
        super.awakeFromNib()
       
        // Initialization code
      thirstlist.register(UINib(nibName: String(describing: ThirstCVCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: ThirstCVCell.self))
         setupGridView()
         contentView.addSubview(thirstlist)
    }
    
    func setupGridView(){
         let flow = thirstlist.collectionViewLayout as! UICollectionViewFlowLayout
         flow.minimumInteritemSpacing = CGFloat(self.cellMarginSize)
         flow.minimumLineSpacing = CGFloat(self.cellMarginSize)
         //          flow.sectionInset = UIEdgeInsets(top: contentView.top, left: contentView.left + 20, bottom: contentView.bottom, right: contentView.bottom - 22)
     }
    
    func setupCV(_ data: ItemModel) -> CGFloat{
        
        thirstlist.translatesAutoresizingMaskIntoConstraints = false
        thirstlist.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        thirstlist.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        thirstlist.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        thirstlist.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        return CGFloat(max(Double(thirstlist.bottom), estimateWidth,cellMarginSize))
    }
}


extension ThirstTVCell : UICollectionViewDelegate {
    
}

extension ThirstTVCell : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = thirstlist.dequeueReusableCell(withReuseIdentifier: "ThirstCVCell", for: indexPath) as! ThirstCVCell
        let width = caculateWidth()
        cell.view.width = width
        cell.view.height = width/2
        return cell
    }
}

extension ThirstTVCell : UICollectionViewDelegateFlowLayout {
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
