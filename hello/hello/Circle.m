//
//  Circle.m
//  hello
//
//  Created by 丁一航 on 16/1/12.
//  Copyright © 2016年 丁一航. All rights reserved.
//

#import "Circle.h"

@implementation Circle

-(void) setRedius: (int) _redius {
    redius = _redius;
}

-(float)getArea{
    area = PI * redius * redius;
    return area;
}

@end
