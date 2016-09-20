//
//  ViewController.m
//  testTrackngAble
//
//  Created by sijiechen3 on 16/9/19.
//  Copyright © 2016年 sijiechen3. All rights reserved.
//

#import "ViewController.h"
#import "ViewController1.h"
#import "SPTrackingAbleProtocol.h"

@interface ViewController () <SPTrackingAbleProtocol>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 100, 100)];
    
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (NSString *)trackingTitle {
    return @"v0 title";
}


- (void)btnClick:(id)sender {
    [self presentViewController:[[ViewController1 alloc] init] animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
