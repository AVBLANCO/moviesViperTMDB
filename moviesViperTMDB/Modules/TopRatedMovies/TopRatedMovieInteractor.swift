//
//  TopRatedMovieInteractor.swift
//  moviesViperTMDB
//
//  Created by Sergio Luis Noriega Pita on 4/05/24.
//

import Foundation
import Combine


class TopRatedMovieInteractor {
    private let model: DataLayer
    private var cancellables = Set<AnyCancellable>()
    @Published var movieViewModel: [MovieViewModel] = []
    
    init(model: DataLayer) {
        self.model = model
        setup()
    }
    
    private func setup(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        self.model.$movieList
            .map({ movies -> [MovieViewModel] in
                return movies.map {
                    let releaseDate = dateFormatter.date(from: $0.releaseDate)
                    
                    return MovieViewModel(id: Int($0.id),
                                   title: $0.title,
                                   posterPath: $0.posterPath,
                                   overview: $0.overview,
//                                   releaseDate: $0.releaseDate,
                                   releaseDate: releaseDate,
                                   voteAverage: $0.voteAverage,
                                   adult: $0.adult,
                                   backdropPath: $0.backdropPath,
                                   originalTitle: $0.originalTitle)
                }
                
            })
            .replaceError(with: [])
            .assign(to: \.movieViewModel, on: self)
            .store(in: &cancellables)
    }
    
    func fetchApi() {
        MoviesApiService.shared.fetchMovies { result in
            switch result {
            case .success(let movieResponse):
                debugPrint("Response \(movieResponse) ")
                self.model.saveMoviesFromAPI(movieResponse.results)
            case .failure(let error):
                debugPrint("Error")
            }
        }
    }
//    
//    func saveMoviesFromAPI(_ movies: [MovieViewModel]) {
//        dataProvider.saveMovies(movies)
//    }
    
}
