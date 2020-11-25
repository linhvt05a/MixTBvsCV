//
//  ListCVCell.swift
//  MixTBvsCV
//
//  Created by admin on 11/24/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class ListCVCell: UICollectionViewCell {

    lazy var title : UILabel = {
        let text = UILabel()
        text.numberOfLines = 0
        return text
    }()
    let imageview = UIImageView()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupTitle()
        setupImage()
        
    }
    func setData(_ data: ItemModel){
        self.title.text = data.title
        self.imageview.image = UIImage(named: data.image)
    }
    
    func setupTitle(){
        contentView.addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.topAnchor.constraint(equalTo: topAnchor).isActive = true
        title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
    }
    
    func setupImage (){
        contentView.addSubview(imageview)
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10).isActive = true
        imageview.leadingAnchor.constraint(equalTo:title.leadingAnchor).isActive = true
        imageview.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        imageview.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        imageview.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 3).isActive = true
    }
}
