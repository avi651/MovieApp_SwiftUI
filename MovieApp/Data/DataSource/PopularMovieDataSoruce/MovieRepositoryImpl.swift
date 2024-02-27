//
//  MovieRepositoryImpl.swift
//  MovieApp
//
//  Created by Avinash on 27/02/24.
//

import Foundation
import Combine

class MovieRepositoryImpl: PopularMovieProtocol {
    
    func getPopularMovieData(from url: URL) -> AnyPublisher<MovieResult, Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            //.map(\.data)
            .tryMap { (output) -> Data in
                let statusCode = (output.response as! HTTPURLResponse).statusCode
                return output.data
            }
            .decode(type: MovieResult.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .mapError { error -> Error in
                switch error {
                case let serviceError:
                  return serviceError
                }
            }
            .eraseToAnyPublisher()
    }
}
