//
//  Student.h
//  syn
//
//  Created by iMac on 16/3/29.
//  Copyright © 2016年 丁一航. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject {//成员变量定义在大括号中,一般使用下划线_age
    // 成员变量作用于使用方法是,但一般是使用默认，不用这些。默认是 protected 性质的成员变量。
    @public
    int _age;
    int _no;
    
    @private
    int _flag;
}

@property int test;

//age的 get方法
//-代表动态方法（对象方法）
//+代表静态方法（类方法）
//oc 中所有在.h文件中声明的所有方法都是公共的

- (void) getAge:(int) age;
- (void) getNo:(int) no;
- (int) age;
- (int) no;

//重写构造方法 
- initWithAge: (int) age andNo: (int) no;

@end
