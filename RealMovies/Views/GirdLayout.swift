//
//  GirdViewLayout.swift
//  RealMovies
//
//  Created by Claudio Vega on 2/22/19.
//  Copyright © 2019 Claudio Vega. All rights reserved.
//

import UIKit

class GridLayout: UICollectionViewFlowLayout {
    
    override init() {
        super.init()
        minimumLineSpacing = 1
        minimumInteritemSpacing = 1
        scrollDirection = .vertical
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var itemSize: CGSize {
        get {
            
            guard let collectionView = collectionView else {
                
                return CGSize(width: 100, height: 180)
            }
            
            let itemWidth: CGFloat = (collectionView.bounds.width/CGFloat(2)) - self.minimumLineSpacing
            
            let itemHeight = itemWidth*1.5
            
            return CGSize(width: itemWidth, height: itemHeight)
            
        }
        
        set {
            super.itemSize = newValue
        }
    }
    
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
        return proposedContentOffset
    }

    
}
