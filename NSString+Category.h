//
//  NSString+Category.h
//  XYZCollection
//
//  Created by xieyan on 15/3/31.
//  Copyright (c) 2015年 xieyan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface NSString (Category)
+(NSString*)intString:(NSInteger)number;
+(NSString*)floatString:(CGFloat)number;

-(NSString*)addIntNum:(NSInteger)number;
-(NSString*)addFloatNum:(CGFloat)number;
-(NSString*)addStringIntNum:(NSString*)number;
-(NSString*)addStringFloatNum:(NSString*)number;



-(BOOL) isBlank;
-(NSString *)valideStr;



-(CGFloat)wideWithFont:(NSInteger)font;
-(CGFloat)heightWithWidth:(CGFloat)width Font:(NSInteger)font;
-(CGFloat)xyzHeightWithWidth:(CGFloat)width Font:(NSInteger)font ParagraphStyle:(NSMutableParagraphStyle*(^)(NSMutableParagraphStyle*))paragraph;
@end
