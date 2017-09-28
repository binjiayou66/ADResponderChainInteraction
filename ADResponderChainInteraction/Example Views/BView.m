//
//  BView.m
//  ResponderChain
//
//  Created by Andy on 2017/9/28.
//  Copyright © 2017年 Andy. All rights reserved.
//

#import "BView.h"
#import "CView.h"
#import "UIResponder+ADResponderEventRouter.h"

NSString * const kBViewTouched = @"BViewTouched";

@implementation BView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor orangeColor];
        
        [self addSubview:[[CView alloc] initWithFrame:CGRectMake(10, 10, 100, 100)]];
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // 上抛自身事件
    [super ad_routerEventWithName:kBViewTouched userInfo:@{@"key":@"BViewTouched"}];
}

- (void)ad_routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo
{
    // 上抛子视图事件
    [super ad_routerEventWithName:eventName userInfo:userInfo];
}

@end
