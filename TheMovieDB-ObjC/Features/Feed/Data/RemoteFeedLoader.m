//
//  RemoteFeedLoader.m
//  TheMovieDB-ObjC
//
//  Created by Dulce Gardenia Mejia Aguayo on 02/10/22.
//

#import "RemoteFeedLoader.h"
#import "Movie.h"

@implementation RemoteFeedLoader

-(id)initWithClient: (id<HTTPClient>) client {
    self = [super init];
    if (self) {
        self.client = client;
    }
    return self;
}
-(void)loadWithFeedType:(FeedType) feedType completion:(nullable feedLoaderCompletion)completion {
    FeedEndpoint *endpoint = [[FeedEndpoint alloc] initWithFeedType:feedType];
    if (endpoint.url) {
        NSLog(@"URL...%@", endpoint.url);
        [self.client getFromUrl:endpoint.url onCompletion:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable err) {
            
            if (data != nil) {
                NSError *parsingError = nil;
                NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&err][@"results"];
                if (parsingError == nil) {
                    NSMutableArray *movies = [[NSMutableArray alloc] init];
                    
                    for (NSDictionary *m in json) {
                        Movie *movie = [[Movie alloc] initMovieWithId:[[m objectForKey:@"id"] integerValue]
                                                         backdropPath:[m objectForKey:@"backdrop_path"]
                                                         voteCount:[[m objectForKey:@"vote_count"] integerValue]
                                                         origTitle:[m objectForKey:@"original_title"]
                                                         posterPath:[m objectForKey:@"poster_path"]
                                                         title:[m objectForKey:@"title"]
                                                         voteAvg:0.0
                                                         releaseDate:[m objectForKey:@"release_date"]
                                                         overview:[m objectForKey:@"overview"]];
                        [movies addObject:movie];
                    }
                    completion(movies, nil);
                }
            } else {
                NSLog(@"An error ocurred on feedLoader. %@", err.description);
                completion(nil, err);
            }
        }];
    } else {
        NSLog(@"bad url");
    }
}

@end
