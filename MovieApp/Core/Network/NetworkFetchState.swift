//
//  NetworkFetchState.swift
//  MovieApp
//
//  Created by Avinash on 26/02/24.
//

import Foundation

enum NetworkFetchState: Comparable {
    case good
    case isLoading
    case loadedAll
    case noResults
    case error(String)
}
