//
//  Endpoint.h
//  TheMovieDB-ObjC
//
//  Created by Dulce Gardenia Mejia Aguayo on 02/10/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Endpoint : NSObject

@property (nonatomic, strong) NSString *base;
@property (nonatomic, strong) NSURLQueryItem *apiKey;
@property (nonatomic, strong) NSURL *url;
@property (nonatomic, strong) NSDictionary *queryItems;

-(id) init;

@end

NS_ASSUME_NONNULL_END
