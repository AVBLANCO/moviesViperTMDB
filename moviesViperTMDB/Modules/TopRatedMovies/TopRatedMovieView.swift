//
//  TopRatedMovieView.swift
//  moviesViperTMDB
//
//  Created by Sergio Luis Noriega Pita on 4/05/24.
//

import SwiftUI
import UIKit

protocol TopRatedMovieViewProtocol: AnyObject {
    func showTopRatedMovies(_ movies: [Movie])
    func showError(_ error: Error)
}


struct TopRatedMovieView: View {
    @StateObject var presenter = TopRatedMoviePresenter()
    @StateObject var router = TopRatedMoviesRouter()
    
    var body: some View {
          VStack {
              Text("Top Rated Movies")
//                  .font(.title)
                  .font(Font.custom("Swift-04-Regular", size: 20))
//                  .font(UIFont(name: "Swift-04-Regular", size: 20))
                  .padding()
              
//              MovieTableView(movies: presenter.movies)
              MovieTableView(movies: presenter.movies, didSelectMovie: { movie in
                  router.navigateToDetailMovieView(with: movie)
                  
              })
          }
          .onAppear {
              presenter.fetchTopRatedMovies()
          }
      }
  }

struct MovieTableView: UIViewRepresentable {
    let movies: [Movie]
    let didSelectMovie: (Movie) -> Void
    
    func makeUIView(context: Context) -> UITableView {
        let tableView = UITableView()
        tableView.dataSource = context.coordinator
        tableView.register(MovieCell.self, forCellReuseIdentifier: "MovieCell")
        return tableView
    }
    
    func updateUIView(_ uiView: UITableView, context: Context) {
        uiView.reloadData()
    }
    
    // instancia del coordinator para manejo de datos en la taba
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    // Design Pattern: coordinator
    class Coordinator: NSObject, UITableViewDataSource, UITableViewDelegate { // Delegate para manejo de la tabla
        let parent: MovieTableView
        
        init(_ parent: MovieTableView) {
            self.parent = parent
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return parent.movies.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
            let movie = parent.movies[indexPath.row]
            cell.configure(with: movie)
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let movie = parent.movies[indexPath.row]
            parent.didSelectMovie(movie)
        }
    }
}

