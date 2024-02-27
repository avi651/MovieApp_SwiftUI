//
//  DIContainer.swift
//  MovieApp
//
//  Created by Avinash on 26/02/24.
//

import Foundation

class DIContainer {
    static let shared = DIContainer()
    private init() {}

    private let repositoryPopularMovieProtocolObj: PopularMovieProtocol = MovieRepositoryImpl()
    
    lazy var repositoryUseCase: RepositoryUseCaseProtocol = {
        return PopularMovieUseCaseImpl(dataSource: repositoryPopularMovieProtocolObj)
    }()
}

