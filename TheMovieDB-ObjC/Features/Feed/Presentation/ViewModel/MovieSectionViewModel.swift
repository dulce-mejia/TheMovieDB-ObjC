//
//  MovieSectionViewModel.swift
//  TheMovieDB-ObjC
//
//  Created by Dulce Gardenia Mejia Aguayo on 06/10/22.
//

import Foundation

@objcMembers public final class MovieSectionViewModel: NSObject {
    public let title: String
    public init(title: String) {
        self.title = title
    }
}
