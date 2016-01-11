//
//  ToDoItem.h
//  ToDoList
//
//  Created by 丁一航 on 16/1/10.
//  Copyright © 2016年 丁一航. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoItem : NSObject

@property NSString *itemName;

@property BOOL completed;

@property (readonly) NSDate *creationDate;


@end
