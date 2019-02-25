//
//  TheMovieDbApi.swift
//  RealMovies
//
//  Created by Claudio Vega on 2/22/19.
//  Copyright © 2019 Claudio Vega. All rights reserved.
//

import Foundation

enum MovieErrors: Error {
    case networkFail(description: String)
    case jsonSerializationFail
    case dataNotReceived
    case castFail
    case internalError
    case unknown
}

extension MovieErrors: LocalizedError {
    public var errorDescription: String? {
        let defaultMessage = "Unknown error!"
        let internalErrorMessage = "Something's wrong!"
        switch self {
        case .networkFail(let localizedDescription):
            print(localizedDescription)
            return localizedDescription
        case .jsonSerializationFail:
            return internalErrorMessage
        case .dataNotReceived:
            return internalErrorMessage
        case .castFail:
            return internalErrorMessage
        case .internalError:
            return internalErrorMessage
        case .unknown:
            return defaultMessage
        }
    }
}


@objc protocol MoviesDelegate: NSObjectProtocol {
    func theMovieDB(didFinishUpdatingMovies movies: [Movie])
    @objc optional func theMovieDB(didFailWithError error: Error)
}

class APIMovies: NSObject {
    static let apiKey: String = "34738023d27013e6d1b995443764da44"
    static let imageBaseStr: String = "https://image.tmdb.org/t/p/"
    
    var delegate: MoviesDelegate?
    var endpoint: String
    
    init(endpoint: String) {
        self.endpoint = endpoint
    }
    
    func startUpdatingMovies() {
        var urlRequest = URLRequest(url: URL(string: "https://api.themoviedb.org/3/movie/\(endpoint)?api_key=\(APIMovies.apiKey)")!)
        urlRequest.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        let session = URLSession(
            configuration: URLSessionConfiguration.default,
            delegate: nil,
            delegateQueue: OperationQueue.main
        )
        
        let task : URLSessionDataTask = session.dataTask(with: urlRequest, completionHandler:
        { (data, response, error) in
            
            
            guard error == nil else {
                self.delegate?.theMovieDB?(didFailWithError: MovieErrors.networkFail(description: error!.localizedDescription))
                print("API Error: \(error!.localizedDescription)")
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                self.delegate?.theMovieDB?(didFailWithError: MovieErrors.unknown)
                print("API Error: Unknown error. Could not get response!")
                return
            }
            
            guard response.statusCode == 200 else {
                self.delegate?.theMovieDB?(didFailWithError: MovieErrors.internalError)
                print("API Error: Response code was either 401 or 404.")
                return
            }
            
            guard let data = data else {
                self.delegate?.theMovieDB?(didFailWithError: MovieErrors.dataNotReceived)
                print("API Error: Could not get data!")
                return
            }
            
            do {
                let movies = try self.movieObjects(with: data)
                self.delegate?.theMovieDB(didFinishUpdatingMovies: movies)
            } catch (let error) {
                self.delegate?.theMovieDB?(didFailWithError: error)
                print("API Error: Some problem occurred during JSON serialization.")
                return
            }
            
        });
        task.resume()
    }
    
    func movieObjects(with data: Data) throws -> [Movie] {
        do {
            
            guard let responseDictionary = try JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary else {
                throw MovieErrors.castFail
            }
            
            guard let movieDictionaries = responseDictionary["results"] as? [NSDictionary] else {
                print("API Error: Movie dictionary not found.")
                throw MovieErrors.unknown
            }
            
            return Movie.movies(with: movieDictionaries)
            
        } catch (let error) {
            print("API Error: \(error.localizedDescription)")
            throw error
        }
    }
}
