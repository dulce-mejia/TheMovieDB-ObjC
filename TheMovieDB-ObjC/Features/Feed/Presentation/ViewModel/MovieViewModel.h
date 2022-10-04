//
//  MovieViewModel.h
//  TheMovieDB-ObjC
//
//  Created by Dulce Gardenia Mejia Aguayo on 30/09/22.
//

#import <Foundation/Foundation.h>
#import "Movie.h"
#import "RemoteImageLoader.h"

NS_ASSUME_NONNULL_BEGIN

@interface MovieViewModel : NSObject

@property (nonatomic, strong) id<ImageLoader> imageLoader;
@property (nonatomic) NSInteger id;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *overview;
@property (nonatomic, strong, nullable) NSString *posterPath;
@property (nonatomic, strong) NSData *image;

-(id)initWithMovie:(Movie *) movie imageLoader:(id<ImageLoader>) imageLoader;
-(void)viewWillDisplay;
@end

NS_ASSUME_NONNULL_END
