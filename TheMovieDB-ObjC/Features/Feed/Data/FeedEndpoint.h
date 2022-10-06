//
//  FeedEndpoint.h
//  TheMovieDB-ObjC
//
//  Created by Dulce Gardenia Mejia Aguayo on 02/10/22.
//

#import <Foundation/Foundation.h>
#import "Endpoint.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, FeedType) {
    FeedTypeNowPlaying = 0,
    FeedTypeTrending,
    FeedTypePopular,
    FeedTypeTopRated,
    FeedTypeUpcoming
};

@interface FeedEndpoint : Endpoint

@property (nonatomic, strong) NSString *path;

-(id)initWithFeedType: (FeedType)type;

@end

NS_ASSUME_NONNULL_END
