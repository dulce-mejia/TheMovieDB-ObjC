//
//  Endpoint.m
//  TheMovieDB-ObjC
//
//  Created by Dulce Gardenia Mejia Aguayo on 02/10/22.
//

#import "Endpoint.h"

@implementation Endpoint

-(id)init {
    self = [super init];
    if (self) {
        self.base = @"https://api.themoviedb.org";
        self.apiKey = [[NSURLQueryItem alloc]initWithName:@"api_key" value:@"f6cd5c1a9e6c6b965fdcab0fa6ddd38a"];
    }
    return self;
}

@end
