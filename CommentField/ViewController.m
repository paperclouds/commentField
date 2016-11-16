//
//  ViewController.m
//  评论框
//
//  Created by paperclouds on 16/11/15.
//  Copyright © 2016年 paperclouds. All rights reserved.
//

#import "ViewController.h"
#import "HCTextView.h"
#import "UIView+CLKAddition.h"

@interface ViewController ()

@end

@implementation ViewController{
    HCTextView *_hcTextView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"评论框";
    
    _hcTextView = [[HCTextView alloc]initWithFrame:CGRectMake(0, self.view.height-48.5, self.view.width, 48.5)];
    [self.view addSubview:_hcTextView];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide:)];
    [self.view addGestureRecognizer:tapGestureRecognizer];
}

-(void)keyboardHide:(UITapGestureRecognizer*)tap{
    [_hcTextView.commentField resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
