//
//  main.m
//  什么是Block
//
//  Created by 曹秀锦 on 2019/1/10.
//  Copyright © 2019年 SILENCE. All rights reserved.
//

#import <Foundation/Foundation.h>

void function_block_demo_01 () {
    // error: Cannot refer to declaration with an array type inside block
//    const char text[] = "hello";
//    void (^blk) (void) = ^{
//        printf("%c\n", text[1]);
//    };
    // succeeded
    const char *text = "hello";
    void (^blk) (void) = ^{
        printf("%c\n", text[1]);
    };
    blk();
}

int main(int argc, const char * argv[]) {
//    function_block_demo_01();
//    void (*func_porint)(void) = &function_block_demo_01;
//    func_porint();
    int i = 10;
    __block int j = 10;
    __block NSObject *object = [[NSObject alloc] init];
    NSLog(@"%@", object);
    void (^blk) (void) = ^{
        printf("Block i = %d, j = %d object = %s\n", i, j, [[object description] UTF8String]);
//        object = nil; object必须是用__block 修饰之后这句代码才能编译通过
    };
    i = 20;
    j = 20;
    object = [[NSObject alloc] init];
    blk();
    return 0;
}
