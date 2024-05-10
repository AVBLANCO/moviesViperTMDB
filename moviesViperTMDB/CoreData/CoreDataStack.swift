//
//  CoreDataStack.swift
//  moviesViperTMDB
//
//  Created by Sergio Luis Noriega Pita on 6/05/24.
//

import Foundation
import Combine
import CoreData

protocol DataProvider {
    var moviesPublisher: Published<[MovieEntity]>.Publisher { get }
    func saveMovies(_ movies: [MovieViewModel])
}

class CoreDataStack {
    public var managedObjectContext: NSManagedObjectContext
    private var cancellables = Set<AnyCancellable>()
    @Published var moviesList: [MovieEntity] = []
    
    init(context: NSManagedObjectContext) {
        self.managedObjectContext = context
        publish()
    }
    
    private func allMovies() -> [MovieEntity] {
        do {
            let fetchRequest : NSFetchRequest<MovieEntity> = MovieEntity.fetchRequest()
            return try self.managedObjectContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("\(error), \(error.userInfo)")
            return []
        }
    }
    
    func saveMovies(_ movies: [MovieViewModel]) {
        let context = managedObjectContext
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd" 
        for movieViewModel in movies {
            let movieEntity = MovieEntity(context: context)
            movieEntity.id = Int32(movieViewModel.id)
            movieEntity.title = movieViewModel.title
            movieEntity.posterPath = movieViewModel.posterPath ?? ""
            movieEntity.overview = movieViewModel.overview
//            movieEntity.releaseDate = movieViewModel.releaseDate
            movieEntity.releaseDate = dateFormatter.string(from: movieViewModel.releaseDate ?? Date())
            movieEntity.voteAverage = movieViewModel.voteAverage
            movieEntity.adult = movieViewModel.adult
            movieEntity.backdropPath = movieViewModel.backdropPath ?? ""
            movieEntity.originalTitle = movieViewModel.originalTitle
        }
        do {
            try context.save()
        } catch let error as NSError {
            print("\(error), \(error.userInfo)")
        }
        publish()
    }

    
    private func publish() {
        moviesList = allMovies()
    }
}

extension  CoreDataStack: DataProvider {
    var moviesPublisher: Published<[MovieEntity]>.Publisher {
        $moviesList
    }
}
