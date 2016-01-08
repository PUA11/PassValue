//
//  SecondViewController.h
//  PassValue
//
//  Created by Pua on 16/1/8.
//  Copyright © 2016年 Pua. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^MyBlocK)(NSString *);
@protocol SecDelegate <NSObject>

-(void)passName:(NSString *)name;

@end

@interface SecondViewController : UIViewController

@property (nonatomic , assign) id<SecDelegate>delegate;
@property (nonatomic , copy) MyBlocK block;

@end
