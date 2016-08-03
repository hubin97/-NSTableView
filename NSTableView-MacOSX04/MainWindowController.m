//
//  MainWindowController.m
//  NSTableView-MacOSX04
//
//  Created by liyonghu on 16/8/3.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "MainWindowController.h"
#import "LanSearchWindowController.h"
@interface MainWindowController ()
@property (strong) LanSearchWindowController *lansearchWc;
@end

@implementation MainWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    self.window.contentView.wantsLayer = YES;
    
    
}

- (IBAction)addClicked:(id)sender {
    
    if (!_lansearchWc)
    {
        _lansearchWc = [[LanSearchWindowController alloc]initWithWindowNibName:@"LanSearchWindowController"];
    }
    [self.window addChildWindow:_lansearchWc.window ordered:NSWindowAbove];
}

@end
