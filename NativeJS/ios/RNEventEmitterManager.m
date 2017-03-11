//
//  RNEventEmitterManager.m
//  NativeJS
//
//  Created by 众陶联众陶联 on 17/3/11.
//  Copyright © 2017年 Facebook. All rights reserved.
//

#import "RNEventEmitterManager.h"

#import <React/RCTEventDispatcher.h>
#import <React/RCTRootView.h>
#import <React/RCTBridge.h>


NSString *const UCALoginSuccessNotification = @"LoginSuccessNotification";

NSString *const kLoginSuccessEvent = @"kLoginSuccessEvent";

@implementation RNEventEmitterManager
{
  bool hasListeners;
}
RCT_EXPORT_MODULE();



+ (void)loginSuccess:(NSDictionary *)userInfo {
  [[NSNotificationCenter defaultCenter] postNotificationName:UCALoginSuccessNotification object:self userInfo:@{@"userInfo": userInfo}];
}


//@synthesize bridge = _bridge;

- (dispatch_queue_t)methodQueue
{
  return dispatch_get_main_queue();
}

- (void)startObserving
{
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleLoginSuccess:) name:UCALoginSuccessNotification object:nil];
}

- (void)stopObserving
{
  [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (NSArray<NSString *> *)supportedEvents
{
  return @[kLoginSuccessEvent];
}


- (void)calendarEventReminderReceived:(NSNotification *)notification
{
  NSString *eventName = notification.userInfo[@"userInfo"];
  [self sendEventWithName:kLoginSuccessEvent body:@{@"userInfo": eventName}];
}

- (void)handleLoginSuccess:(NSNotification *)notification {
  [self sendEventWithName:kLoginSuccessEvent body:notification.userInfo];
}



@end
