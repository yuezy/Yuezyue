//
//  AppDelegate.m
//  YuezyEvil
//
//  Created by ZhangYue on 2016/11/30.
//  Copyright © 2016年 yuezy. All rights reserved.
//

#import "AppDelegate.h"
#import "BaseNavigationViewController.h"
#import "BaseViewController.h"
#import "ViewController.h"
#import "UITabBarItem+Universal.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //init view
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window makeKeyAndVisible];
    [self initTabBarView];
    self.window.rootViewController = self.tabBarViewController;
    self.window.backgroundColor = [UIColor whiteColor];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - initTabBarView
- (void)initTabBarView {
    BaseNavigationViewController *homeController = [[BaseNavigationViewController alloc] initWithRootViewController:[[ViewController alloc] init]];
    homeController.tabBarItem = [UITabBarItem itemWithTitle:@"火箭" image:[UIImage imageNamed:@"rocket.png"] selectedImage:[UIImage imageNamed:@"rocketSelected.png"]];
    
    BaseNavigationViewController *investListController = [[BaseNavigationViewController alloc] initWithRootViewController:[[ViewController alloc] init]];
    investListController.tabBarItem = [UITabBarItem itemWithTitle:@"卫星" image:[UIImage imageNamed:@"satellite.png"] selectedImage:[UIImage imageNamed:@"satelliteSelceted.png"]];
    
    
    BaseNavigationViewController *accountController = [[BaseNavigationViewController alloc] initWithRootViewController:[[ViewController alloc] init]];
    accountController.tabBarItem = [UITabBarItem itemWithTitle:@"实验" image:[UIImage imageNamed:@"testlab.png"] selectedImage:[UIImage imageNamed:@"testlabSelected.png"]];
    
    BaseNavigationViewController *moreController = [[BaseNavigationViewController alloc] initWithRootViewController:[[ViewController alloc] init]];
    moreController.tabBarItem = [UITabBarItem itemWithTitle:@"更多" image:[UIImage imageNamed:@"more.png"] selectedImage:[UIImage imageNamed:@"moreSelected.png"]];
    
    self.tabBarViewController = [[UITabBarController alloc] init];
    self.tabBarViewController.delegate = self;
    self.tabBarViewController.viewControllers = [NSArray arrayWithObjects:homeController, investListController, accountController, moreController,nil];
    
    // set titleColor
    UIColor *titleHighlightedColor = [UIColor colorWithHexString:@"#EB4F38"];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       [UIColor grayColor], NSForegroundColorAttributeName,
                                                       kSTHeitiSC_11, NSFontAttributeName,
                                                       nil] forState:UIControlStateNormal];
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       titleHighlightedColor, NSForegroundColorAttributeName,
                                                       kSTHeitiSC_11, NSFontAttributeName,
                                                       nil] forState:UIControlStateSelected];
}

@end
