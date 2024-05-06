//
//  TopRatedMovieInteractor.swift
//  moviesViperTMDB
//
//  Created by Sergio Luis Noriega Pita on 4/05/24.
//

import Foundation
import Combine

protocol TopRatedMovieInteractorProtocol {
    func fetchRatedMovies(completion: @escaping(Result<[Movie], Error>) -> Void)
}

class TopRatedMovieInteractor: ObservableObject,TopRatedMovieInteractorProtocol{
    let moviesApiService: MoviesApiService
    
    @Published var movies: [Movie] = []
    
    init(moviesApiService: MoviesApiService) {
        self.moviesApiService = moviesApiService
    }
    
    //    func fetchRatedMovies(completion: @escaping(Result<[Movie], Error>) -> Void) {
    //        moviesApiService.fetchMovies { result in
    //            completion(result)
    //
    //        }
    //    }
    
    func fetchRatedMovies(completion: @escaping(Result<[Movie], Error>) -> Void) {
        moviesApiService.fetchMovies { [weak self] result in
            switch result {
            case .success(let movies):
                self?.movies = movies
                completion(.success(movies))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
