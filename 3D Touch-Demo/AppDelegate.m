//
//  AppDelegate.m
//  3D Touch-Demo
//
//  Created by 郭艾超 on 16/5/22.
//  Copyright © 2016年 Steven. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //创建应用图标上的3D touch快捷选项
    [self addShortcutItem];
    return YES;
}

- (void)addShortcutItem {
    //创建系统风格的icon
    UIApplicationShortcutIcon *icon1 = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeSearch];
    
    UIApplicationShortcutIcon *icon2 = [UIApplicationShortcutIcon iconWithTemplateImageName:@"icon_2"];
    //创建快捷选项
    UIApplicationShortcutItem * item1 = [[UIApplicationShortcutItem alloc]initWithType:@"NSLog-ok" localizedTitle:@"系统图标" localizedSubtitle:nil icon:icon1 userInfo:nil];
    
    UIApplicationShortcutItem * item2 = [[UIApplicationShortcutItem alloc]initWithType:@"NSLog-hello" localizedTitle:@"自定义图标" localizedSubtitle:nil icon:icon2 userInfo:nil];
    
    //添加到快捷选项数组
    [UIApplication sharedApplication].shortcutItems = @[item1,item2];
}

- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler {
    
    //根据不同标识执行不同操作
    if([shortcutItem.type isEqualToString:@"NSLog-ok"]){
        
        NSLog(@"ok");
    }
    if([shortcutItem.type isEqualToString:@"NSLog-hello"]){
        
        NSLog(@"hello");
    }
    if (completionHandler) {
        completionHandler(YES);
    }
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

@end
