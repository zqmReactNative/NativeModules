//
//  RNEventEmitterManager.h
//  NativeJS
//
//  Created by 众陶联众陶联 on 17/3/11.
//  Copyright © 2017年 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <React/RCTEventEmitter.h>
#import <React/RCTBridgeModule.h>

@interface RNEventEmitterManager : RCTEventEmitter<RCTBridgeModule>
+ (void)loginSuccess:(NSDictionary *)userInfo;
@end
