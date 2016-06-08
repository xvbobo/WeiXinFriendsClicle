//
//  MyView.h
//  HelpProject
//
//  Created by 许波波 on 16/6/2.
//  Copyright © 2016年 许波波. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MyViewDelegate <NSObject>

- (void)selecedViewIndex:(NSInteger)index;

@end
@interface MyView : UIView <UIScrollViewDelegate>
@property (nonatomic,strong) UIScrollView * myScrollView;

@property (nonatomic,weak) id <MyViewDelegate> mydelegate;
- (void)setMyScrollViewWithViewNumber:(NSInteger)number;
@end
