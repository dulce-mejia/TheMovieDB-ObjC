//
//  RemoteImageLoader.m
//  TheMovieDB-ObjC
//
//  Created by Dulce Gardenia Mejia Aguayo on 03/10/22.
//

#import "RemoteImageLoader.h"

@interface RemoteImageLoader()
@property (nonatomic, strong) NSString *base;
@end

@implementation RemoteImageLoader

-(id)initWithClient: (id<HTTPClient>) client {
    self = [super init];
    if (self) {
        self.base = @"https://image.tmdb.org/t/p/";
        self.client = client;
    }
    return self;
}

- (void)loadWithURL:(nonnull NSURL *)url with:(nonnull NSString *)size completion:(nonnull imageLoaderResult)completion {
    NSString *finalPath = [[self.base stringByAppendingString:size] stringByAppendingString:url.path];
    NSURL *finalUrl = [[NSURL alloc] initWithString: finalPath];
    [self.client getFromUrl:finalUrl onCompletion:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable err) {
        if (data != nil) {
            completion(data, nil);
        } else {
            completion(nil, err);
        }
    }];
}

@end
