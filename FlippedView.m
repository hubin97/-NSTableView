//
//  FlippedView.m
//  P2PCamMac
//
//  Created by liyonghu on 16/7/29.
//  Copyright © 2016年 Jim. All rights reserved.
//

#import "FlippedView.h"

@implementation FlippedView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (BOOL) isFlipped
{
    return YES;
}

@end
