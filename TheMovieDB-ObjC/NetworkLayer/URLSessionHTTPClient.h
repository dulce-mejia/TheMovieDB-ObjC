//
//  URLSessionHTTPClient.h
//  TheMovieDB-ObjC
//
//  Created by Dulce Gardenia Mejia Aguayo on 01/10/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol HTTPClient <NSObject>

typedef void (^onCompletion)(NSData *__nullable data, NSURLResponse * _Nullable response, NSError *__nullable err);

@required

-(void) getFromUrl:(NSURL*) url onCompletion:(nullable onCompletion)completion;
-(void) postFromUrl:(NSURL*) url data:(NSData *)data onCompletion:(nullable onCompletion)completion;
-(void) putFromUrl:(NSURL*) url data:(NSData *)data onCompletion:(nullable onCompletion)completion;
-(void) patchFromUrl:(NSURL*) url data:(NSData *)data onCompletion:(nullable onCompletion)completion;
-(void) deleteFromUrl:(NSURL*) url onCompletion:(nullable onCompletion)completion;

@end

@interface URLSessionHTTPClient : NSObject <HTTPClient>

-(id) initWithSession: (NSURLSession *) session;

@end

NS_ASSUME_NONNULL_END
