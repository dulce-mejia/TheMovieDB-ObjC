//
//  MovieViewModel.m
//  TheMovieDB-ObjC
//
//  Created by Dulce Gardenia Mejia Aguayo on 30/09/22.
//

#import "MovieViewModel.h"
#import "TheMovieDB_ObjC-Swift.h"

@interface MovieViewModel()

@property (nonatomic, strong)MovieModel *movie;

@end

@implementation MovieViewModel

-(id)initWithMovie: (MovieModel *) movie imageLoader:(id<ImageLoader>) imageLoader {
    if (self != nil) {
        self.movie = movie;
        self.imageLoader = imageLoader;
        self.id = movie.movieId;
        self.title = movie.title;
        self.overview = movie.overview;
        self.posterPath = movie.posterPath;
    }
    return self;
}

-(void)viewWillDisplay {
    if (self.posterPath != nil) {
        NSURL *url = [[NSURL alloc] initWithString:self.posterPath];
        [self.imageLoader loadWithURL:url with:@"w185" completion:^(NSData * _Nullable data, NSError * _Nullable err) {
            if (data != nil) {
                self.image = data;
            } else {
                NSLog(@"error getting image");
            }
        }];
    }
}

@end
