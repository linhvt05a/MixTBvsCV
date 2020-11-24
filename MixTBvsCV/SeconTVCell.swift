//
//  SeconTVCell.swift
//  MixTBvsCV
//
//  Created by admin on 11/24/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class SeconTVCell: UITableViewCell {
    let datas = [
        ItemModel(title: "AirPods", image: "8"),
        ItemModel(title: "HomePod ", image: ""),
        ItemModel(title: "Ipad ", image: ""),
        ItemModel(title: "MacBook ", image: ""),
        ItemModel(title: "Iphone ", image: ""),
        ItemModel(title: "Accessories ", image: ""),
        ItemModel(title: "Imac ", image: "")
    ]
    var estimateWidth = 172.0
    var cellMarginSize = 16.0
    lazy var seconCVlist:UICollectionView = {
        let list = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        list.delegate = self
        list.dataSource = self
        list.backgroundColor = .white
        list.showsVerticalScrollIndicator = false
        list.isScrollEnabled = false
        return list
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        seconCVlist.register(UINib(nibName: String(describing: SeconCVCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: SeconCVCell.self))
        setupGridView()
    }
    func setupGridView(){
        let flow = seconCVlist.collectionViewLayout as! UICollectionViewFlowLayout
        flow.minimumInteritemSpacing = CGFloat(self.cellMarginSize)
        flow.minimumLineSpacing = CGFloat(self.cellMarginSize)
        flow.sectionInset = UIEdgeInsets(top: contentView.top, left: contentView.left + 20, bottom: contentView.bottom, right: contentView.bottom - 22)
    }
    
    func setup() -> CGFloat{
        contentView.addSubview(seconCVlist)
        seconCVlist.translatesAutoresizingMaskIntoConstraints = false
        seconCVlist.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        seconCVlist.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        seconCVlist.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        seconCVlist.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        return 700
    }
}

extension SeconTVCell : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = seconCVlist.dequeueReusableCell(withReuseIdentifier: "SeconCVCell", for: indexPath) as! SeconCVCell
        let data = datas[indexPath.row]
        let width = caculateWidth()
        cell.view.width = width
        cell.view.height = width
        cell.setupData(data)
        return cell
    }
    
    
}

extension SeconTVCell : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.caculateWidth()
        
        return CGSize(width: width, height: width)
    }

    func caculateWidth() -> CGFloat {
        let estimatedWidth = CGFloat(estimateWidth)
        let cellCount = floor(CGFloat(self.contentView.frame.size.width))/(estimatedWidth)
        let marginSize = CGFloat(cellMarginSize)
        let width = (self.contentView.frame.size.width - CGFloat(cellMarginSize)*(cellCount - 1) - marginSize) / cellCount
        
        return width
    }
    
}
extension SeconTVCell : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        AppDelegate.window
        if let nv = UIApplication.shared.windows.first?.rootViewController as? UINavigationController {
            let vcc = ProductDetailViewController()
            nv.pushViewController( vcc, animated: true)
        }
            
    }
}
