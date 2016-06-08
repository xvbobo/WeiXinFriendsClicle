//
//  MyAlartView.h
//  HelpProject
//
//  Created by 许波波 on 16/6/7.
//  Copyright © 2016年 许波波. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol MyAlartViewDelegate <NSObject>

- (void)alartViewClick:(NSInteger)tag;

@end
@interface MyAlartView : UIView
@property (nonatomic,weak) id <MyAlartViewDelegate> delegate;
@end
