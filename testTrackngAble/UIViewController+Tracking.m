#import "UIViewController+Tracking.h"
#import <objc/runtime.h>
#import "SPTrackingAbleProtocol.h"

@implementation UIViewController (Tracking)

- (NSDate *)tracking_pageLoadDate {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setTracking_pageLoadDate:(NSDate *)date {
    objc_setAssociatedObject(self, @selector(tracking_pageLoadDate), date, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL originalSelector = @selector(viewDidAppear:);
        SEL swizzledSelector = @selector(Tracking_viewDidAppear:);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL success = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        if (success) {
            class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
        
        originalSelector = @selector(viewDidDisappear:);
        swizzledSelector = @selector(Tracking_viewDidDisappear:);
        
        originalMethod = class_getInstanceMethod(class, originalSelector);
        swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        success = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        if (success) {
            class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

- (void)Tracking_viewDidAppear:(BOOL)animated {
    [self Tracking_viewDidAppear:animated];
    if ([self conformsToProtocol:@protocol(SPTrackingAbleProtocol)]) {
        [self performSelector:@selector(pageLoad:) withObject:self];
    }
}

- (void)Tracking_viewDidDisappear:(BOOL)animated {
    [self Tracking_viewDidDisappear:animated];
    if ([self conformsToProtocol:@protocol(SPTrackingAbleProtocol)]) {
        [self performSelector:@selector(pageEnd:) withObject:self];
    }
}

@end
