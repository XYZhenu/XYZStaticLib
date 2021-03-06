//
//  NSDate+Category.h
//  XYZCollection
//
//  Created by xieyan on 15/4/1.
//  Copyright (c) 2015年 xieyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (NSDateCategory)
-(NSString*)xyzDate:(NSString*)formate;
-(NSString*)xyzDate;
-(NSString*)xyzTime;

+(instancetype)dateWithYear:(NSInteger)year Month:(NSInteger)month Day:(NSInteger)day Hour:(NSInteger)hour Minute:(NSInteger)minute;
-(NSDate*)weekDayFromNow:(NSInteger)weekday;

-(NSInteger)weekDay;

@end
