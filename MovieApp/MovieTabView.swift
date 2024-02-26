//
//  MovieTabView.swift
//  MovieApp
//
//  Created by Avinash on 26/02/24.
//

import SwiftUI

struct MovieTabView: View {
    var body: some View {
        TabView {
            PopularMovieView().tabItem {
                VStack {
                    Image(systemName: "tv")
                    Text("Popular")
                }
            }.tag(0)
            ArtistsView().tabItem {
                VStack {
                    Image(systemName: "figure.martial.arts")
                    Text("Artists")
                }
            }.tag(1)
            FavoritesView().tabItem {
                VStack {
                    Image(systemName: "star.fill")
                    Text("Favorite")
                }
            }.tag(2)
            SettingsView().tabItem {
                VStack {
                    Image(systemName: "gearshape.fill")
                    Text("Settings")
                }
            }.tag(3)
        }
    }
}

#Preview {
    MovieTabView()
}



