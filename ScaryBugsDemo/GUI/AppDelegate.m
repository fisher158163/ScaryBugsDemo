//
//  AppDelegate.m
//  ScaryBugsDemo
//
//  Created by liyu on 2018/1/26.
//  Copyright © 2018年 liyu. All rights reserved.
//

#import "AppDelegate.h"
#import "MasterViewController.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;

@property (nonnull ,strong) MasterViewController *masterViewController;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // 1. 使用initWithNibName：方法从nib（就是我们创建控制器时的Xib）文件中创建了一个新的view Controller。
    self.masterViewController = [[MasterViewController alloc]initWithNibName:@"MasterViewController" bundle:nil];
    // 2. 将控制的view 添加到主窗口的容器视图（contentView）中。
    [self.window.contentView addSubview:self.masterViewController.view];
    // 3. 设置控制器view的大小与主窗口相等。
    self.masterViewController.view.frame = self.window.contentView.bounds;
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
