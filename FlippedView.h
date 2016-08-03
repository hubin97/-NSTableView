//
//  FlippedView.h
//  P2PCamMac
//
//  Created by liyonghu on 16/7/29.
//  Copyright © 2016年 Jim. All rights reserved.
//

#import <Cocoa/Cocoa.h>
/**
  1;坐标上下颠倒,与iPhone适配保持一致
  2;通过覆盖视图的isFlipped方法,强制视图坐标系原点为左上角位置.
*/
@interface FlippedView : NSView

@end
