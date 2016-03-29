//
//  main.m
//  syn
//
//  Created by iMac on 16/3/29.
//  Copyright © 2016年 丁一航. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 创建一个 student 对象；
        // 分配内存，调用一个静态方法 alloc 来分配内存
        Student *stu = [[Student alloc] initWithAge:15 andNo:2];
        // 还有一种初始化对象的方法
        //Student *stu = [Student new]; 等同于 Student *stu = [[Student alloc] init]; new 的话调用不了我们自己定义的初始化方法， 所以不推荐
         
        //
////        [stu setAge:18 withNo:1];
//        
//        NSLog(@"age = %i, no = %i", [stu getAge], [stu getNo]);
//        
//        //用完对象之后要释放内存
//        //[stu release];
        
        NSLog(@"age is %i, no is %i", stu.age, stu.no);
        NSLog(@"%@", stu);//打印对象的时候要用 %@。所有对象都是用%@表示的。
    }
    return 0;
}
