//
//  WCModHomePageViewController.m
//  WFModStyle1
//
//  Created by wufan on 2021/4/23.
//

#import "WCModHomePageViewController.h"
#import "WFSwiperView.h"
#import "WFHomePageTableViewCell.h"
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
@interface WCModHomePageViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong ) WFSwiperView  *swiperView;
@property (nonatomic, strong ) UITableView  *mTableView;

@end

@implementation WCModHomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.mTableView];
}
- (void )didClick:(UIButton *)sender {
    UIButton *btn = sender;
    btn.selected = !btn.selected;
    [self.swiperView startTimer:!btn.selected];
    
}
- (void )setUpUI {
    [self.view addSubview:self.swiperView];
    UIColor *color3 = [UIColor blueColor];
    
    UIImage *image1 = [UIImage imageNamed:@"00"];
    UIImage *image2 = [UIImage imageNamed:@"01"];
    UIImage *image3 = [UIImage imageNamed:@"02"];
    UIImage *image4 = [UIImage imageNamed:@"03"];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake((ScreenWidth-150)/2, 150+90, 150, 150)];
    [btn setTitle:@"关闭定时器" forState:UIControlStateNormal];
    [btn setTitle:@"打开定时器" forState:UIControlStateSelected];
    [btn setBackgroundColor:color3];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(didClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.swiperView loadDatas:@[image1,image2,image3,image4]];
}

- (UITableView *)mTableView
{
    if (_mTableView == nil) {
        _mTableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
        _mTableView.dataSource = self;
        _mTableView.delegate = self;
        _mTableView.backgroundColor = [UIColor whiteColor];
        _mTableView.separatorInset = UIEdgeInsetsZero;
        //        _mTableView.separatorStyle = YES;
        _mTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        if (@available(iOS 11.0, *)) {
            _mTableView.estimatedRowHeight = 0;
            _mTableView.estimatedSectionHeaderHeight = 0;
            _mTableView.estimatedSectionFooterHeight = 0;
        }
        [_mTableView registerClass:[WFHomePageTableViewCell class]
            forCellReuseIdentifier:@"WFHomePageTableViewCell"];
        
        [_mTableView registerClass:[WFHomePageDefaultCell class]
            forCellReuseIdentifier:@"WFHomePageDefaultCell"];
        
        _mTableView.showsVerticalScrollIndicator =NO;
    }
    return _mTableView;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1 ;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 150;
}
//
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01f;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section;
{
    UIView *headerView = [[UIView alloc] init];
    headerView.backgroundColor = [UIColor clearColor];
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01f;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *footView = [[UIView alloc] init];
    footView.backgroundColor = [UIColor clearColor];
    return footView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    

    if (indexPath.row==0&&indexPath.section==0) {
        WFHomePageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WFHomePageTableViewCell" ];
            if (!cell) {
                cell = [[WFHomePageTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"WFHomePageTableViewCell"];
            }
        return cell;
    }else{
        WFHomePageDefaultCell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"WFHomePageDefaultCell" forIndexPath:indexPath];
            if (!cell1) {
                cell1 = [[WFHomePageDefaultCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"WFHomePageDefaultCell"];
            }
        return cell1;
    }
    
}
- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section{
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}

- (WFSwiperView *)swiperView {
    if (!_swiperView) {
        _swiperView = [[WFSwiperView alloc]initWithFrame:CGRectMake(0, 88, ScreenWidth, 150)];
    }
    return _swiperView;
}

@end
