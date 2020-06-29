//
//  ViewController.m
//  autorelease打印pool在iOS项目中
//
//  Created by 曹秀锦 on 2020/6/17.
//  Copyright © 2020 SILENCE. All rights reserved.
//

#import "ViewController.h"

extern void _objc_autoreleasePoolPrint(void);

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@====%p", self, self);
    [self setupUI];
    
}

- (void)setupUI
{
    _objc_autoreleasePoolPrint();
}

@end
