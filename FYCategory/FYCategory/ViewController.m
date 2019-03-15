//
//  ViewController.m
//  FYCategory
//
//  Created by wang on 2019/3/15.
//  Copyright © 2019 wang. All rights reserved.
//

#import "ViewController.h"
#import "Category/UIView/UIView+cornerRadious.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self demo1];
    
}
-(void)demo1 {
    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(20, 100, 50, 50)];
    redView.backgroundColor = [UIColor redColor];
    [redView setCustomRectCorner:(UIRectCornerAllCorners) radius:(5)];
    [self.view addSubview:redView];
    
    UIView *blueView = [[UIView alloc] initWithFrame:CGRectMake(80, 100, 50, 50)];
    blueView.backgroundColor = [UIColor blueColor];
    [blueView setCustomRectCorner:(UIRectCornerTopLeft | UIRectCornerTopRight) radius:(10)];
    [self.view addSubview:blueView];
    
    UIView *brownView = [[UIView alloc] initWithFrame:CGRectMake(140, 100, 50, 50)];
    brownView.backgroundColor = [UIColor brownColor];
    [brownView sn_ClipToCircle:brownView.bounds borderColor:[UIColor redColor] borderWidth:0];
    [self.view addSubview:brownView];
    
}

@end
