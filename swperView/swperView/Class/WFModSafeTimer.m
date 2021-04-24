//
//  WFModSafeTimer.m
//  WFModStyle1
//
//  Created by wufan on 2021/4/23.
//

#import "WFModSafeTimer.h"

@implementation WFModSafeTimer{
    NSTimer *_timer;
    NSTimeInterval _ti;
}

- (void)scheduledTimerWithTimeInterval:(NSTimeInterval)ti  repeats:(BOOL)yesOrNo{
    _timer = [NSTimer scheduledTimerWithTimeInterval:ti target:self selector:@selector(timerRuning) userInfo:nil repeats:yesOrNo];
    _ti = ti;
    [[NSRunLoop currentRunLoop]addTimer:_timer forMode:NSRunLoopCommonModes];
    
    
}
- (void )timerRuning {
    if (self.delegate && [self.delegate respondsToSelector:@selector(timeRuningAction)]) {
        [self.delegate timeRuningAction];
    }
}
- (void )startTimer:(BOOL)immediately {
    NSLog(@"定时器开始");
    if (_timer) {
//        NSDate *date  = [NSDate distantPast];
        NSDate *delayDate = [[NSDate date]dateByAddingTimeInterval:_ti];
        
//        NSDate  *fireDate = immediately ? date : delayDate;//延时后操作
        [_timer setFireDate:delayDate];
    }
}

- (void )stopTimer {
    if (_timer) {
        [_timer setFireDate:[NSDate distantFuture]];
        NSLog(@"定时器停止");
    }
}
- (void )removeTimer {
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
}

- (void)dealloc
{
    [self stopTimer];
    [self removeTimer];
    NSLog(@"--------------------- 定时器已销毁");
}

@end
