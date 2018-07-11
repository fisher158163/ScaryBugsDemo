//
//  ScaryBugData.h
//  ScaryBugsDemo
//
//  Created by liyu on 2018/1/26.
//  Copyright © 2018年 liyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ScaryBugData : NSObject
// bug 的名称
@property(nonatomic, strong)NSString *title;
// bug的重要程度
@property(nonatomic, assign)float rating;

- (instancetype)initWithTitle:(NSString *)title Rating:(float)rating;

@end
