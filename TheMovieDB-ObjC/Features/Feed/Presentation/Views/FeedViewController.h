//
//  FeedViewController.h
//  TheMovieDB-ObjC
//
//  Created by Dulce Gardenia Mejia Aguayo on 29/09/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class FeedViewModel;
@interface FeedViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>

-(id)initWithViewModel:(FeedViewModel*) viewModel;

@end

NS_ASSUME_NONNULL_END
