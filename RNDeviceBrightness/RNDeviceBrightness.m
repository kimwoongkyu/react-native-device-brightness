//
//  RNDeviceBrightness.m
//  RNDeviceBrightness
//
//  Created by Calvin on 3/11/17.
//  Copyright © 2017 CapsLock. All rights reserved.
//

#import "RNDeviceBrightness.h"

@implementation RNDeviceBrightness

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(setBrightnessLevel:(float)brightnessLevel)
{
    /*
     2019.11.01 edited by woogie.kim
     Xcode11 iPhone11 이상 계열에서 main thread violation exception이 발생하기 때문에 queue 직렬화로 처리
     */
    dispatch_sync(dispatch_get_main_queue(), ^{
        [UIScreen mainScreen].brightness = brightnessLevel;
    });
}

RCT_REMAP_METHOD(getBrightnessLevel,
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
    /*
     2019.11.01 edited by woogie.kim
     Xcode11 iPhone11 이상 계열에서 main thread violation exception이 발생하기 때문에 queue 직렬화로 처리
     */
    dispatch_sync(dispatch_get_main_queue(), ^{
        resolve(@([UIScreen mainScreen].brightness));
    });
}

@end
