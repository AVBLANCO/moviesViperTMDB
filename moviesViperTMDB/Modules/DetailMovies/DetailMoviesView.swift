//
//  DetailMoviesView.swift
//  moviesViperTMDB
//
//  Created by Sergio Luis Noriega Pita on 5/05/24.
//

import SwiftUI

struct MovieDetailView: View {
    var movie: MovieViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text(movie.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                
                AsyncImage(url: movie.posterPath ?? "")
                    .aspectRatio(contentMode: .fit)
                
                Text(movie.overview)
                    .font(.body)
                    .multilineTextAlignment(.leading)
                HStack {
                    Text("Release Date: \(formattedDate(from: movie.releaseDate))")
                        .font(.body)
                    Spacer()
                    HStack {
                        Text("Rating: \(movie.voteAverage)")
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    }
                }
            }
            .padding()
        }
        .navigationTitle(movie.title)
    }
    
    private func formattedDate(from date: Date?) -> String {
        guard let date = date else {
            return "N/A"
        }
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }

    private func formattedDate(from string: String?) -> String {
        guard let dateString = string,
              let date = ISO8601DateFormatter().date(from: dateString) else {
            return "N/A"
        }
        return formattedDate(from: date)
    }
}
