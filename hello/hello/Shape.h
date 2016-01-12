//
//  Shape.h
//  hello
//
//  Created by 丁一航 on 16/1/12.
//  Copyright © 2016年 丁一航. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Shape : NSObject {
    NSString * Color;
}
-(void) setColor: (NSString *) _color;
-(void) getColor;
@end
