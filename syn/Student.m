//
//  Student.m
//  syn
//
//  Created by iMac on 16/3/29.
//  Copyright © 2016年 丁一航. All rights reserved.
//

#import "Student.h"

@implementation Student
@synthesize test = _test;
//一定要写成这样。

- (void) getAge:(int)age {
    
}
- (void) getNo:(int) no {
    
}
- (int) age {
    return _age;
}
- (int) no {
    return _no;
}

- (id) initWithAge:(int)age andNo:(int)no {
    //首先要调用父类 init 方法
    self = [super init];
    
    //一定要先检查 self 对象是否为空。不为空的时候 self 对象内存分配才成功，如果为空，则没有成功分配内存。
    //两条语句可以合并成 if (self = [super init])
    if (self) {
        _age = age;
        _no = no;
        //可以写成 self.age = age, self.no = no;
    }
    return self;
}

//重写父类 description 方法， 当使用%@打印一个对象的时候会调用这个方法
- (NSString *) description {
    
    NSString *str = [NSString stringWithFormat:@"age is %i, no is %i", _age, _no];
    
    return str;
}

// 如果.h文件中没有声明的方法，而是只在.m中直接写出来的方法，就是私有方法。It's useful.

@end
