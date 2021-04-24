//
//  WFSwiperView.h
//  WFModStyle1
//
//  Created by wufan on 2021/4/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WFSwiperView : UIView
- (void )loadDatas :(NSArray *)items;
- (void )startTimer :(BOOL )startOrStop;
@end

NS_ASSUME_NONNULL_END
