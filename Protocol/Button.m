//
//  Button.m
//  Protocol
//
//  Created by iMac on 16/4/3.
//  Copyright © 2016年 YihangDing. All rights reserved.
//

#import "Button.h"

@implementation Button


////防止内存泄漏
//- (void)dealloc {
//    [_delegate release];
//    
//    [super dealloc];
//}

- (void)click {
    // button is clicked, inform the listener
    [_delegate onClick];
}

@end
