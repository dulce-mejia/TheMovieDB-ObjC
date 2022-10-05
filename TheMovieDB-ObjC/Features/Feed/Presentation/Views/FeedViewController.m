//
//  FeedViewController.m
//  TheMovieDB-ObjC
//
//  Created by Dulce Gardenia Mejia Aguayo on 29/09/22.
//

#import "FeedViewController.h"
#import <UIKit/UIKit.h>
#import "MovieView.h"
#import "MovieViewModel.h"
#import "FeedViewModel.h"

@interface FeedViewController ()

@property (nonatomic, strong) UIStackView *container;
@property (nonatomic, strong) UICollectionView *feedView;
@property (nonatomic, strong) MovieModel *movie;
@property (nonatomic, strong) FeedViewModel *viewModel;
@end

@implementation FeedViewController

-(id)initWithViewModel:(FeedViewModel*) viewModel {
    self = [super initWithNibName:nil bundle:nil];
    if (self != nil) {
        self.viewModel = viewModel;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
    [self setObservers];
    [self.viewModel load];
}

-(void)configUI {
    [self setTitle:@"The MovieDB"];
    self.view.backgroundColor = [UIColor whiteColor];
    self.container = [[UIStackView alloc] init];
    self.container.translatesAutoresizingMaskIntoConstraints = false;
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.headerReferenceSize = CGSizeMake(self.view.bounds.size.width , 50);
    layout.itemSize = CGSizeMake(160 * 0.7, 160);
    layout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
    self.feedView = [[UICollectionView alloc] initWithFrame: CGRectZero collectionViewLayout:[UICollectionViewLayout new]];
    self.feedView.collectionViewLayout = layout;
    
    [self.view addSubview:self.container];
    [self.container addArrangedSubview:self.feedView];
    [self setContraints];
    [self setCollection];
}

-(void)setContraints {
    [self.container.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    [self.container.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
    [self.container.topAnchor constraintEqualToAnchor:self.view.layoutMarginsGuide.topAnchor].active = YES;
    [self.container.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
}

-(void)setCollection {
    self.feedView.delegate = self;
    self.feedView.dataSource = self;
    [self.feedView registerClass:[MovieView class] forCellWithReuseIdentifier:reuseIdentifier];
}

-(void)updateFeed {
    __typeof(self) __weak weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        [weakSelf.feedView reloadData];
    });
}

#pragma mark - Observers

-(void)setObservers {
    [self.viewModel addObserver:self forKeyPath:@"movies" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
}

-(void)removeObservers {
    [self.viewModel removeObserver:self forKeyPath:@"movies"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"movies"]) {
        NSLog(@"Movies changed");
        [self updateFeed];
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self removeObservers];
}

-(void) dealloc {
    NSLog(@"Deallocated!");
}

#pragma mark - UICollectionView delegate & datasource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MovieView *cell = (MovieView*) [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[MovieView alloc] init];
    }
    
    cell.viewModel = [self.viewModel getMovieViewModelByIndex:indexPath.row];
    cell.backgroundColor = [UIColor greenColor];
    return  cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
