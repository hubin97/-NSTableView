//
//  NewdeviceCell.m
//  NSTableView-MacOSX04
//
//  Created by liyonghu on 16/8/3.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "LanSearchCell.h"
#define kOriginx 20
#define kPadding 5

#define DrawBorderForView(uiView, cgFlot, uiColor)  {uiView.layer.borderWidth = cgFlot; uiView.layer.borderColor = [[NSColor uiColor] CGColor];}

@implementation LanSearchCell

-(void)layoutWithNewDevice:(NSString *)newdevice andChannelDVR:(NSString *)channelDvr
{
    self.wantsLayer = YES;
    self.layer.backgroundColor = [[NSColor controlColor] CGColor];

    //layout bottom -> top
    //channelDvr
    self.channelDvrText = [[NSTextField alloc]initWithFrame:
                          NSMakeRect(kOriginx, kPadding, self.frame.size.width * 3/5 - kOriginx, (self.frame.size.height - 3 *kPadding)/2)];
    [self.channelDvrText setFont:[NSFont systemFontOfSize:14]];
    [self.channelDvrText setBackgroundColor:[NSColor clearColor]];
    [self.channelDvrText setAlignment:NSTextAlignmentLeft];
    [self.channelDvrText setAutoresizesSubviews:YES];
    [self.channelDvrText setEditable:NO];
    [self.channelDvrText setSelectable:NO];
    [self.channelDvrText setStringValue:channelDvr];
    [self.channelDvrText setBezeled:NO];
    [self.channelDvrText setTextColor:[NSColor grayColor]];
    
    [self addSubview:self.channelDvrText];
    
    
    //newdevice
    self.newdeviceText = [[NSTextField alloc]initWithFrame:
                          NSMakeRect(kOriginx, kPadding + self.channelDvrText.frame.size.height, self.channelDvrText.frame.size.width, self.channelDvrText.frame.size.height)];
    [self.newdeviceText setFont:[NSFont systemFontOfSize:15.0f]];
    [self.newdeviceText setBackgroundColor:[NSColor clearColor]];
    [self.newdeviceText setAlignment:NSTextAlignmentLeft];
    [self.newdeviceText setAutoresizesSubviews:YES];
    [self.newdeviceText setEditable:NO];
    [self.newdeviceText setSelectable:NO];
    [self.newdeviceText setStringValue:newdevice];
    [self.newdeviceText setBezeled:NO];
    
    [self addSubview:self.newdeviceText];
    
    
    //add btn
    CGFloat addBtnW = self.frame.size.width * 2/5 - 3 *kPadding - kOriginx;
    CGFloat addBtnH = addBtnW/3;
    CGFloat addOriginY = (self.frame.size.height - addBtnH)/2;
    self.addBtn = [[NSButton alloc]initWithFrame:NSMakeRect(2 *kPadding + self.frame.size.width * 3/5 , addOriginY, addBtnW, addBtnH)];
    
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    [style setAlignment:NSCenterTextAlignment];
    NSMutableAttributedString *attrTitle =
    [[NSMutableAttributedString alloc] initWithString:@"Add"];
    NSUInteger len = [attrTitle length];
    NSRange range = NSMakeRange(0, len);
    [attrTitle addAttribute:NSForegroundColorAttributeName value:[NSColor redColor] range:range];
    [attrTitle addAttribute:NSParagraphStyleAttributeName value:style range:range];
    [attrTitle fixAttributesInRange:range];
    [attrTitle addAttribute:NSFontAttributeName value:[NSFont systemFontOfSize:15.0] range:range];
    [self.addBtn setAttributedTitle:attrTitle];

//失效?
//    [self.addBtn setBordered: NO];
//    self.addBtn.layer.backgroundColor = [[NSColor blueColor] CGColor];
    
    [self addSubview:self.addBtn];
}


- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

@end
