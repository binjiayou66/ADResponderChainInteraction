//
//  ViewController.m
//  ResponderChain
//
//  Created by Andy on 2017/9/28.
//  Copyright © 2017年 Andy. All rights reserved.
//

#import "ViewController.h"
#import "AView.h"
#import "UIResponder+ADResponderEventRouter.h"
#import "ViewControllerEventProxy.h"

@interface ViewController ()

@property (nonatomic, strong) ViewControllerEventProxy *eventProxy;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"NSProxy -- %@", NSStringFromClass([ViewController superclass]));
    
    [self.view addSubview:[[AView alloc] initWithFrame:CGRectMake(10, 44, 300, 300)]];
}

- (void)ad_routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo
{
    [self.eventProxy ad_proxyEventWithName:eventName userInfo:userInfo];
}

- (ViewControllerEventProxy *)eventProxy
{
    if (!_eventProxy) {
        _eventProxy = [[ViewControllerEventProxy alloc] init];
    }
    return _eventProxy;
}

@end
