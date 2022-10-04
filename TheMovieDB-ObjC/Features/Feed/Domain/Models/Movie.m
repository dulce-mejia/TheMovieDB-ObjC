//
//  Movie.m
//  TheMovieDB-ObjC
//
//  Created by Dulce Gardenia Mejia Aguayo on 29/09/22.
//

#import "Movie.h"

@implementation Movie
-(instancetype) initMovieWithId:(NSInteger)movieId backdropPath:(NSString* _Nullable)backdropPath voteCount: (NSInteger)voteCount origTitle:(NSString*)origTitle posterPath: (NSString* _Nullable)posterPath title:(NSString*)title voteAvg: (double)voteAvg releaseDate:(NSString* _Nullable)releaseDate overview:(NSString* _Nullable) overview {
    
    if (self = [super init]) {
        self.movieId = movieId;
        self.backdropPath = backdropPath;
        self.voteCount = voteCount;
        self.originalTitle = origTitle;
        self.posterPath = posterPath;
        self.title = title;
        self.voteAverage = voteAvg;
        self.releaseDate = releaseDate;
        self.overview = overview;
    }
    return self;
}
@end
