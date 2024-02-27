//
//  MovieRepositoryUseCaseImpl.swift
//  MovieApp
//
//  Created by Avinash on 26/02/24.
//

import Foundation
import Combine

struct MovieRepositoryUseCaseImpl: RepositoryPopularMovieUseCaseProtocol {
    
    private let dataSource: RepositoryProtocol
    
    init(dataSource: RepositoryProtocol) {
        self.dataSource = dataSource
    }
    
    //internal func fetchPopularMovieData(with request: PopularMovieResquestModel) -> AnyPublisher<MovieResult, Error> {
    internal func fetchPopularMovieData() -> AnyPublisher<MovieResult, Error> {
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
