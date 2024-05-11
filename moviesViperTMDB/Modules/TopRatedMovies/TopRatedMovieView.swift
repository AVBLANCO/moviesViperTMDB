//
//  TopRatedMovieView.swift
//  moviesViperTMDB
//
//  Created by Sergio Luis Noriega Pita on 4/05/24.
//

import SwiftUI
import UIKit

struct TopRatedMovieView: View {
    @ObservedObject var presenter: TopRatedMoviePresenter
    
    var body: some View {
        NavigationView {
            List {
                ForEach(presenter.movieViewModel, id: \.id) { movie in
                    NavigationLink(destination: MovieDetailView(movie: movie)) {
                        MovieRow(movie: movie)
                    }
                }
            }
            .navigationTitle("Top Rated Movies")
            font(Font.custom("Salium", size: 20))
        }
        .onAppear {
            presenter.fetchApi()
        }
    }
}

struct MovieRow: View {
    @StateObject private var imageLoader = ImageLoader()
    var movie: MovieViewModel
    
    var body: some View {
        Group {
            if let error = imageLoader.error {
                Text("Error loading image: \(error.localizedDescription)")
            } else {
                if let image = imageLoader.image {
                    HStack {
                        Image(uiImage: image)
                            .resizable()
                            .frame(width: 100, height: 150)
                        
                        // Título y fecha de lanzamiento
                        VStack(alignment: .leading) {
                            Text(movie.title)
                                .font(.headline)
                            if let releaseDate = movie.releaseDate {
                                Text("Release Date: \(formattedDate(from: releaseDate))")
                                    .font(.subheadline)
                            }
                        }
                        .padding(.leading, 8)
                    }
                } else {
                    Image(systemName: "photo")
                        .resizable()
                        .frame(width: 100, height: 150)
                }
            }
        }
        .padding(.vertical, 8)
        .onAppear {
            if let backdropPath = movie.backdropPath,
               let url = URL(string: "https://image.tmdb.org/t/p/w200\(backdropPath)") {
                imageLoader.loadImage(from: url)
            }
        }
    }
    
    private func formattedDate(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}




struct AsyncImage: View {
    @ObservedObject private var imageLoader: ImageLoader
    var url: String
    
    init(url: String) {
        self.url = url
        _imageLoader = ObservedObject(wrappedValue: ImageLoader())
        if let imageUrl = URL(string: url) {
            imageLoader.loadImage(from: imageUrl)
        }
    }
    
    var body: some View {
        if let image = imageLoader.image {
            Image(uiImage: image)
                .resizable()
        } else {
            Image(systemName: "photo")
                .resizable()
        }
    }
}

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    @Published var error: Error?
    
    func loadImage(from url: URL) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    self.error = error
                }
                return
            }
            guard let data = data else {
                DispatchQueue.main.async {
                    self.error = NSError(domain: "com.example.ImageLoader", code: -1, 
                                         userInfo: [NSLocalizedDescriptionKey: "No data received"])

                }
                return
            }
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        }.resume()
    }
}
