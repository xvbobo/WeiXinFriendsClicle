//
//  MyAlartView.m
//  HelpProject
//
//  Created by 许波波 on 16/6/7.
//  Copyright © 2016年 许波波. All rights reserved.
//

#import "MyAlartView.h"

@implementation MyAlartView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self crteateView:frame];
        self.backgroundColor = [UIColor lightGrayColor];
    }
    return self;
}
- (void)crteateView:(CGRect)rect
{
    CGFloat height = (rect.size.height - 5)/2;
    for (int i = 0; i < 2; i++) {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0, i* (height + 5), ScreenWidth, height);
        button.tag = 100 +i;
        switch (i) {
            case 0:
                [button setTitle:@"更换相册封面" forState:UIControlStateNormal];
                break;
                case 1:
                [button setTitle:@"取消" forState:UIControlStateNormal];
                break;
            default:
                break;
        }
        button.backgroundColor = [UIColor whiteColor];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    }
}
- (void)buttonAction:(UIButton *)button
{
    if ([self.delegate respondsToSelector:@selector(alartViewClick:)]) {
        [self.delegate alartViewClick:button.tag];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
