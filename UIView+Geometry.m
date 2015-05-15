//
//  UIView+Geometry.m
//  XYZCollection
//
//  Created by xieyan on 15/3/31.
//  Copyright (c) 2015年 xieyan. All rights reserved.
//

#import "UIView+Geometry.h"
@implementation UIView (XYZGeometry)

-(CGFloat)getXyzWidth{
    return self.frame.size.width;
}
-(void)setXyzWidth:(CGFloat)xyzWidth{
    self.frame=CGRectMake(self.frame.origin.x, self.frame.origin.y, xyzWidth, self.frame.size.height);
}



-(CGFloat)getXyzHeight{
    return self.frame.size.height;
}
-(void)setXyzHeight:(CGFloat)xyzHeight{
    self.frame=CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width,xyzHeight);
}




-(void)setXyzX:(CGFloat)xyzX{
    self.frame=CGRectMake(xyzX, self.frame.origin.y, self.frame.size.width,self.frame.size.height);
}
-(CGFloat)getXyzX{
    return self.frame.origin.x;
}




-(void)setXyzY:(CGFloat)xyzY{
    self.frame=CGRectMake(self.frame.origin.x, xyzY, self.frame.size.width,self.frame.size.height);
}
-(CGFloat)getXyzY{
    return self.frame.origin.y;
}






-(void)setXyzX1:(CGFloat)xyzX1{
    self.frame=CGRectMake(xyzX1-self.frame.size.width, self.frame.origin.y, self.frame.size.width,self.frame.size.height);
}
-(CGFloat)getXyzX1{
    return self.frame.origin.x+self.frame.size.width;
}




-(void)setXyzY1:(CGFloat)xyzY1{
    self.frame=CGRectMake(self.frame.origin.x, xyzY1, self.frame.size.width,self.frame.size.height);
}
-(CGFloat)getXyzY1{
    return self.frame.origin.y;
}







-(void)setXyzX2:(CGFloat)xyzX2{
    self.frame=CGRectMake(xyzX2, self.frame.origin.y, self.frame.size.width,self.frame.size.height);
}
-(CGFloat)getXyzX2{
    return self.frame.origin.x;
}




-(void)setXyzY2:(CGFloat)xyzY2{
    self.frame=CGRectMake(self.frame.origin.x, xyzY2-self.frame.size.height, self.frame.size.width,self.frame.size.height);
}
-(CGFloat)getXyzY2{
    return self.frame.origin.y+self.frame.size.height;
}






-(void)setXyzX3:(CGFloat)xyzX3{
    self.frame=CGRectMake(xyzX3-self.frame.size.width, self.frame.origin.y, self.frame.size.width,self.frame.size.height);
}
-(CGFloat)getXyzX3{
    return self.frame.origin.x+self.frame.size.width;
}




-(void)setXyzY3:(CGFloat)xyzY3{
    self.frame=CGRectMake(self.frame.origin.x, xyzY3-self.frame.size.height, self.frame.size.width,self.frame.size.height);
}
-(CGFloat)getXyzY3{
    return self.frame.origin.y+self.frame.size.height;
}





-(void)setXyzXcentral:(CGFloat)xyzXcentral{
    self.center = CGPointMake(xyzXcentral, self.center.y);
}
-(CGFloat)getXyzXcentral{
    return self.center.x;
}


-(void)setXyzYcentral:(CGFloat)xyzYcentral{
    self.center = CGPointMake(self.center.x,xyzYcentral);
}
-(CGFloat)getXyzYcentral{
    return self.center.y;
}


-(void)xyzSetBoundsWidth:(CGFloat)width Height:(CGFloat)height{
    self.bounds=CGRectMake(0, 0, width, height);
}
-(void)xyzSetCenterX:(CGFloat)X Y:(CGFloat)Y{
    self.center=CGPointMake(X, Y);
}

@end

