//
//  MovieUseCase.swift
//  MovieApp
//
//  Created by Avinash on 26/02/24.
//

import Foundation
import Combine

protocol RepositoryUseCaseProtocol {
    //func fetchPopularMovieData(with request: PopularMovieResquestModel) -> AnyPublisher<MovieResult, Error>
    func fetchPopularMovieData(with request: PopularMovieResquestModel) -> AnyPublisher<MovieResult, Error>
}

