//
//  ViewControllerEventProxy.m
//  ResponderChain
//
//  Created by Andy on 2017/9/28.
//  Copyright © 2017年 Andy. All rights reserved.
//

#import "ViewControllerEventProxy.h"

@interface ViewControllerEventProxy()

@property (nonatomic, strong) NSDictionary *eventStrategy;

@end

@implementation ViewControllerEventProxy

- (void)ad_proxyEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo
{
    NSInvocation *invocation = self.eventStrategy[eventName];
    [invocation setArgument:&userInfo atIndex:2];
    [invocation invoke];
}

- (void)touchedAView:(NSDictionary *)userInfo
{
    NSLog(@"A ----- %@.", userInfo);
}

- (void)touchedBView:(NSDictionary *)userInfo
{
    NSLog(@"B ----- %@.", userInfo);
}

- (void)touchedCView:(NSDictionary *)userInfo
{
    NSLog(@"C ----- %@.", userInfo);
}

- (NSDictionary <NSString *, NSInvocation *> *)eventStrategy
{
    if (_eventStrategy == nil) {
        _eventStrategy = @{
                           kAViewTouched:ADEventRouterCreateInvocation([self class], self, @selector(touchedAView:)),
                           kBViewTouched:ADEventRouterCreateInvocation([self class], self, @selector(touchedBView:)),
                           kCViewTouched:ADEventRouterCreateInvocation([self class], self, @selector(touchedCView:)),
                           };
    }
    return _eventStrategy;
}

@end
