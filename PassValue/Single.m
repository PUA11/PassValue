//
//  Single.m
//  PassValue
//
//  Created by Pua on 16/1/8.
//  Copyright © 2016年 Pua. All rights reserved.
//

#import "Single.h"

@implementation Single

+(id)shareDatabase
{
    static Single *single = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (single == nil) {
            single = [[Single alloc]init];
        }
    });
    return single;
}

@end
