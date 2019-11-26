//
//  AppDelegate.m
//  demo
//
//  Created by wiley on 2019/11/22.
//  Copyright © 2019 wiley. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    ViewController *rootVC = [[ViewController alloc] init];
//    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:rootVC];
    self.window.rootViewController = rootVC;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}



@end
