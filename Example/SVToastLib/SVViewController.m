//
//  SVViewController.m
//  SVToastLib
//
//  Created by hqm_vip@163.com on 07/23/2019.
//  Copyright (c) 2019 hqm_vip@163.com. All rights reserved.
//

#import "SVViewController.h"

#import <SVToastLib/SVToast.h>

@interface SVViewController ()

@end

@implementation SVViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor purpleColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [SVToast showLoading:@"哈哈哈哈哈霍霍"];
}

@end
