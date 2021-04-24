//
//  WFModSafeTimer.h
//  WFModStyle1
//
//  Created by wufan on 2021/4/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@protocol WFModSafeTimerDelegate <NSObject>
- (void )timeRuningAction;

@end


@interface WFModSafeTimer : NSObject
@property (nonatomic, weak) id<WFModSafeTimerDelegate>  delegate;


- (void)scheduledTimerWithTimeInterval:(NSTimeInterval)ti  repeats:(BOOL)yesOrNo;

- (void )startTimer:(BOOL)immediately  ;/**<开始定时器  immediately是否立刻执行*/
- (void )stopTimer   ;/**<暂停定时器*/
- (void )removeTimer ;/**<移除定时器*/

@end

NS_ASSUME_NONNULL_END
