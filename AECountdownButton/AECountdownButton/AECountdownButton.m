//
//  AECountdownButton.m
//  AECountdownButton
//
//  Created by AirEDoctor on 06/03/2017.
//  Copyright © 2017 AirEDoctor. All rights reserved.
//

#import "AECountdownButton.h"

@interface AECountdownButton ()

/// 计时器
@property (nonatomic, strong, readwrite) NSTimer *timer;

@end

@implementation AECountdownButton

- (void)setSeconds:(NSInteger)seconds
{
    if (_seconds != seconds) {
        _seconds = seconds;
        
        if (seconds <= 0) { // 倒计时完成
            self.enabled = YES;
            
            if (self.delegate != nil) {
                [self.delegate countdownButtonDidFinishCountingDown:self];
            }
            [self.timer invalidate];
            self.timer = nil;
        }
        else {
            if (self.timer == nil) { // 开始倒计时
                self.enabled = NO;
                self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countingDown) userInfo:nil repeats:YES];
                if (self.delegate != nil) {
                    [self.delegate countdownButtonDidBeginCountingDown:self];
                }
            }
            else { // 继续倒计时
                if (self.delegate != nil) {
                    [self.delegate countdownButton:self countDownTo:seconds];
                }
            }
        }
    }
}


#pragma mark - 私有方法

/// 倒计时
- (void)countingDown
{
    self.seconds = self.seconds - 1;
}



@end
