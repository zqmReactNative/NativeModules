//
//  LoginEventEmitterManager.m
//  NativeJS
//
//  Created by laznrbfe on 17/3/12.
//  Copyright © 2017年 Ucacc. All rights reserved.
//

#import "LoginEventEmitterManager.h"

NSString *const UCALoginSuccessNotification = @"LoginSuccessNotification";

NSString *const kLoginSuccessEvent = @"kLoginSuccessEvent";

@implementation LoginEventEmitterManager
RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(login:(NSDictionary *)userInfo) {
  NSLog(@"userInfo: %@",userInfo);
}

RCT_EXPORT_METHOD(popToNative) {
  UINavigationController *vc = (UINavigationController *)[UIApplication sharedApplication].keyWindow.rootViewController;
  
  [vc popViewControllerAnimated:true];
}

// MARK: - 发送通知
+ (void)loginSuccess:(NSDictionary *)userInfo {
  [[NSNotificationCenter defaultCenter] postNotificationName:UCALoginSuccessNotification object:self userInfo:@{@"userInfo": userInfo}];
}

// MARK: - 通知处理
- (void)handleLoginSuccess:(NSNotification *)notification {
  [self sendEventWithName:kLoginSuccessEvent body:notification.userInfo];
}

// MARK: - 重写父类方法
- (dispatch_queue_t)methodQueue
{
  return dispatch_get_main_queue();
}

- (NSArray<NSString *> *)supportedEvents
{
  return @[kLoginSuccessEvent];
}

- (void)startObserving
{
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleLoginSuccess:) name:UCALoginSuccessNotification object:nil];
}

- (void)stopObserving
{
  [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
