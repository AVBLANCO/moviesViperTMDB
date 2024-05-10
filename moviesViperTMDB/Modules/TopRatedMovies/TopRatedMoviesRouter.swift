//
//  TopRatedMoviesRouter.swift
//  moviesViperTMDB
//
//  Created by Sergio Luis Noriega Pita on 5/05/24.
//

import Foundation
import SwiftUI
import CoreData

struct TopRatedMoviesRouter{
    func listMovies(context: NSManagedObjectContext) -> some View {
        
        let persistence = CoreDataStack(context: context)
        let dataLayer = DataLayer(provider: persistence)
        let contentView = TopRatedMovieView(presenter: TopRatedMoviePresenter(interactor: TopRatedMovieInteractor(model: dataLayer)))
        
        return contentView
    }
}
