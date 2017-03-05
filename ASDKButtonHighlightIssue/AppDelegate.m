//
//  AppDelegate.m
//  ASDKButtonHighlightIssue
//
//  Created by DNosov on 05.03.17.
//  Copyright © 2017 Kuluum. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    UINavigationController *navigationViewController = [[UINavigationController alloc] initWithRootViewController:[[ViewController alloc]init]];
    self.window.rootViewController = navigationViewController;
    [self.window makeKeyAndVisible];
    return YES;
}



@end
