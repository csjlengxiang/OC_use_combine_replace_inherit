//
//  trackingAbleDefaultImp.h
//  testTrackngAble
//
//  Created by sijiechen3 on 16/9/19.
//  Copyright © 2016年 sijiechen3. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SPTrackingAbleProtocol.h"
#import "UIViewController+Tracking.h"

@defs(SPTrackingAbleProtocol)

- (NSString *)trackingTitle {
    return @"custom title";
}

- (void)pageLoad:(UIViewController *)vc {
    vc.tracking_pageLoadDate = [NSDate date];
    NSLog(@"%@ page load", [self trackingTitle]);
}

- (void)pageEnd:(UIViewController *)vc {
    NSTimeInterval d = [[NSDate date] timeIntervalSince1970] - [vc.tracking_pageLoadDate timeIntervalSince1970];
    NSLog(@"%@ page eend, and time is: %lf", [self trackingTitle], d);
}

@end
