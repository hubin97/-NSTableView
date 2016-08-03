//
//  AppDelegate.m
//  NSTableView-MacOSX04
//
//  Created by liyonghu on 16/8/3.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "AppDelegate.h"
#import "MainWindowController.h"

@interface AppDelegate ()
@property (strong) MainWindowController *mainWc;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
#warning 窗口不能显示
    //MainWindowController * _mainWc = [[MainWindowController alloc]initWithWindowNibName:@"MainWindowController"];
    //[mainWc showWindow:mainWc.window];

#warning 正确姿势, 定义为属性
    _mainWc = [[MainWindowController alloc]initWithWindowNibName:@"MainWindowController"];
    
    if (![_mainWc.window isVisible])
    {
        //视图居中展示, 注意(只在正常close时才有效,crash,强制退出或是Xcode终止,都会在下次运行时,在上次的位置显示)
        [_mainWc.window center];
        [_mainWc showWindow:_mainWc.window];
    }
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
