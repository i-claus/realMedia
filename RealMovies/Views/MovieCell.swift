//
//  MovieCell.swift
//  RealMovies
//
//  Created by Claudio Vega on 2/22/19.
//  Copyright © 2019 Claudio Vega. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var overViewLabel: UILabel!
    @IBOutlet var posterImageView: UIImageView!
    @IBOutlet var releaseYearLabel: UILabel!
    @IBOutlet var averageVoteLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor(red: 1, green: 0.8431, blue: 0, alpha: 1.0)
        selectedBackgroundView = backgroundView
    }
}
