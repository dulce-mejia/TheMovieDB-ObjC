//
//  MovieModel.swift
//  TheMovieDB-ObjC
//
//  Created by Dulce Gardenia Mejia Aguayo on 05/10/22.
//

import Foundation

@objcMembers public class MovieModel: NSObject {
    public let movieId: Int
    public let backdropPath: String
    public let voteCount: Double
    public let originalTitle:String
    public let posterPath: String
    public let title: String
    public let voteAverage: Double
    public let releaseDate: String
    public let overview: String
    
    public init(id: Int, backdropPath: String, voteCount: Double, originalTitle: String, posterPath: String, title: String, voteAverage: Double, releaseDate: String, overview: String) {
        self.movieId = id
        self.backdropPath = backdropPath
        self.voteCount = voteCount
        self.originalTitle = originalTitle
        self.posterPath = posterPath
        self.title = title
        self.voteAverage = voteAverage
        self.releaseDate = releaseDate
        self.overview = overview
    }
}
