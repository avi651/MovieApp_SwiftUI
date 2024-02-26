//
//  MovieUseCase.swift
//  MovieApp
//
//  Created by Avinash on 26/02/24.
//

import Foundation
import Combine

protocol RepositoryPopularMovieUseCaseProtocol {
    func fetchPopularMovieData(with request: PopularMovieResquestModel) -> AnyPublisher<MovieResult, Error>
}

