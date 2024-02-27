//
//  MovieRepositoryImpl.swift
//  MovieApp
//
//  Created by Avinash on 26/02/24.
//

import Foundation
import Combine

class MovieRepositoryImpl: RepositoryProtocol {
    func getPopularMovieData(from url: URL) -> AnyPublisher<MovieResult, Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { (output) -> Data in
                var request = URLRequest(url: url)
                request.httpMethod = "GET"
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                request.setValue("application/json", forHTTPHeaderField: "Accept")
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
