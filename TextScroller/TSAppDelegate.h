//
//  TSAppDelegate.h
//  TextScroller
//
//  Created by Matthew Mondok on 2/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TSViewController;

@interface TSAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) TSViewController *viewController;

@end
