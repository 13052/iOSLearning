//
//  DropitBehavior.h
//  Dropit
//
//  Created by iMac on 16/4/4.
//  Copyright © 2016年 YihangDing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DropitBehavior : UIDynamicBehavior

- (void)addItem:(id <UIDynamicItem>)item;
- (void)removeItem:(id <UIDynamicItem>)item;


@end
