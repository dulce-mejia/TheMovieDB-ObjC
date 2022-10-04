//
//  RemoteImageLoader.h
//  TheMovieDB-ObjC
//
//  Created by Dulce Gardenia Mejia Aguayo on 03/10/22.
//

#import <Foundation/Foundation.h>
#import "URLSessionHTTPClient.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^imageLoaderResult)(NSData *__nullable data, NSError *__nullable err);

@protocol ImageLoader <NSObject>

@required
-(void)loadWithURL: (NSURL*)url with:(NSString*) size completion:(imageLoaderResult)completion;

@end

@interface RemoteImageLoader : NSObject <ImageLoader>

@property (nonatomic, strong) id<HTTPClient> client;

-(id)initWithClient: (id<HTTPClient>) client;

@end

NS_ASSUME_NONNULL_END
