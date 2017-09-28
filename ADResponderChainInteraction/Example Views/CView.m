//
//  CView.m
//  ResponderChain
//
//  Created by Andy on 2017/9/28.
//  Copyright © 2017年 Andy. All rights reserved.
//

#import "CView.h"
#import "UIResponder+ADResponderEventRouter.h"

NSString * const kCViewTouched = @"CViewTouched";

@implementation CView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor blueColor];
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // 上抛自身事件
    [super ad_routerEventWithName:kCViewTouched userInfo:@{@"key":@"CViewTouched"}];
}

@end
