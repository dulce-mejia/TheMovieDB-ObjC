//
//  FeedViewModel.m
//  TheMovieDB-ObjC
//
//  Created by Dulce Gardenia Mejia Aguayo on 02/10/22.
//

#import "FeedViewModel.h"

@interface FeedViewModel()

@end

@implementation FeedViewModel

-(id)initWithFeedLoader: (id<FeedLoader>) feedLoader imageLoader: (id<ImageLoader>) imageLoader {
    self = [super init];
    if (self) {
        self.feedLoader = feedLoader;
        self.imageLoader = imageLoader;
    }
    return self;
}

-(void)load {
    [self getFeed];
}

-(void)getFeed {
    __typeof(self) __weak weakSelf = self;
    [self.feedLoader loadWithFeedType:FeedTypeNowPlaying completion:^(NSArray<MovieModel *> * _Nonnull movies, NSError * _Nullable err) {
        
        if (movies != nil) {
            dispatch_async(dispatch_get_main_queue(), ^{
                NSMutableArray *viewModels = [[NSMutableArray alloc] init];
                for (MovieModel *movie in movies) {
                    MovieViewModel *vm = [[MovieViewModel alloc] initWithMovie:movie imageLoader:self.imageLoader];
                    [viewModels addObject:vm];
                }
                weakSelf.movies = viewModels;
            });
        } else {
            NSLog(@"An error ocurred %@", err.description);
        }
    }];
}

-(void) dealloc {
    NSLog(@"Deallocated! FeedViewModel");
}

//-(void)getFeed {
////    NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
////    NSLog(@"result %@", string);
//
//}

-(MovieViewModel*)getMovieViewModelByIndex: (NSInteger)index {
    return self.movies[index];
}

@end
