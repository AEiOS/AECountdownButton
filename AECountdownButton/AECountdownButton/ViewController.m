//
//  ViewController.m
//  AECountdownButton
//
//  Created by AirEDoctor on 06/03/2017.
//  Copyright © 2017 AirEDoctor. All rights reserved.
//

#import "ViewController.h"
#import "AECountdownButton.h"

@interface ViewController () <AECountdownButtonDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AECountdownButton *countdownButton = [AECountdownButton buttonWithType:UIButtonTypeCustom];
    countdownButton.backgroundColor = [UIColor lightGrayColor];
    countdownButton.translatesAutoresizingMaskIntoConstraints = NO;
    countdownButton.delegate = self;
    [countdownButton setTitle:@"发送验证码" forState:UIControlStateNormal];
    [countdownButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [countdownButton addTarget:self action:@selector(countdownButtonDidClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:countdownButton];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-20.0-[countdownButton(100.0)]"
                                                                     options:0
                                                                     metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(countdownButton)]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20.0-[countdownButton(30.0)]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(countdownButton)]];
}


#pragma mark - AECountdownButtonDelegate

- (void)countdownButtonDidBeginCountingDown:(AECountdownButton *)button
{
    NSLog(@"开始倒计时");
}

- (void)countdownButton:(AECountdownButton *)button countDownTo:(NSInteger)second
{
    [button setTitle:[NSString stringWithFormat:@"%ld秒", second] forState:UIControlStateDisabled];
}

- (void)countdownButtonDidFinishCountingDown:(AECountdownButton *)button
{
    [button setTitle:@"重新发送" forState:UIControlStateNormal];
}

#pragma mark - 私有方法

- (void)countdownButtonDidClicked:(AECountdownButton *)button
{
    button.seconds = 60;
}


@end
