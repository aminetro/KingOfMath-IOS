//
//  AppDelegate.m
//  timer
//
//  Created by qwerty on 11/1/15.
//  Copyright © 2015 qwerty. All rights reserved.
//

#import "AppDelegate.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    UIStoryboard *storybord =[self grabStoryboard];
    
    self.window.rootViewController=[storybord instantiateInitialViewController];
    [self.window makeKeyAndVisible];
    [Parse enableLocalDatastore];
    
    // Initialize Parse.
    [Parse setApplicationId:@"HxQ3okETLaYRaP8uJSFiBdMgMkiQlKshpZe6TYa3"
                  clientKey:@"luZcvzmphwNTVml9Mf0iPcRxaunxODz8R8nKpIUh"];
    
    // [Optional] Track statistics around application opens.
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    
    
    // Override point for customization after application launch.
    [[FBSDKApplicationDelegate sharedInstance] application:application didFinishLaunchingWithOptions:launchOptions];
    
    return YES;
}
- (UIStoryboard *)grabStoryboard {
    
    // determine screen size
    int screenHeight = [UIScreen mainScreen].bounds.size.height;
    UIStoryboard *storyboard;
    
    switch (screenHeight) {
            
            // iPhone 4s
        case 480:
            storyboard = [UIStoryboard storyboardWithName:@"Main-4s" bundle:nil];NSLog(@"4S");
            break;
            
            // iPhone 5s
        case 568:
            storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];NSLog(@"5S");
            break;
            
            // iPhone 6
        case 667:
            storyboard = [UIStoryboard storyboardWithName:@"Main-6" bundle:nil];NSLog(@"6S");
            break;
            
            // iPhone 6 Plus
        case 736:
            storyboard = [UIStoryboard storyboardWithName:@"Main-6-plus" bundle:nil];NSLog(@"6S+");
            break;
            
        default:
            // it's an iPad
            storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];NSLog(@"default");
            break;
    }
    
    return storyboard;
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


- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [[FBSDKApplicationDelegate sharedInstance] application:application
                                                          openURL:url
                                                sourceApplication:sourceApplication
                                                       annotation:annotation
            ];
}

@end
