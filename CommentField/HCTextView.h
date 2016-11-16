//
//  HCTextView.h
//  评论框
//
//  Created by paperclouds on 16/11/16.
//  Copyright © 2016年 paperclouds. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIColor+HEX.h"
@interface HCTextView : UIView<UITextViewDelegate>
@property (strong,nonatomic) UITextView *commentField; // 评论输入框
@property (strong,nonatomic) UIButton *publishBtn; // 发布按钮
@end
