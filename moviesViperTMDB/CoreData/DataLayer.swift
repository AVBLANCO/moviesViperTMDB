//
//  DataLayer.swift
//  moviesViperTMDB
//
//  Created by Sergio Luis Noriega Pita on 6/05/24.
//

import Foundation
import Combine

class DataLayer {
    private let dataProvider: DataProvider
    private var cancellables = Set<AnyCancellable>()
    @Published var movieList: [MovieEntity] = []
    
    init(provider: DataProvider) {
        self.dataProvider = provider
        setup()
    }
    private func setup(){
        self.dataProvider.moviesPublisher
            .assign(to: \.movieList, on: self)
            .store(in: &cancellables ) // variable de Entrada y salida (limpoar cache)
        
    }
    
    func saveMoviesFromAPI(_ movies: [MovieViewModel]) {
        dataProvider.saveMovies(movies)
    }

}
