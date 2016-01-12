//
//  Circle.m
//  hello
//
//  Created by 丁一航 on 16/1/12.
//  Copyright © 2016年 丁一航. All rights reserved.
//

#import "Circle.h"

@implementation Circle

-(void) setRadius: (int) _radius {
    radius = _radius;
}

-(float)getArea{
    area = PI * radius * radius;
    return area;
}

@end
