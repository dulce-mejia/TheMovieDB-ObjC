//
//  FeedViewModel.h
//  TheMovieDB-ObjC
//
//  Created by Dulce Gardenia Mejia Aguayo on 02/10/22.
//

#import <Foundation/Foundation.h>
#import "RemoteFeedLoader.h"
#import "RemoteImageLoader.h"
#import "MovieViewModel.h"

NS_ASSUME_NONNULL_BEGIN
typedef void (^myBlock)(void);

@class FeedSectionViewModel;

@interface FeedViewModel : NSObject

@property (nonatomic, strong) id<FeedLoader> feedLoader;
@property (nonatomic, strong) id<ImageLoader> imageLoader;
@property NSArray<FeedSectionViewModel*> *sections;

-(id)initWithFeedLoader: (id<FeedLoader>) feedLoader imageLoader: (id<ImageLoader>) imageLoader;
-(void)load;
-(NSUInteger)numberOfSections;
-(NSUInteger)numberOfElementsBySection: (NSInteger) section;
-(FeedSectionViewModel*)getFeedBySection: (NSInteger)section;
-(MovieViewModel*)getMoviesBySection: (NSInteger)section index:(NSInteger) index;

@end

NS_ASSUME_NONNULL_END
