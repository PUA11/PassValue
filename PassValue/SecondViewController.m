//
//  SecondViewController.m
//  PassValue
//
//  Created by Pua on 16/1/8.
//  Copyright © 2016年 Pua. All rights reserved.
//

#import "SecondViewController.h"
#import "Single.h"
@interface SecondViewController ()<UITextFieldDelegate>
{
    UITextField *textFd;
}
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self createView];
}
-(void)createView
{
    textFd = [[UITextField alloc]initWithFrame:CGRectMake(100, 100, 100, 30)];
    textFd.borderStyle = UITextBorderStyleLine;
    [self.view addSubview:textFd];
    NSArray *array = @[@"delegate",@"block",@"notification",@"single"];
    for (int i = 0; i < 4;i++   ) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(200, 200+40*i, 100, 40);
        [btn setTitle:array[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        btn.tag = i+10;
        [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
}

-(void)buttonClick:(UIButton *)btn
{
    if (btn.tag == 10) {
        [self.delegate passName:textFd.text];
    }
    if (btn.tag == 11) {
        NSString *str =[NSString stringWithFormat:@"%@",textFd.text];
        _block (str);
        [self dismissViewControllerAnimated:YES completion:nil];

    }
    if (btn.tag == 12) {
        NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
        [notificationCenter postNotificationName:@"changeNameNotification" object:nil userInfo:@{@"name":textFd.text}];
    }
    if (btn.tag == 13) {
        Single *single =[Single shareDatabase];
        single.name = textFd.text;
    }

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
