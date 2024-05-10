//
//  MovieEntity+CoreDataProperties.swift
//  moviesViperTMDB
//
//  Created by Sergio Luis Noriega Pita on 6/05/24.
//
//

import Foundation
import CoreData


extension MovieEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MovieEntity> {
        return NSFetchRequest<MovieEntity>(entityName: "MovieEntity")
    }

    @NSManaged public var adult: Bool
    @NSManaged public var backdropPath: String
    @NSManaged public var id: Int32
    @NSManaged public var originalTitle: String
    @NSManaged public var overview: String
    @NSManaged public var posterPath: String
    @NSManaged public var releaseDate: String
//    @NSManaged public var releaseDate: Date
    @NSManaged public var title: String
    @NSManaged public var voteAverage: Double

}

extension MovieEntity : Identifiable {

}
