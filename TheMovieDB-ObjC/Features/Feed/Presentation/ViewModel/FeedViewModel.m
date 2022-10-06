//
//  FeedViewModel.m
//  TheMovieDB-ObjC
//
//  Created by Dulce Gardenia Mejia Aguayo on 02/10/22.
//

#import "FeedViewModel.h"
#import "TheMovieDB_ObjC-Swift.h"

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

-(NSUInteger)numberOfSections {
    return self.sections.count;
}

-(NSUInteger)numberOfElementsBySection: (NSInteger) section {
    return self.sections[section].movies.count;
}

-(void)getFeed {
    __typeof(self) __weak weakSelf = self;
    
    dispatch_group_t group = dispatch_group_create();
    
    NSMutableArray *sectionsVM = [[NSMutableArray alloc] init];
    for (int i = 0; i < 5; i++) {
        dispatch_group_enter(group);
        [self.feedLoader loadWithFeedType: i completion:^(NSArray<MovieModel *> * _Nonnull movies, NSError * _Nullable err) {
            NSMutableArray *moviesVM = [[NSMutableArray alloc] init];
            if (movies != nil) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    for (MovieModel *movie in movies) {
                        MovieViewModel *vm = [[MovieViewModel alloc] initWithMovie:movie imageLoader:self.imageLoader];
                        [moviesVM addObject:vm];
                    }
                    FeedSectionViewModel *section = [[FeedSectionViewModel alloc] initWithSection:i movies:moviesVM];
                    [sectionsVM addObject:section];
                });
            } else {
                NSLog(@"An error ocurred %@", err.description);
            }
            dispatch_group_leave(group);
        }];
    }
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        // NSLog(@"Finished");
        NSSortDescriptor *valueDescriptor = [[NSSortDescriptor alloc] initWithKey:@"section" ascending:YES];
        NSArray * descriptors = [NSArray arrayWithObject:valueDescriptor];
        
        weakSelf.sections = [sectionsVM sortedArrayUsingDescriptors:descriptors];
//        for(FeedSectionViewModel* section in weakSelf.sections) {
//            NSLog(@"******* Section %@", section.section);
//            for(MovieViewModel* movieVM in section.movies) {
//                NSLog(@"Movie %@", movieVM.title);
//            }
//        }
    });
}

-(void) dealloc {
    NSLog(@"Deallocated! FeedViewModel");
}

//-(void)getFeed {
////    NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
////    NSLog(@"result %@", string);
//
//}

-(FeedSectionViewModel*)getFeedBySection: (NSInteger)section {
    return self.sections[section];
}
-(MovieViewModel*)getMoviesBySection: (NSInteger)section index:(NSInteger) index {
    return self.sections[section].movies[index];;
}

@end
