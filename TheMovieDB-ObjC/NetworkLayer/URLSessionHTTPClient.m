//
//  URLSessionHTTPClient.m
//  TheMovieDB-ObjC
//
//  Created by Dulce Gardenia Mejia Aguayo on 01/10/22.
//

#import "URLSessionHTTPClient.h"

@interface URLSessionHTTPClient()

@property NSURLSession *session;

@end

@implementation URLSessionHTTPClient

-(id) initWithSession: (NSURLSession *) session {
    self = [super init];
    if (self) {
        self.session = session;
    }
    return self;
}

- (void)deleteFromUrl:(nonnull NSURL *)url onCompletion:(nullable onCompletion)completion {
    
}

- (void)getFromUrl:(nonnull NSURL *)url onCompletion:(nullable onCompletion)completion {
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    [[self task:request completion:completion] resume];
}

- (void)patchFromUrl:(nonnull NSURL *)url data:(nonnull NSData *)data onCompletion:(nullable onCompletion)completion {
    
}

- (void)postFromUrl:(nonnull NSURL *)url data:(nonnull NSData *)data onCompletion:(nullable onCompletion)completion {
    
}

- (void)putFromUrl:(nonnull NSURL *)url data:(nonnull NSData *)data onCompletion:(nullable onCompletion)completion {
    
}

-(NSURLSessionDataTask*) task: (NSURLRequest *)request completion: (nullable onCompletion)completion {
    
    return [self.session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error != nil) {
            completion(nil, nil, error);
        } else {
            completion(data, response, nil);
        }
    }];
}

@end
