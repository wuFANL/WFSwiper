//
//  WFSwiperViewCell.m
//  WFModStyle1
//
//  Created by wufan on 2021/4/23.
//

#import "WFSwiperViewCell.h"

@implementation WFSwiperViewCell{
    UIImageView *_imageView;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _imageView = [[UIImageView alloc]initWithFrame:self.contentView.frame];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        
        [self.contentView addSubview:_imageView];
        
    }
    return self;
}
- (void )loadImage :(UIImage *)image{
    if (image) {
        _imageView.image = image;
    }
}


@end




@implementation wfTableCell

//- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier

@end
