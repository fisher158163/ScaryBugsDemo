//
//  ScaryBugsDoc.m
//  ScaryBugsDemo
//
//  Created by liyu on 2018/1/26.
//  Copyright © 2018年 liyu. All rights reserved.
//

#import "ScaryBugsDoc.h"

@implementation ScaryBugsDoc

- (instancetype)initWithTitle:(NSString *)title Rating:(float)rating ThumbImage:(NSImage *)thumbImage FullImage:(NSImage *)fullImage {
    if (self = [super init]) {
        self.data = [[ScaryBugData alloc]initWithTitle:title Rating:rating];
        self.thumbImage = thumbImage;
        self.fullImage = fullImage;
    }
    return self;
}

@end
