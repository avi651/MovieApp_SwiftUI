//
//  PopularMovieViewModel.swift
//  MovieApp
//
//  Created by Avinash on 26/02/24.
//

import Foundation
import Combine

class PopularMovieViewModel: ObservableObject {
    @Published var data: MovieResult?
    private var cancellables = Set<AnyCancellable>()
    private let dataUseCase: MovieRepositoryUseCaseImpl
    
    init(dataUseCase: MovieRepositoryUseCaseImpl) {
        self.dataUseCase = dataUseCase
        fetchPopularMovieData()
    }
    
    func fetchPopularMovieData() {
        dataUseCase.fetchPopularMovieData(with: PopularMovieResquestModel(popularMovieName: "/popular"))
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                // Handle completion if needed
                switch completion {
                case .failure(let error): print("Error \(error)")
                case .finished: print("Publisher is finished")
              }
            }, receiveValue: { response in
                // self.data = data
                self.data = response
                
            })
            .store(in: &cancellables)
    }
}
