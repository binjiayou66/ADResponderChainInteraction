//
//  ViewControllerEventProxy.h
//  ResponderChain
//
//  Created by Andy on 2017/9/28.
//  Copyright © 2017年 Andy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIResponder+ADResponderEventRouter.h"

extern NSString * const kAViewTouched;
extern NSString * const kBViewTouched;
extern NSString * const kCViewTouched;

@interface ViewControllerEventProxy : NSObject <UIResponderADRouterEventProxyDelegate>

@end
