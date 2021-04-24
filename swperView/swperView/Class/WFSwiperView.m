//
//  WFSwiperView.m
//  WFModStyle1
//
//  Created by wufan on 2021/4/23.
//

#import "WFSwiperView.h"
#import "WFModSafeTimer.h"
#import "WFSwiperViewCell.h"
#import "WFPageControl.h"
#define MaxSection 20

@interface WFSwiperView()<UICollectionViewDelegate,UICollectionViewDataSource,WFModSafeTimerDelegate>
@property (nonatomic, strong ) UICollectionView  *swiperView;
@property (nonatomic, strong ) WFPageControl *pageControl;


@property (nonatomic, strong ) WFModSafeTimer  *timer;
@property (nonatomic, strong ) NSMutableArray  *items;

@end

@implementation WFSwiperView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:self.swiperView];
        [self.swiperView registerClass:[WFSwiperViewCell class] forCellWithReuseIdentifier:@"WFSwiperViewCell"];
        self.backgroundColor  = [UIColor redColor];
        self.timer = [[WFModSafeTimer alloc]init];
        self.timer.delegate = self;
        [self.timer scheduledTimerWithTimeInterval:1.5 repeats:YES];
        
        self.pageControl = [[WFPageControl alloc]initWithFrame:CGRectMake(0, self.frame.size.height-50, self.frame.size.width, 50)];
        [self.pageControl addTarget:self action:@selector(didClickPageCo:) forControlEvents:UIControlEventValueChanged];
        self.pageControl.numberOfPages = 2;
        self.pageControl.currentPage = 0;
        self.pageControl.hidesForSinglePage =self;
        self.pageControl.pageIndicatorTintColor = [UIColor grayColor];
        self.pageControl.currentPageIndicatorTintColor = [UIColor redColor];
//        [self.pageControl setValue:[UIImage imageNamed:@"select.png"] forKeyPath:@"currentPageImage"];
//        [self.pageControl setValue:[UIImage imageNamed:@"common"] forKeyPath:@"pageImage"];
        
        [self insertSubview:self.pageControl aboveSubview:self.swiperView];
       
    }
    return self;
}
- (void )didClickPageCo:(UIPageControl *)sender{
    NSInteger page = sender.currentPage;
    
}


- (void )startTimer :(BOOL )startOrStop{
    if (startOrStop) {
        [self.timer startTimer:YES];
    }else{
        [self.timer stopTimer];
    }
}

- (void )loadDatas :(NSArray *)items{
    [self.items removeAllObjects];
    self.items = items.mutableCopy;
//    if (items.count>0) {
//        [self.items insertObject:items.lastObject atIndex:0];
//        [self.items addObject:items[0]];
//    }
    [self.timer startTimer:NO];
    
    [self.swiperView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:MaxSection/2] atScrollPosition:UICollectionViewScrollPositionRight animated:YES];
    self.pageControl.numberOfPages = items.count;
}

- (void)timeRuningAction{
    
    if (self.swiperView.dragging) {
        return;
    }

    {
        NSIndexPath *currentIndexPath = [[self.swiperView indexPathsForVisibleItems] lastObject];

        NSIndexPath *currentIndexPathReset = [NSIndexPath indexPathForItem:currentIndexPath.item inSection:MaxSection/2];
        [self.swiperView scrollToItemAtIndexPath:currentIndexPathReset atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];

        NSInteger nextItem = currentIndexPathReset.item +1;
        NSInteger nextSection = currentIndexPathReset.section;
        if (nextItem==self.items.count) {
            nextItem=0;
            nextSection++;
        }
        NSIndexPath *nextIndexPath = [NSIndexPath indexPathForItem:nextItem inSection:nextSection];
        NSLog(@"nextSection :%ld nextItem:%ld",nextSection,nextItem);
        [self.swiperView scrollToItemAtIndexPath:nextIndexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    }
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return MaxSection;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return  self.items.count;
}
    
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    WFSwiperViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"WFSwiperViewCell" forIndexPath:indexPath];
    if (!cell) {
        cell = [[WFSwiperViewCell alloc]init];
    }
    [cell loadImage: self.items[indexPath.row]];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    UIResponder *resp = self;
    while ((resp = [resp nextResponder])) {
        if ([resp isKindOfClass:[UIViewController class]]) {
            UIViewController *co = (UIViewController *)resp;
            UIViewController *pVC = [[NSClassFromString(@"WCModHomePageViewController") alloc]init];
            [co.navigationController pushViewController:pVC animated:YES];
            return;
        }
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.timer stopTimer];
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [self.timer startTimer:YES];
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

}
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{

}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{

    int page = (int) (scrollView.contentOffset.x/scrollView.frame.size.width+0.5)%self.items.count;
    self.pageControl.currentPage =page;
    
    
}

- (UICollectionView *)swiperView {
    if (!_swiperView) {
        
        UICollectionViewFlowLayout *flayout = [[UICollectionViewFlowLayout alloc]init];
        flayout.scrollDirection             = UICollectionViewScrollDirectionHorizontal;
        flayout.minimumLineSpacing          = 0;
        flayout.minimumInteritemSpacing     = 0;
        flayout.itemSize                    = CGSizeMake( [UIScreen mainScreen].bounds.size.width, self.frame.size.height);
        _swiperView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0,  [UIScreen mainScreen].bounds.size.width, self.frame.size.height) collectionViewLayout:flayout];
        _swiperView.pagingEnabled           = YES;
        _swiperView.bounces                 = NO;
        _swiperView.showsHorizontalScrollIndicator = NO;
        _swiperView.showsVerticalScrollIndicator   = NO;
        _swiperView.dataSource              = self;
        _swiperView.delegate                = self;
        
    }
    return _swiperView;
}
- (NSMutableArray *)items {
    if (!_items) {
        _items = [[NSMutableArray alloc]init];
    }
    return _items;
}
- (void)dealloc
{
    [self.timer removeTimer];
    self.timer = nil;
    NSLog(@"轮播图已销毁");
}
@end
