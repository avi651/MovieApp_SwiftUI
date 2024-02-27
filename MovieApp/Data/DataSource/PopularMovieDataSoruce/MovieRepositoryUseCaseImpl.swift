//
//  MovieRepositoryUseCaseImpl.swift
//  MovieApp
//
//  Created by Avinash on 27/02/24.
//

import Foundation
import Combine

struct PopularMovieUseCaseImpl: RepositoryUseCaseProtocol {
    
    private let dataSource: PopularMovieProtocol
    
    init(dataSource: PopularMovieProtocol) {
        self.dataSource = dataSource
    }
    
    func fetchPopularMovieData(with request: PopularMovieResquestModel) -> AnyPublisher<MovieResult, Error> {
        let baseURL = "\(APIConstant.baseURL)/popular"
        let queryItems = [URLQueryItem(name: "api_key", value: APIConstant.apiKey),
                          URLQueryItem(name: "language", value: APIConstant.languageLocale),
                          URLQueryItem(name: "page", value: "\(APIConstant.pageValue)")]
        var components = URLComponents(string: baseURL)
        components?.queryItems = queryItems
        let pathURL = components?.url // URL
        return dataSource.getPopularMovieData(from: pathURL!)
    }
}
