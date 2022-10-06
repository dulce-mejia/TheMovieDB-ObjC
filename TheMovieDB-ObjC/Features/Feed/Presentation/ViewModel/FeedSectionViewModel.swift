//
//  FeedSectionViewModel.swift
//  TheMovieDB-ObjC
//
//  Created by Dulce Gardenia Mejia Aguayo on 05/10/22.
//

import Foundation

@objcMembers public class FeedSectionViewModel: NSObject {
    public let section: Int
    public let name: String
    public let movies: [MovieViewModel]
    
    public init(section: Int, movies: [MovieViewModel]) {
        self.section = section
        self.movies = movies
        self.name = {
            switch section {
            case 0:
                return "Now Playing"
            case 1:
                return "Trending"
            case 2:
                return "Popular"
            case 3:
                return "Top Rated"
            case 4:
                return "Upcoming"
            default:
                return ""
            }
        }()
    }
}
