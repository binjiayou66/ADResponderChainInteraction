//
//  UIResponder+ADResponderEventRouter.h
//  ResponderChain
//
//  Created by Andy on 2017/9/28.
//  Copyright © 2017年 Andy. All rights reserved.
//
//  Referred to Casa Taloyum https://casatwy.com/responder_chain_communication.html
//

#import <UIKit/UIKit.h>

/// Inline function to create simple invocation instance.
static inline NSInvocation *ADEventRouterCreateInvocation(Class cls, id target, SEL selector) {
    NSMethodSignature  *signature = [cls instanceMethodSignatureForSelector:selector];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    invocation.target = target;
    invocation.selector = selector;
    
    return invocation;
}

@protocol UIResponderADRouterEventProxyDelegate <NSObject>

/// Event router delegate method
/**
 For your convenience, if there are too many events to deal with, you can create a dictionary whose key is event name and value is NSInvocation instance created by function "ADEventRouterCreateInvocation" above.
 
 e.g.
 NSDictionary *eventStrategy = @{
     AEventName : ADEventRouterCreateInvocation(cls, target, ASelector),
     BEventName : ADEventRouterCreateInvocation(cls, target, BSelector),
     CEventName : ADEventRouterCreateInvocation(cls, target, CSelector),
 };
 
 If you use strategy mode like above, the implement of ad_proxyEventWithName:userInfo: is very simple as below.
 
 - (void)ad_proxyEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo
 {
     NSInvocation *invocation = self.eventStrategy[eventName];
     [invocation setArgument:&userInfo atIndex:2];
     [invocation invoke];
 }
 */
- (void)ad_proxyEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo;

@end

@interface UIResponder (ADResponderEventRouter)

/// Instance interaction in response chains
/**
 Before using this method, you must ensure that the current object is in the response chain.
 e.g.
 Suppose we have three views, aView, bView, cView. And aView is parent view of bView, bView is parent view of cView.
 When cView is touched by user, cView pass the event to its parent view bView. You can do like below.
 
 - (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
 {
     // Method ad_routerEventWithName:userInfo: will find cView's next responder (that is its parent view), and if next responder can response to ad_routerEventWithName:userInfo:, that method will be called.
     [self ad_routerEventWithName:kCViewTouched userInfo:@{@"key":@"value"}];
 }
 
 If you want to catch that event in bView, you can implement the method "ad_routerEventWithName:userInfo:" in bView
 
 - (void)ad_routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo
 {
     // Catch cView event at here.
     // Do somethings you want.
 
     // If you want to pass event to bView's parent view, you can call this method with super keyword.
     [super ad_routerEventWithName:eventName userInfo:userInfo];
 }
 */
- (void)ad_routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo;

@end


