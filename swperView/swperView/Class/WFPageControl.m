//
//  WFPageControl.m
//  WFModStyle1
//
//  Created by wufan on 2021/4/24.
//

#import "WFPageControl.h"

@implementation WFPageControl
- (void)setCurrentPage:(NSInteger)currentPage{
    [super setCurrentPage:currentPage];
    
    for (NSInteger i =0; i <self.subviews.count; i++) {
        if (i == currentPage) {
            UIView *subView = [self.subviews objectAtIndex:i];
            [subView setFrame:CGRectMake(subView.frame.origin.x, subView.frame.origin.y, 150, 150)];
        }
    }
    
}

@end
