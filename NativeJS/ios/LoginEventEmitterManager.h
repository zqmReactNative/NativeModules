//
//  LoginEventEmitterManager.h
//  NativeJS
//
//  Created by laznrbfe on 17/3/12.
//  Copyright © 2017年 Ucacc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <React/RCTEventEmitter.h>
#import <React/RCTBridgeModule.h>

@interface LoginEventEmitterManager : RCTEventEmitter<RCTBridgeModule>

+ (void)loginSuccess:(NSDictionary *)userInfo;

@end
