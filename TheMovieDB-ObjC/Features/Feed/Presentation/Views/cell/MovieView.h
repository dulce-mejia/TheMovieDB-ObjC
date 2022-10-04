//
//  MovieView.h
//  TheMovieDB-ObjC
//
//  Created by Dulce Gardenia Mejia Aguayo on 30/09/22.
//

#import <UIKit/UIKit.h>
#import "MovieViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MovieView : UICollectionViewCell
extern NSString *const reuseIdentifier;
@property (nonatomic, strong) MovieViewModel *viewModel;

@end

NS_ASSUME_NONNULL_END
