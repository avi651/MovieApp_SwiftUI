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
    var popularMovieDetailText: String?
    var body: some View {
        HStack(spacing: 12){
            KingFisherNetworkImage(frame: 80, url: popularMovieImage ?? "")
            VStack(spacing: 10) {
                Text(popularMovieText ?? "")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.black)
                Text(popularMovieDetailText ?? "")
                    .font(.system(size: 16, weight: .light))
                    .foregroundColor(.black)
            }
        } .padding(.bottom, 40)
    }
}

#Preview {
    PopularMovieListCell()
}
