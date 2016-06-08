//
//  MyTopView.m
//  HelpProject
//
//  Created by 许波波 on 16/6/7.
//  Copyright © 2016年 许波波. All rights reserved.
//

#import "MyTopView.h"
@implementation MyTopView
+ (UIView *)getUIView1WithFream:(CGRect)rect1
{
    
    UIView * view1 = [[UIView alloc] initWithFrame:rect1];
    UIImageView * imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, rect1.size.height - 10)];
    imageView1.userInteractionEnabled = YES;
    [view1 addSubview:imageView1];
    UILabel * label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, imageView1.frame.size.height - 40,ScreenWidth, 30)];
    label1.textAlignment = NSTextAlignmentCenter;
    label1.textColor = [UIColor whiteColor];
    label1.font = [UIFont systemFontOfSize:15];
    label1.shadowColor = [UIColor whiteColor];
    label1.shadowOffset = CGSizeMake(0, 0.5);
    [imageView1 addSubview:label1];
    UIImageView * headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenWidth - 60, imageView1.frame.size.height-40, 50, 50)];
    headImageView.userInteractionEnabled = YES;
    [view1 addSubview:headImageView];
    return view1;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
