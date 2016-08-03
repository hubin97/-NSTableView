//
//  NewdeviceCell.h
//  NSTableView-MacOSX04
//
//  Created by liyonghu on 16/8/3.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface LanSearchCell : NSTableCellView

@property (strong) NSTextField *newdeviceText;
@property (strong) NSTextField *channelDvrText;
@property (strong) NSButton *addBtn;

-(void)layoutWithNewDevice:(NSString *)newdevice andChannelDVR:(NSString *)channelDvr;

@end
