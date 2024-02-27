//
//  PopularMovieView.swift
//  MovieApp
//
//  Created by Avinash on 26/02/24.
//

import SwiftUI

struct PopularMovieView: View {
    
    @StateObject private var popularMovieView = PopularMovieViewModel(dataUseCase: DIContainer.shared.repositoryUseCase)
    
    var body: some View {
        NavigationView{
            VStack {
                if let data = popularMovieView.data {
                    List {
                        Section(header: Text("Popular Movies")){
                            ForEach(data.results) { movie in
                                NavigationLink(destination:PopularMovieDetails(movie: movie)){
                                    PopularMovieListCell(popularMovieText: movie.title,popularMovieImage: "https://image.tmdb.org/t/p/w500\(movie.posterPath)", rating: movie.voteAverage)
                                }
                            }
                        }
                    }.navigationTitle("Popular Movies").onAppear() {}
                } else {
                    VStack(spacing: 50) {
                        ForEach(1...5, id: \.self) { i in
                            SkletonComponents()
                        }
                    }.blinking(duration: 0.75)
                        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                }
            }
            .onAppear {
                popularMovieView.fetchPopularMovieData()
            }
            .onReceive(popularMovieView.$data, perform: { _ in
                // Handle data updates
            })
        }
    }
}

#Preview {
    PopularMovieView()
}
