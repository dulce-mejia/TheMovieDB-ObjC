//
//  RemoteFeedLoader.h
//  TheMovieDB-ObjC
//
//  Created by Dulce Gardenia Mejia Aguayo on 02/10/22.
//

#import <Foundation/Foundation.h>
#import "URLSessionHTTPClient.h"
#import "FeedEndpoint.h"
#import "TheMovieDB_ObjC-Swift.h"

NS_ASSUME_NONNULL_BEGIN
@protocol FeedLoader <NSObject>

typedef void (^feedLoaderCompletion)(NSArray<MovieModel *> *__nullable movies, NSError *__nullable err);

@required
-(void)loadWithFeedType:(FeedType) feedType completion:(nullable feedLoaderCompletion)completion;

@end

@interface RemoteFeedLoader : NSObject <FeedLoader>

@property (nonatomic, strong) id<HTTPClient> client;

-(id)initWithClient: (id<HTTPClient>) client;
-(void)loadWithFeedType:(FeedType) feedType completion:(nullable feedLoaderCompletion)completion;

@end

NS_ASSUME_NONNULL_END
