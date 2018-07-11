//
//  MasterViewController.m
//  ScaryBugsDemo
//
//  Created by liyu on 2018/1/26.
//  Copyright © 2018年 liyu. All rights reserved.
//

#import "MasterViewController.h"
#import "ScaryBugData.h"
#import "ScaryBugsDoc.h"
#import "EDStarRating.h"

@interface MasterViewController ()<NSTabViewDelegate, NSTableViewDataSource>

@property (weak) IBOutlet NSTableView *bugsTableView;
@property (weak) IBOutlet NSTextField *bugsTitleView;
@property (weak) IBOutlet EDStarRating *bugsRatingView;
@property (weak) IBOutlet NSImageView *bugsImageView;
@property (weak) IBOutlet NSButton *deleteButton;
@property (weak) IBOutlet NSButton *changePictureButton;

@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 初始化设置EDStarRaing .
    self.bugsRatingView.starImage = [NSImage imageNamed:@"star.png"];
    self.bugsRatingView.starHighlightedImage = [NSImage imageNamed:@"shockedface2_full.png"];
    self.bugsRatingView.starImage = [NSImage imageNamed:@"shockedface2_empty.png"];
    self.bugsRatingView.maxRating = 5.0;
    self.bugsRatingView.delegate = (id<EDStarRatingProtocol>) self;
    self.bugsRatingView.horizontalMargin = 2;
    self.bugsRatingView.editable=YES;
    self.bugsRatingView.displayMode = EDStarRatingDisplayFull;
    self.bugsRatingView.rating = 0.0;
    self.bugsRatingView.editable = NO;
}

// 获取选中的数据模型
- (ScaryBugsDoc *)selectedBugDoc{
    NSInteger selectedRow = [self.bugsTableView selectedRow];     // 获取table view 的选中行号
    if (selectedRow >= 0 && self.bugs.count  > selectedRow) {
        ScaryBugsDoc *selectedBug = [self.bugs objectAtIndex:selectedRow];
        return selectedBug;
    }
    return nil;
}

// 这个方法，根据数据设置视图信息
- (void)setDetailInfo:(ScaryBugsDoc *)doc {
    NSString *title = @"";        // 初始化为空字符串
    NSImage *image = nil;    // 初始化为空值
    float rating = 0.0;                      // 初始化默认值为0
    if(doc != nil) {    // 如果有数据
        title = doc.data.title;
        image = doc.fullImage;
        rating = doc.data.rating;
    }
    [self.bugsTitleView setStringValue:title];    // 设置显示的标题
    [self.bugsImageView setImage:image];         // 设置显示的图片
    [self.bugsRatingView setRating:rating];     // 设置评分
}

// table view 选中一行的时候，会调用这个方法
- (void)tableViewSelectionDidChange:(NSNotification *)notification{
    // 获取选中的数据
    ScaryBugsDoc *selectedDoc = [self selectedBugDoc];
    // 根据数据，设置详情视图内容
    [self setDetailInfo:selectedDoc];
    // Enable/Disable buttons based on selection
    BOOL buttonsEnabled = (selectedDoc!=nil);
    [self.deleteButton setEnabled:buttonsEnabled];
    [self.changePictureButton setEnabled:buttonsEnabled];
    [self.bugsRatingView setEditable:buttonsEnabled];
    [self.bugsTitleView setEnabled:buttonsEnabled];
}

// 这个方法返回列表的行数 : 类似于iOS中的numberOfRowsInSection:
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
   // return 25;
    return self.bugs.count;
}

// 这个方法返回列表的cell ：参考iOS中的 cellForRowAtIndexPath:
- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    // 1.创建可重用的cell:
    NSTableCellView *cellView = [tableView makeViewWithIdentifier:tableColumn.identifier owner:self];
     // 2. 根据重用标识，设置cell 数据
    if ([tableColumn.identifier isEqualToString:@"BugColumn"]) {
        ScaryBugsDoc *bugDoc = [self.bugs objectAtIndex:row];
        cellView.imageView.image = bugDoc.thumbImage;
        cellView.textField.stringValue = bugDoc.data.title;
        return cellView;
    }
    return cellView;
}


@end
