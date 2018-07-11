//
//  ScaryBugsDoc.h
//  ScaryBugsDemo
//
//  Created by liyu on 2018/1/26.
//  Copyright © 2018年 liyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ScaryBugData.h"

@interface ScaryBugsDoc : NSObject
// data
@property(nonatomic, strong)ScaryBugData *data;
// 小图
@property(nonatomic, strong)NSImage *thumbImage;
// 大图
@property(nonatomic, strong)NSImage *fullImage;

- (instancetype)initWithTitle:(NSString *)title Rating:(float)rating ThumbImage:(NSImage *)thumbImage FullImage:(NSImage *)fullImage;

@end
