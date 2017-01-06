//
//  ViewController.m
//  ShareLuLuDemo
//
//  Created by li on 16/12/1.
//  Copyright © 2016年 RYT. All rights reserved.
//

#import "ViewController.h"
#import "ShareBottomView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    ShareBottomView *shareView = [[ShareBottomView alloc]initWithShareItems:@[ShareItemTypeQQ,ShareItemTypeSina,ShareItemTypeReport,ShareItemTypeQzone,ShareItemTypeWechatSession,ShareItemTypeCollection,ShareItemTypeWechatTimeline]];
    shareView.frame = CGRectMake(0, 100, 0, 0);
    [self.view addSubview:shareView];


}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
