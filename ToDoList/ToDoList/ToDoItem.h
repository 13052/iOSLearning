//
//  ToDoItem.h
//  ToDoList
//
//  Created by iMac on 16/4/20.
//  Copyright © 2016年 YihangDing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoItem : NSObject

@property NSString *itemName;
@property BOOL completed;
@property (readonly) NSDate *creationDate;

@end
