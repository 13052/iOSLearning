//
//  BazierPathView.m
//  Dropit
//
//  Created by iMac on 16/4/5.
//  Copyright © 2016年 YihangDing. All rights reserved.
//

#import "BezierPathView.h"

@implementation BezierPathView

//- (id)initWithFrame:(CGRect)frame {
//    self = [super initWithFrame:frame];
//    if (self) {
//        
//    }
//    return self;
//}

- (void)setPath:(UIBezierPath *)path {
    _path = path;
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [self.path stroke];
}


@end
