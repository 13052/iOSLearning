//
//  Circle.h
//  hello
//
//  Created by 丁一航 on 16/1/12.
//  Copyright © 2016年 丁一航. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Shape.h"
#define PI 3.14

@interface Circle : Shape {
    int radius;
    float area;
}

-(void) setRadius: (int) _radius;

-(float) getArea;

@end
