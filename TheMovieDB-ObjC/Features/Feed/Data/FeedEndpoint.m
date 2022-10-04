//
//  FeedEndpoint.m
//  TheMovieDB-ObjC
//
//  Created by Dulce Gardenia Mejia Aguayo on 02/10/22.
//

#import "FeedEndpoint.h"

@implementation FeedEndpoint

-(id)initWithFeedType: (FeedType)type {
    self = [super init];
    if (self) {
        self.path = [self pathForType:type];
        self.url = [self buildComponents].URL;
    }
    return self;
}

-(NSString*)pathForType:(FeedType) type {
    switch (type) {
        case FeedTypeNowPlaying:
            return @"/3/movie/now_playing";
            break;
        case FeedTypeTrending:
            return @"/3/trending/movie/day";
            break;
        case FeedTypePopular:
            return @"/3/movie/popular";
            break;
        case FeedTypeTopRated:
            return @"/3/movie/top_rated";
            break;
        case FeedTypeUpcoming:
            return @"/3/movie/upcoming";
            break;
    }
}

-(NSURLComponents*)buildComponents {
    NSURLComponents *components = [[NSURLComponents alloc] initWithString:self.base];
    components.path = self.path;
    components.queryItems = @[self.apiKey];
    return components;
}

@end
