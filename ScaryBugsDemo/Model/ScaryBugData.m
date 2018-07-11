//
//  ScaryBugData.m
//  ScaryBugsDemo
//
//  Created by liyu on 2018/1/26.
//  Copyright © 2018年 liyu. All rights reserved.
//

#import "ScaryBugData.h"

@implementation ScaryBugData

- (instancetype)initWithTitle:(NSString *)title Rating:(float)rating {
    if (self = [super init]) {
        self.title = title;
        self.rating = rating;
    }
    return self;
}

@end
