//
//  ThirstCVCell.swift
//  MixTBvsCV
//
//  Created by admin on 11/25/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class ThirstCVCell: UICollectionViewCell {

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
    }

}

