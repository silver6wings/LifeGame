//
//  LifeAppDelegate.h
//  Life
//
//  Created by YC on 11-4-2.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LifeViewController;

@interface LifeAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow * window;
    LifeViewController * viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet LifeViewController *viewController;

@end
