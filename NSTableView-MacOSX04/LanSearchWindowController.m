//
//  LanSearchWindowController.m
//  NSTableView-MacOSX04
//
//  Created by liyonghu on 16/8/3.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "LanSearchWindowController.h"
#import "LanSearchCell.h"

@interface LanSearchWindowController ()<NSTableViewDataSource,NSTableViewDelegate>
{
    NSMutableArray *_dataSoruce;
}
@end

@implementation LanSearchWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.

    self.window.contentView.wantsLayer = YES;

    _dataSoruce = [NSMutableArray arrayWithArray:@[@"ZFHDUWR2EYZN846XPZEJ",@"GVYC6E4E5CBEPDKA111A",@"H16WCF4ZCC5VAU38111A",@"GX3SBN7XS1M4551E111A",@"ZPJJJBCT157F9UVB111A",@"E1YAAD5WRTVC8N6GUHM1",@"ZFHDUWR2EYZN846XPZEJ",@"GVYC6E4E5CBEPDKA111A",@"H16WCF4ZCC5VAU38111A",@"GX3SBN7XS1M4551E111A",@"ZPJJJBCT157F9UVB111A",@"E1YAAD5WRTVC8N6GUHM1"]];

#warning 必须设置scrollview,否则超出页面无法滚动
    _myScrollView = [[NSScrollView alloc] initWithFrame:NSMakeRect(0, 0, self.window.frame.size.width, self.window.frame.size.height)];
    [_myScrollView setAutoresizesSubviews:YES];
    
    _myTableView  = [[NSTableView alloc] initWithFrame:NSMakeRect(0, 0, self.window.frame.size.width, self.window.frame.size.height)];

    [_myTableView setAutosaveName:@"downloadTableView"];

    //NSTableHeaderView *tableHeadView=[[NSTableHeaderView alloc] initWithFrame:NSMakeRect(0, 548, 480, 20)];
    //[_myTableView setHeaderView:tableHeadView];
    
    [_myTableView setAutoresizesSubviews:YES];
    //[_myTableView setBackgroundColor:[NSColor whiteColor]];
    
//    [_myTableView setGridColor:[NSColor clearColor]];
    [_myTableView setGridStyleMask: NSTableViewSolidHorizontalGridLineMask];
    [_myTableView setAutosaveTableColumns:YES];
    //        [_downloadTable setAllowsEmptySelection:NO];
    [_myTableView setAllowsColumnSelection:NO];
    [_myTableView setAllowsColumnResizing:NO];
    [_myTableView setAllowsColumnReordering:NO];
    [_myTableView setSelectionHighlightStyle:1];
    [_myTableView setRowSizeStyle:NSTableViewRowSizeStyleMedium];
    
    //NSView *footView = [[NSView alloc]initWithFrame:NSZeroRect];

    
    
    _myTableView.dataSource = self;
    _myTableView.delegate = self;
    
    [_myScrollView setDocumentView:_myTableView];
    [self.window.contentView addSubview:_myScrollView];

    
//#define keyColumnPrefix @"YouColumn"
//    //[self addColumn:keyColumnPrefix"1" withTitle:@"column1"];
//    [self addColumn:keyColumnPrefix"1" withTitle:@"lan search"];

    NSTableColumn *column=[[NSTableColumn alloc] initWithIdentifier:@"lanSearchColumn"];
    
    [[column headerCell] setStringValue:@"Lan search"];
    [[column headerCell] setAlignment:NSCenterTextAlignment];
    [column setWidth:self.window.frame.size.width];  //必须固定值

    [column setMinWidth:self.window.frame.size.width];
    [column setEditable:NO];
    [column setResizingMask:NSTableColumnAutoresizingMask | NSTableColumnUserResizingMask];
    [_myTableView addTableColumn:column];
    

}
- (void)addColumn:(NSString*)newid withTitle:(NSString*)title
{
    NSInteger columnNum = [newid intValue];
    
    NSTableColumn *column=[[NSTableColumn alloc] initWithIdentifier:newid];
    [[column headerCell] setStringValue:title];
    [[column headerCell] setAlignment:NSCenterTextAlignment];
    [[column headerCell] setBackgroundColor:[NSColor clearColor]];
    
    if(columnNum == 1){
        [column setWidth:self.window.frame.size.width];  //必须固定值
    }
//    }else if(columnNum == 2) {
//        [column setWidth:150];
//    }else if(columnNum == 3) {
//        [column setWidth:130];
//    }
    [column setMinWidth:self.window.frame.size.width];
    [column setEditable:NO];
    [column setResizingMask:NSTableColumnAutoresizingMask | NSTableColumnUserResizingMask];
    [_myTableView addTableColumn:column];
//    [column release];
}


#pragma mark ------------------------------------------- Table View DataSource ------------------------------------------------

- (NSInteger)numberOfRowsInTableView:(NSTableView *)aTableView
{
    return _dataSoruce.count;
}

#pragma mark ------------------------------------------- Table View Delegate --------------------------------------------------
- (CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row
{
    return 75;
}

-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    //    NSLog(@"clomun : %d,row : %ld",[[tableColumn identifier] intValue],row);
    
//    NSTableCellView * cell = [tableView makeViewWithIdentifier:[tableColumn identifier] owner:self];
    LanSearchCell * cell = [tableView makeViewWithIdentifier:[tableColumn identifier] owner:self];
    cell.layer.backgroundColor = [[NSColor brownColor] CGColor];

    //lanSearchColumn
//    if([[tableColumn identifier] isEqualToString:keyColumnPrefix"1"]) {
    if([[tableColumn identifier] isEqualToString:@"lanSearchColumn"]) {
    
        if (!cell)
        {
            NSLog(@"%@",[_dataSoruce objectAtIndex:row]);
            cell = [[LanSearchCell alloc]initWithFrame:NSMakeRect(0, 0, _myTableView.frame.size.width, 75)];
            [cell layoutWithNewDevice:_dataSoruce[row] andChannelDVR:[NSString stringWithFormat:@"%@-DVR",_dataSoruce[row]]];
            cell.addBtn.tag = 100 + row;
            [cell.addBtn setAction:@selector(addBtnClicked:)];
        }
    }
    return cell;
}

- (BOOL)tableView:(NSTableView *)tableView shouldSelectRow:(NSInteger)row
{
    NSLog(@"I'm allow you to select:%ld",row);
    NSLog(@"%@",[_dataSoruce objectAtIndex:row]);
    
    return YES;
}

- (void)addBtnClicked:(NSButton *)sender
{
    NSLog(@"addBtnClicked!!!,sender.tag = %ld",sender.tag);
//    LanSearchCell * cell = [_myTableView cenfor];
    NSLog(@"addBtn-uid:%@",[_dataSoruce objectAtIndex:sender.tag - 100]);

}
@end
