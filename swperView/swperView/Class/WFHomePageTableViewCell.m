//
//  WFHomePageTableViewCell.m
//  WFModStyle1
//
//  Created by wufan on 2021/4/24.
//

#import "WFHomePageTableViewCell.h"
#import "WFSwiperView.h"
@interface WFHomePageTableViewCell()
@property (nonatomic, strong ) WFSwiperView  *swiperView;
@end

@implementation WFHomePageTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUpUI];
        self.selectionStyle              = UITableViewCellSelectionStyleNone;
        self.backgroundColor             = [UIColor whiteColor];
        self.contentView.backgroundColor = [UIColor whiteColor];
    }
    return self;
}
- (void )setUpUI {
    
    [self.contentView addSubview:self.swiperView];
    UIImage *image1 = [UIImage imageNamed:@"00"];
    UIImage *image2 = [UIImage imageNamed:@"01"];
    UIImage *image3 = [UIImage imageNamed:@"02"];
    UIImage *image4 = [UIImage imageNamed:@"03"];
    
    [self.swiperView loadDatas:@[image1,image2,image3,image4]];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
    
}

-(WFSwiperView *)swiperView {
   if (!_swiperView) {
       _swiperView = [[WFSwiperView alloc]initWithFrame:CGRectMake(0, 0, self.contentView.frame.size.width, 150)];
   }
   return _swiperView;
}
@end
@implementation WFHomePageDefaultCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor blueColor];
    }
    return self;
}

@end
