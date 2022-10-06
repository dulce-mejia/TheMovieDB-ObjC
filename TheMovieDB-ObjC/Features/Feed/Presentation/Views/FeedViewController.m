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
#import "TheMovieDB_ObjC-Swift.h"

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
    [self.feedView registerClass:[MovieSectionView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
}

-(void)updateFeed {
    __typeof(self) __weak weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        [weakSelf.feedView reloadData];
    });
}

#pragma mark - Observers

-(void)setObservers {
    [self.viewModel addObserver:self forKeyPath:@"sections" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
}

-(void)removeObservers {
    [self.viewModel removeObserver:self forKeyPath:@"sections"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"sections"]) {
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

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    MovieSectionView *sectionView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"header" forIndexPath:indexPath];
    if (!sectionView) {
        sectionView = [[MovieSectionView alloc] init];
    }
    sectionView.viewModel = [[MovieSectionViewModel alloc] initWithTitle:[self.viewModel getFeedBySection:indexPath.section].name];
    return sectionView;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.viewModel numberOfElementsBySection:section];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return [self.viewModel numberOfSections];
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MovieView *cell = (MovieView*) [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[MovieView alloc] init];
    }
    
    cell.viewModel = [self.viewModel getMoviesBySection:indexPath.section index:indexPath.row];
    cell.backgroundColor = [UIColor blackColor];
    return  cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
