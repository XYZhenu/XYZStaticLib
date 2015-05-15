//
//  UIView+Geometry.h
//  XYZCollection
//
//  Created by xieyan on 15/3/31.
//  Copyright (c) 2015年 xieyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface UIView (XYZGeometry)
@property(nonatomic,getter=getXyzWidth)CGFloat xyzWidth;
@property(nonatomic,getter=getXyzHeight)CGFloat xyzHeight;

@property(nonatomic,getter=getXyzX)CGFloat xyzX;
@property(nonatomic,getter=getXyzY)CGFloat xyzY;


@property(nonatomic,getter=getXyzX1)CGFloat xyzX1;
@property(nonatomic,getter=getXyzY1)CGFloat xyzY1;


@property(nonatomic,getter=getXyzX2)CGFloat xyzX2;
@property(nonatomic,getter=getXyzY2)CGFloat xyzY2;



@property(nonatomic,getter=getXyzX3)CGFloat xyzX3;
@property(nonatomic,getter=getXyzY3)CGFloat xyzY3;


@property(nonatomic,getter=getXyzXcentral)CGFloat xyzXcentral;
@property(nonatomic,getter=getXyzYcentral)CGFloat xyzYcentral;


-(void)xyzSetBoundsWidth:(CGFloat)width Height:(CGFloat)height;
-(void)xyzSetCenterX:(CGFloat)X Y:(CGFloat)Y;


@end
