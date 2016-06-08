//
//  MyView.m
//  HelpProject
//
//  Created by 许波波 on 16/6/2.
//  Copyright © 2016年 许波波. All rights reserved.
//

#import "MyView.h"
#import "MyViewChilldrenView.h"
#define itemWidth [UIScreen mainScreen].bounds.size.width/3
@implementation MyView
{
    MyViewChilldrenView * imageView;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor grayColor];
        self.myScrollView = [[UIScrollView alloc] initWithFrame:frame];
        self.myScrollView.backgroundColor = [UIColor redColor];
        [self addSubview:self.myScrollView];
        
    }
    return self;
}

- (void)setMyScrollViewWithViewNumber:(NSInteger)number
{
    for (int i = 0 ; i< number; i++) {
        imageView = [[MyViewChilldrenView alloc] initWithFrame:CGRectMake((self.frame.size.width/3)*i, 0, self.frame.size.width/3, self.frame.size.height)];
        UITapGestureRecognizer * ges = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(action:)];
        imageView.userInteractionEnabled  = YES;
        [imageView addGestureRecognizer:ges];
        imageView.tag = 100 + i;
        [imageView setLabelName:[NSString stringWithFormat:@"%d",i]];
        imageView.backgroundColor = [UIColor greenColor];
        
        [self.myScrollView addSubview:imageView];
        
    }
    self.myScrollView.contentSize = CGSizeMake((self.frame.size.width/3)*number, self.frame.size.height);
    self.myScrollView.delegate = self;
//    self.myScrollView.pagingEnabled = YES;
 
}

- (void)action:(UITapGestureRecognizer *)ges
{
    NSInteger index = ges.view.tag;
    for (int i = 0; i < self.myScrollView.subviews.count; i++) {
        imageView = self.myScrollView.subviews[i];
        NSArray * array = imageView.subviews;
        if (array.count > 2) {
            if (i == ges.view.tag - 100) {
                [imageView setSelected:YES];
            }else{
                [imageView setSelected:NO];
            }
        }
        
    }
    CGFloat moveDistance = ((index - 100)-1) * itemWidth;
    [UIView animateKeyframesWithDuration:0.2 delay:0 options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
//        UIView
        [self.myScrollView setContentOffset:CGPointMake(moveDistance, 0)];
    } completion:nil];
    if ([self.mydelegate respondsToSelector:@selector(selecedViewIndex:)]) {
        [self.mydelegate selecedViewIndex:ges.view.tag];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger number = (scrollView.contentOffset.x/self.frame.size.width)*3 + 1;
    for (int i = 0; i < self.myScrollView.subviews.count; i++) {
        imageView = self.myScrollView.subviews[i];
        NSArray * array = imageView.subviews;
        if (array.count > 2) {
            if (i == number) {
                [imageView setSelected:YES];
            }else{
                [imageView setSelected:NO];
            }
        }
        
    }

    

    if ([self.mydelegate respondsToSelector:@selector(selecedViewIndex:)]) {
        [self.mydelegate selecedViewIndex:number + 100];
    }
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset NS_AVAILABLE_IOS(5_0)
{
    NSLog(@"itemW = %f",itemWidth);
    CGFloat with = [UIScreen mainScreen].bounds.size.width/3;
    CGFloat targetOffSet = targetContentOffset -> x;
    NSUInteger i = targetOffSet/with + 0.5;
    *targetContentOffset = CGPointMake(i* with, 0);
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
