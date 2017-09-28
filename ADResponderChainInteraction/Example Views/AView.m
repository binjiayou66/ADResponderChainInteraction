//
//  AView.m
//  ResponderChain
//
//  Created by Andy on 2017/9/28.
//  Copyright © 2017年 Andy. All rights reserved.
//

#import "AView.h"
#import "BView.h"
#import "UIResponder+ADResponderEventRouter.h"

NSString * const kAViewTouched = @"AViewTouched";

@implementation AView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor redColor];
        
        [self addSubview:[[BView alloc] initWithFrame:CGRectMake(10, 10, 200, 200)]];
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // 上抛自身事件
    [super ad_routerEventWithName:kAViewTouched userInfo:@{@"key":@"AViewTouched"}];
}

- (void)ad_routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo
{
    // 上抛子视图事件
    [super ad_routerEventWithName:eventName userInfo:userInfo];
}

@end
