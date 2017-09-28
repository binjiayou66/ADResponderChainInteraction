//
//  UIResponder+ADResponderEventRouter.m
//  ResponderChain
//
//  Created by Andy on 2017/9/28.
//  Copyright © 2017年 Andy. All rights reserved.
//

#import "UIResponder+ADResponderEventRouter.h"

@implementation UIResponder (ADResponderEventRouter)

- (void)ad_routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo
{
    if ([[self nextResponder] respondsToSelector:@selector(ad_routerEventWithName:userInfo:)]) {
        [[self nextResponder] ad_routerEventWithName:eventName userInfo:userInfo];
    }
}

@end
