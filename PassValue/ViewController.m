//
//  ViewController.m
//  PassValue
//
//  Created by Pua on 16/1/8.
//  Copyright © 2016年 Pua. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "Single.h"
@interface ViewController ()<SecDelegate>
{
    UILabel *label;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self createView];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeName:) name:@"changeNameNotification" object:nil];
    
}
-(void)createView
{
    label = [[UILabel alloc]initWithFrame:CGRectMake(50, 50, 100, 100)];
    [self.view addSubview:label];
    label.text = @"null";
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor blackColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(150, 200, 50, 50);
    [button setTitle:@"NEXT" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(nextVc) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    UIButton *blockBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    blockBtn.frame = CGRectMake(250, 250, 100, 100);
    [blockBtn setTitle:@"blockButton" forState:UIControlStateNormal];
    [blockBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [blockBtn addTarget:self action:@selector(block) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:blockBtn];

}
-(void)nextVc
{
    SecondViewController *Svc = [[SecondViewController alloc]init];
    Svc.delegate = self;
    [self presentViewController:Svc animated:YES completion:nil];
    Svc.block = ^(NSString *str)
    {
        label.text =  str;
    };

}
/**
 *  delegate
 */
-(void)passName:(NSString *)name
{
    label.text = name;
}
/**
 *  block
 */
-(void)block
{
}
/**
 *  notification
 */
-(void)changeName:(NSNotification *)not
{
    NSDictionary *dic = [not userInfo];
    label.text = dic[@"name"];
}
/**
 *  single
 */
//    Single *single = [Single shareDatabase];
//    label.text = single.name;
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end










