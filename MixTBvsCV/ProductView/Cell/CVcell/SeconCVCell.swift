//
//  SeconCVCell.swift
//  MixTBvsCV
//
//  Created by admin on 11/24/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class SeconCVCell: UICollectionViewCell {
    
    lazy var title: UILabel = {
        let txt = UILabel()
        txt.numberOfLines = 0
        txt.textColor = .white
        return txt
    }()
    
    lazy var image : UIImageView = {
        let images = UIImageView()
        images.width = 80
        images.height = 80
        images.layer.cornerRadius = 10
        images.clipsToBounds = true
        return images
    }()
    
    var imageSet: UIImage! {
        didSet {
            image.image = imageSet
        }
    }
    lazy var view : UIView = {
        let bg = UIView()
        bg.backgroundColor = #colorLiteral(red: 0.2372537851, green: 0.2372848392, blue: 0.2372359037, alpha: 1)
        bg.layer.cornerRadius = 10
        bg.clipsToBounds = true
        return bg
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.addSubview(view)
        view.addSubview(title)
        view.addSubview(image)
        setupTitle()
        
    }
    
    func setupTitle(){
        title.translatesAutoresizingMaskIntoConstraints = false
        title.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        title.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        image.top = view.bottom + 60
        image.left = view.left + 30
    }
    
    func setupData(_ data: ItemModel){
        self.title.text = data.title
        self.imageSet = UIImage(named: data.image)
    }
}
