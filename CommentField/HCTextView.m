//
//  HCTextView.m
//  评论框
//
//  Created by paperclouds on 16/11/16.
//  Copyright © 2016年 paperclouds. All rights reserved.
//

#import "HCTextView.h"
#import "UIView+CLKAddition.h"
#import "Masonry.h"

#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define WIDTH  ScreenWidth/375

@implementation HCTextView
{
    float _currentLineNum;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithHexString:@"#E6E6E6"];
        _currentLineNum=1;//默认文本框显示一行文字
        [self addSubviews];
    }
    return self;
}

- (void)addSubviews{
    
    self.commentField = [[UITextView alloc]init];
    self.commentField.backgroundColor = [UIColor colorWithHexString:@"#f8f8f8"];
    self.commentField.font = [UIFont systemFontOfSize:12];
    self.commentField.text = @"｜说说你的看法～";
    self.commentField.textColor = [UIColor colorWithHexString:@"#a0a0a0"];
    self.commentField.layer.cornerRadius = 4;
    self.commentField.layer.masksToBounds = YES;
    [self addSubview:self.commentField];
    self.commentField.contentInset = UIEdgeInsetsMake(-66,0,0,0);

    self.commentField.delegate = self;
    
    self.publishBtn = [[UIButton alloc]init];
    [self.publishBtn setTitle:@"发布" forState:UIControlStateNormal];
    [self.publishBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.publishBtn setBackgroundColor:[UIColor colorWithHexString:@"23aBec"]];
    self.publishBtn.layer.cornerRadius = 2;
    self.publishBtn.layer.masksToBounds = YES;
    [self addSubview:self.publishBtn];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    [self.publishBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(80*WIDTH, 32));
        make.right.equalTo(@-10);
        make.bottom.equalTo(@-8);
    }];
    
    [self.commentField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@10);
        make.right.equalTo(self.publishBtn.mas_left).offset(-10);
        make.centerY.mas_equalTo(self);
        make.height.greaterThanOrEqualTo(@26);
    }];
    
}

#pragma mark - UITextViewDelegate

- (void)textViewDidBeginEditing:(UITextView *)textView {
    if ([textView.text isEqualToString:@"｜说说你的看法～"]) {
        textView.text = @"";
        self.commentField.textColor = [UIColor colorWithHexString:@"#646464"];
        self.commentField.contentInset = UIEdgeInsetsMake(2,0,-2,0);
    }
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    if (textView.text.length<1) {
        textView.text = @"｜说说你的看法～";
        textView.textColor = [UIColor colorWithHexString:@"#a0a0a0"];
    }
    self.commentField.contentInset = UIEdgeInsetsMake(2,0,-2,0);
}

-(void)textViewDidChange:(UITextView *)textView{
    float textViewWidth=textView.frame.size.width;//取得文本框高度
    NSString *content=textView.text;
    NSDictionary *dict=@{NSFontAttributeName:[UIFont systemFontOfSize:12.0]};
    CGSize contentSize=[content sizeWithAttributes:dict];//计算文字长度
    float numLine=ceilf(contentSize.width/textViewWidth); //计算当前文字长度对应的行数
    if (numLine>10) {
        numLine=10;
    }
    CGFloat heightText = 14;
    
    if (numLine != 0) {
        if (numLine>_currentLineNum) {
            self.frame = CGRectMake(self.frame.origin.x,self.frame.origin.y-heightText*(numLine-_currentLineNum), ScreenWidth, self.frame.size.height+heightText*(numLine-_currentLineNum));
            
            
            [self.commentField mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.equalTo(@(self.commentField.frame.size.height+heightText*(numLine-_currentLineNum)));
            }];
            
            _currentLineNum=numLine;
        }else if(numLine<_currentLineNum){
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y-heightText*(numLine-_currentLineNum), ScreenWidth, self.frame.size.height+heightText*(numLine-_currentLineNum));
            
            
            [self.commentField mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.equalTo(@(self.commentField.frame.size.height+heightText*(numLine-_currentLineNum)));
            }];
            
            _currentLineNum=numLine;
        }
    }
}


@end
