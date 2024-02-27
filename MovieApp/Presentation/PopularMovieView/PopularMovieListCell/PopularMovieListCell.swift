//
//  PopularMovieListCell.swift
//  MovieApp
//
//  Created by Avinash on 26/02/24.
//

import SwiftUI

struct PopularMovieListCell: View {
    
    var popularMovieText: String?
    var popularMovieImage: String?
    var rating: CGFloat?
    
    var body: some View {
        HStack(spacing: 12){
            KingFisherNetworkImage(frame: 100, url: popularMovieImage ?? "")
            VStack(alignment: .leading, spacing: 12) {
                Text(popularMovieText ?? "")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.black)
                RatingView(rating: rating ?? 0.0, maxRating: 10)
            }
        }
    }
}

#Preview {
    PopularMovieListCell()
}
