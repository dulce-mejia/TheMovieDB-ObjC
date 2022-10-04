//
//  Movie.h
//  TheMovieDB-ObjC
//
//  Created by Dulce Gardenia Mejia Aguayo on 29/09/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Movie : NSObject

@property (nonatomic) NSInteger movieId;
@property (nonatomic, strong, nullable) NSString *backdropPath;
@property (nonatomic) NSInteger voteCount;
@property (nonatomic, strong) NSString *originalTitle;
@property (nonatomic, strong, nullable) NSString *posterPath;
@property (nonatomic, strong) NSString *title;
@property (nonatomic) double voteAverage;
@property (nonatomic, strong, nullable) NSString *releaseDate;
@property (nonatomic, strong, nullable) NSString *overview;

-(instancetype) initMovieWithId:(NSInteger)movieId backdropPath:(NSString* _Nullable)backdropPath voteCount: (NSInteger)voteCount origTitle:(NSString*)origTitle posterPath: (NSString* _Nullable)posterPath title:(NSString*)title voteAvg: (double)voteAvg releaseDate:(NSString* _Nullable)releaseDate overview:(NSString* _Nullable) overview;

@end

NS_ASSUME_NONNULL_END
