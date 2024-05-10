//
//  TopRatedMoviePresenter.swift
//  moviesViperTMDB
//
//  Created by Sergio Luis Noriega Pita on 4/05/24.
//

import Foundation
import SwiftUI
import Combine


class TopRatedMoviePresenter: ObservableObject {
    private let interactor: TopRatedMovieInteractor
    private let router = TopRatedMoviesRouter()
    private var cancellables = Set<AnyCancellable>()
    @Published var movieViewModel: [MovieViewModel] = []
    
    init(interactor: TopRatedMovieInteractor) {
        self.interactor = interactor
        interactor.$movieViewModel
            .assign(to: \.movieViewModel, on: self)
            .store(in: &self.cancellables)
    }
    
    func fetchApi() {
        interactor.fetchApi()
    }
}
