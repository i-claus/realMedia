//
//  MovieCollectionCell.swift
//  RealMovies
//
//  Created by Claudio Vega on 2/22/19.
//  Copyright © 2019 Claudio Vega. All rights reserved.
//

import UIKit

class MovieCollectionCell: UICollectionViewCell {
    
    var posterImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.clipsToBounds = true
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        posterImageView.frame = CGRect(x: self.bounds.origin.x + 8, y: self.bounds.origin.y + 8, width: self.bounds.width - 8, height: self.bounds.height - 8)
        addSubview(posterImageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
