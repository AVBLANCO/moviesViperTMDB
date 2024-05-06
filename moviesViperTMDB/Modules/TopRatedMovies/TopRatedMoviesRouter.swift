//
//  TopRatedMoviesRouter.swift
//  moviesViperTMDB
//
//  Created by Sergio Luis Noriega Pita on 5/05/24.
//

import Foundation
import UIKit
import SwiftUI

protocol TopRatedMoviesRouterProtocol {
    // Define routing methods if needed
}

class TopRatedMoviesRouter: ObservableObject, TopRatedMoviesRouterProtocol {
    weak var viewController: UIViewController?
    
//    static func createModule() -> UIViewController {
//        let view = TopRatedMovieView()
//        let presenter = TopRatedMoviePresenter()
//        let interactor = TopRatedMovieInteractor(moviesApiService: MoviesApiService.shared)
//        let router = TopRatedMoviesRouter()
//        
//        view.presenter = presenter
//        presenter.view = view
//        presenter.interactor = interactor
//        presenter.router = router
//        interactor.presenter = presenter
//        router.viewController = view
//        
//        return view
//    }
    static func showListOfMovies() -> some View {
            let view = TopRatedMovieView()
            let presenter = TopRatedMoviePresenter()
            let interactor = TopRatedMovieInteractor(moviesApiService: MoviesApiService.shared)
            
            let router = TopRatedMoviesRouter()
            let contentView = view
                .environmentObject(presenter)
                .environmentObject(interactor)
                .onAppear {
                    presenter.fetchTopRatedMovies()
                }
            
            return contentView
        }
    
    func navigateToDetailMovieView(with movie: Movie) {
//           let detailView = DetailMoviesView(movie: movie)
//           viewController?.navigationController?.pushViewController(detailView, animated: true)
    }
}
