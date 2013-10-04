//
//  AppDelegate.m
//  TestViewDeck
//
//  Created by Haven on 3/10/13.
//  Copyright (c) 2013 LF. All rights reserved.
//

#import "AppDelegate.h"
#import "IIViewDeckController.h"
#import "Tab1ViewController.h"
#import "LeftViewController.h"
#import "RightViewController.h"
#import "CenterViewController.h"
#import "Tab3ViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7) {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    }
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"navbar_bg"] forBarMetrics:UIBarMetricsDefault];
    

    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    Tab1ViewController *tab1 = [[Tab1ViewController alloc] init];
    tab1.title = @"General";
    
    LeftViewController *left = [[LeftViewController alloc] init];
    UINavigationController *lNav = [[UINavigationController alloc] initWithRootViewController:left];
    
    CenterViewController *center = [[CenterViewController alloc] init];
    UINavigationController *cNav = [[UINavigationController alloc] initWithRootViewController:center];
    
    RightViewController *right = [[RightViewController alloc] init];
    UINavigationController *rNav = [[UINavigationController alloc] initWithRootViewController:right];
    
    IIViewDeckController *tab2 = [[IIViewDeckController alloc] initWithCenterViewController:cNav leftViewController:lNav rightViewController:rNav topViewController:nil bottomViewController:nil];
    tab2.panningMode = IIViewDeckFullViewPanning;
    tab2.rightSize = 44;
    tab2.openSlideAnimationDuration = 0.6;
    tab2.closeSlideAnimationDuration = 0.6;
    tab2.title = @"Deck";
    
    Tab3ViewController *tab3 = [[Tab3ViewController alloc] init];
    tab3.title = @"Table";
    
    UITabBarController *tabvc = [[UITabBarController alloc] init];
    [tabvc.tabBar setBackgroundImage:[UIImage imageNamed:@"tab_bar_bg_1"]];
    tabvc.viewControllers = @[tab1, tab2, tab3];
    
    
    self.window.rootViewController = tabvc;
    
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
