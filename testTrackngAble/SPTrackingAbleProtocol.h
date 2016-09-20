//
//  trackingAbleProtocol.h
//  testTrackngAble
//
//  Created by sijiechen3 on 16/9/19.
//  Copyright © 2016年 sijiechen3. All rights reserved.
//

#import "ProtocolKit.h"

@protocol SPTrackingAbleProtocol <NSObject>

@required
- (NSString *)trackingTitle;

@optional

- (void)pageLoad:(UIViewController *)vc;
- (void)pageEnd:(UIViewController *)vc;

//- (void)pageLoad:(UIViewController *)vc;
//- (void)pageEnd:(UIViewController *)vc;

@end
