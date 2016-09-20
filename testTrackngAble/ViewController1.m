//
//  ViewController1.m
//  testTrackngAble
//
//  Created by sijiechen3 on 16/9/19.
//  Copyright © 2016年 sijiechen3. All rights reserved.
//

#import "ViewController1.h"
#import "SPTrackingAbleProtocol.h"

@interface ViewController1 () <SPTrackingAbleProtocol>

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 100, 100)];
    
    btn.backgroundColor = [UIColor yellowColor];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}

- (NSString *)trackingTitle {
    return @"v1 title";
}

- (void)btnClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
