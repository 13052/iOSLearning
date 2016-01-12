//
//  Shape.m
//  hello
//
//  Created by 丁一航 on 16/1/12.
//  Copyright © 2016年 丁一航. All rights reserved.
//

#import "Shape.h"

@implementation Shape

-(void) setColor: (NSString*) _color {
    Color = _color;
}

-(void) getColor {
    NSLog(@"%@",Color);
}

@end
