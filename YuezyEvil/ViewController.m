//
//  ViewController.m
//  YuezyEvil
//
//  Created by ZhangYue on 2016/11/30.
//  Copyright © 2016年 yuezy. All rights reserved.
//

#import "ViewController.h"



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIView *topView = [[UIView alloc]init];
    topView.backgroundColor = UIColor.greenColor;
    topView.layer.borderColor = UIColor.blackColor.CGColor;
    topView.layer.borderWidth = 2;
    [self.view addSubview:topView];
    
    UIView *topSubview = [[UIView alloc]init];
    topSubview.backgroundColor = UIColor.blueColor;
    topSubview.layer.borderColor = UIColor.blackColor.CGColor;
    topSubview.layer.borderWidth = 2;
    [topView addSubview:topSubview];
    
    UIView *bottomView = [[UIView alloc]init];
    bottomView.backgroundColor = [UIColor colorWithHexString:@"#DF2F37"];
    bottomView.layer.borderColor = UIColor.blackColor.CGColor;
    bottomView.layer.borderWidth = 2;
    [self.view addSubview:bottomView];
    
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_topLayoutGuide);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.height.equalTo(@40);
    }];
    
    [topSubview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_topLayoutGuide);
        make.centerX.equalTo(@0);
        make.width.equalTo(@20);
        make.height.equalTo(@20);
    }];
    
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottomLayoutGuide);
        make.left.equalTo(@100);
        make.width.equalTo(@100);
        make.height.equalTo(@40);
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
