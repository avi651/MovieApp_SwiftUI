//
//  NetworkRepository.swift
//  MovieApp
//
//  Created by Avinash on 26/02/24.
//

import Foundation
import Combine

protocol PopularMovieProtocol {
    func getPopularMovieData(from url: URL) -> AnyPublisher<MovieResult, Error>
}

