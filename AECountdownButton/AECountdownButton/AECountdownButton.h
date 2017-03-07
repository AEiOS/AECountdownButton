//
//  AECountdownButton.h
//  AECountdownButton
//
//  Created by AirEDoctor on 06/03/2017.
//  Copyright © 2017 AirEDoctor. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AECountdownButton;

@protocol AECountdownButtonDelegate <NSObject>

@optional
- (void)countdownButtonDidBeginCountingDown:(AECountdownButton *_Nonnull)button;
- (void)countdownButton:(AECountdownButton *_Nonnull)button countDownTo:(NSInteger)second;
- (void)countdownButtonDidFinishCountingDown:(AECountdownButton *_Nonnull)button;

@end

@interface AECountdownButton : UIButton

/// 代理
@property (nonatomic, weak, readwrite, nullable) id<AECountdownButtonDelegate> delegate;
/// 秒数
@property (nonatomic, assign, readwrite) NSInteger seconds;

@end
