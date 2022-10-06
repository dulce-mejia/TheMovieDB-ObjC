//
//  FeedSectionViewModel.swift
//  TheMovieDB-ObjC
//
//  Created by Dulce Gardenia Mejia Aguayo on 05/10/22.
//

import Foundation

@objcMembers public class FeedSectionViewModel {
    public let section:String
    public let movies: [MovieViewModel]
    
    public init(section: String, movies: [MovieViewModel]) {
        self.section = section
        self.movies = movies
    }
}
