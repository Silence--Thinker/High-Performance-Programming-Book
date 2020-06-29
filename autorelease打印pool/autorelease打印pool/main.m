//
//  main.m
//  autorelease打印pool
//
//  Created by 曹秀锦 on 2020/6/17.
//  Copyright © 2020 SILENCE. All rights reserved.
//

#import <Foundation/Foundation.h>

// 打印当前autorelease pool使用情况
extern void _objc_autoreleasePoolPrint(void);

int main(int argc, const char * argv[]) {
    
    // NSAutoreleasePool 不可以用于ARC
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSObject *obj = [[NSObject alloc] init];
    [obj autorelease];
    NSLog(@"%@===%p==%@==%p", obj, &obj, pool, &pool);
    
    NSAutoreleasePool *pool2 = [[NSAutoreleasePool alloc] init];
    NSObject *obj2 = [[NSObject alloc] init];
    [obj2 autorelease];
    NSLog(@"%@===%p==%@", obj2, &obj2, pool2);
    
    _objc_autoreleasePoolPrint();
    // 任何其他类的autorelease调用的都是NSObject的autorelease，但是NSAutoreleasePool类的autorelease实例方法
    // 已被该类重载，运行时会报错。
    // [pool2 autorelease]; // error: Cannot autorelease an autorelease pool
    
    // 等同于 [pool release]; 因为 [pool drain] 方法直接调用的就是[pool dealloc], 在dealloc中 会调用
    // 1. emptyPoll 2. [array release] array是存所有加入的autorelease对象的
    [pool2 drain];
    [pool drain];
    _objc_autoreleasePoolPrint();
    
    {   id __strong obj3 = [[NSObject alloc] init];
        [obj3 release];
    }
    return 0;
}
