//
//  MovieView.m
//  TheMovieDB-ObjC
//
//  Created by Dulce Gardenia Mejia Aguayo on 30/09/22.
//

#import "MovieView.h"
#import <UIKit/UIKit.h>

@interface MovieView()
@property (nonatomic, strong) UIImageView *posterImageView;
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation MovieView
NSString *const reuseIdentifier = @"movieViewCell";

-(instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    [self configUI];
    return self;
}

- (void)setViewModel:(MovieViewModel *)viewModel {
    if (_viewModel != viewModel) {
        _viewModel = viewModel;
        [self configureViews];
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self configUI];
}

-(void)configUI {
    self.titleLabel = [[UILabel alloc]init];
    self.titleLabel.textColor = [UIColor whiteColor];
    self.titleLabel.font = [UIFont systemFontOfSize:14 weight:UIFontWeightBold];
    self.titleLabel.numberOfLines = 0;
    self.titleLabel.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    self.posterImageView = [[UIImageView alloc]init];
    
    [self.contentView addSubview: self.posterImageView];
    [self.contentView addSubview: self.titleLabel];
    
    self.clipsToBounds = YES;
    self.layer.cornerRadius = 10;
    
    [self setConstraints];
}

-(void)setConstraints {
    self.posterImageView.translatesAutoresizingMaskIntoConstraints = false;
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = false;
    [self.posterImageView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor].active = YES;
    [self.posterImageView.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor].active = YES;
    [self.posterImageView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor].active = YES;
    [self.posterImageView.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor].active = YES;
    [self.titleLabel.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor].active = YES;
    [self.titleLabel.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor].active = YES;
    [self.titleLabel.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor].active = YES;
}

-(void)configureViews {
    [self setObservers];
    self.titleLabel.text = self.viewModel.title;
    self.posterImageView.image = [UIImage imageNamed:@"revenant"];
    [self.viewModel viewWillDisplay];
}

-(void)loadImage {
    __typeof(self) __weak weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        weakSelf.posterImageView.image = [[UIImage alloc] initWithData:self.viewModel.image];
    });
}

#pragma mark - Observers

-(void)setObservers {
    [self.viewModel addObserver:self forKeyPath:@"image" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
}

-(void)removeObservers {
    [self.viewModel removeObserver:self forKeyPath:@"image"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"image"]) {
        [self loadImage];
    }
}

- (void)dealloc {
    NSLog(@"Deallocated!");
    [self removeObservers];
}

@end
