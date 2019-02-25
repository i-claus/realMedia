//
//  MoviesCollectionViewDataSource.swift
//  RealMovies
//
//  Created by Claudio Vega on 2/22/19.
//  Copyright © 2019 Claudio Vega. All rights reserved.
//

import UIKit

class MoviesCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    var movies = [Movie]()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCollectionCell", for: indexPath) as! MovieCollectionCell
        if let posterImageURL = movies[indexPath.row].posterImageURLMedium {
            cell.posterImageView.setImageWith(posterImageURL, placeholderImage: #imageLiteral(resourceName: "placeholderImage"))
        } else {
            cell.posterImageView.image = #imageLiteral(resourceName: "placeholderImage")
        }
        return cell
    }
}
