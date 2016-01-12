//
//  main.m
//  hello
//
//  Created by 丁一航 on 16/1/12.
//  Copyright © 2016年 丁一航. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Circle.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        Circle *c = [Circle new];
        [c setColor:@"green"];
        [c setRadius:8];
        float area = [c getArea];
        [c getColor];
        NSLog(@"Its area is %f", area);
        
    }
    return 0;
}
