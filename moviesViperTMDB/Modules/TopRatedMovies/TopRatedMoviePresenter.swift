//
//  TopRatedMoviePresenter.swift
//  moviesViperTMDB
//
//  Created by Sergio Luis Noriega Pita on 4/05/24.
//

import Foundation

class TopRatedMoviePresenter: ObservableObject {
    weak var view: TopRatedMovieViewProtocol?
    var interactor: TopRatedMovieInteractorProtocol?
    @Published var movies: [Movie] = []
    
    func fetchTopRatedMovies() {
        interactor?.fetchRatedMovies { result in
            switch result {
            case .success(let movies):
//                self.view?.showTopRatedMovies(movies)
                DispatchQueue.main.async {
                    self.movies = movies
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.view?.showError(error)
                }
            }
            
        }
    }
}
