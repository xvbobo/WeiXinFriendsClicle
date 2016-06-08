//
//  MyViewChilldrenView.m
//  HelpProject
//
//  Created by 许波波 on 16/6/2.
//  Copyright © 2016年 许波波. All rights reserved.
//

#import "MyViewChilldrenView.h"
#define pointViewWith 20
#define pointSelectedWith 40
@implementation MyViewChilldrenView
{
    UIImageView * pointView;
    UIImageView * selectedPointView;
    UILabel * namelabel;
    UILabel * selectedLabel;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        UIImageView * lineView = [[UIImageView alloc] initWithFrame:CGRectMake(0, frame.size.height/3, frame.size.width, 1)];
        lineView.backgroundColor = [UIColor grayColor];
        [self addSubview:lineView];
        
        //圆点
        pointView = [[UIImageView alloc] initWithFrame:CGRectMake(frame.size.width/2 - pointViewWith/2, lineView.frame.origin.y - pointViewWith/2, pointViewWith, pointViewWith)];
        pointView.backgroundColor = [UIColor redColor];
        pointView.layer.masksToBounds = YES;
        pointView.layer.cornerRadius = pointViewWith/2;
        [self addSubview:pointView];
        
        selectedPointView = [[UIImageView alloc] initWithFrame:CGRectMake(frame.size.width/2 - pointSelectedWith/2, lineView.frame.origin.y - pointSelectedWith/2, pointSelectedWith, pointSelectedWith)];
        selectedPointView.backgroundColor = [UIColor redColor];
        selectedPointView.layer.masksToBounds = YES;
        selectedPointView.layer.cornerRadius = pointSelectedWith/2;
        selectedPointView.hidden = YES;
        [self addSubview:selectedPointView];
        
        //地点
        namelabel = [[UILabel alloc] initWithFrame:CGRectMake(0, lineView.frame.origin.y + 30, frame.size.width, 30)];
        namelabel.font  = [UIFont systemFontOfSize:13];
        namelabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:namelabel];
        
    }
    return self;
}

- (void)setLabelName:(NSString *)string
{
    namelabel.text = string;
    
}

- (void)setSelected:(BOOL)YN
{
    if (YN == YES) {
        namelabel.font = [UIFont systemFontOfSize:20];
        selectedPointView.hidden = NO;
        pointView.hidden = YES;
    }else{
        namelabel.font = [UIFont systemFontOfSize:13];
        selectedPointView.hidden = YES;
        pointView.hidden = NO;
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
