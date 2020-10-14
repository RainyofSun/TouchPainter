//
//  AppDelegate.m
//  TouchPainter
//
//  Created by EGLS_BMAC on 2020/9/22.
//  Copyright © 2020 EGLS_BMAC. All rights reserved.
//

#import "AppDelegate.h"
#import "CoordinatingController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self setRootVc];
    return YES;
}

- (void)setRootVc {
    UIViewController *rootVC = [[CoordinatingController sharedInstance] activeViewController];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    self.window.rootViewController = rootVC;
}

@end
