//
//  Button.h
//  Protocol
//
//  Created by iMac on 16/4/3.
//  Copyright © 2016年 YihangDing. All rights reserved.
//

#import <Foundation/Foundation.h>

// <>代表实现某个协议 :代表继承 ()代表分类.协议一般写在类里面的头文件里
@protocol ButtonDelegate <NSObject>

- (void)onClick;

@end

@interface Button : NSObject

// delegate 就是按钮的监听器
@property (nonatomic, retain) id<ButtonDelegate> delegate;

// click button
- (void)click;

@end


