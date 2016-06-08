//
//  LeftViewController.m
//  HelpProject
//
//  Created by 许波波 on 16/6/6.
//  Copyright © 2016年 许波波. All rights reserved.
//

#import "LeftViewController.h"
#import "MyTableViewCell.h"
#import "MyTopView.h"
#import "MyAlartView.h"
@interface LeftViewController () <UITableViewDelegate,UITableViewDataSource,MyAlartViewDelegate>
{
    UITableView * myTableView;
    UIView * topView;
    MyAlartView * alartView;
    UIImageView * grayView;
}

@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIBarButtonItem * leftItem = [[UIBarButtonItem alloc] initWithTitle:@"发现" style:UIBarButtonItemStyleDone target:self action:@selector(back )];
    leftItem.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = leftItem;
    UIBarButtonItem * right = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"camera"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(takePhotoes)];
    self.navigationItem.rightBarButtonItem = right;
    // Do any additional setup after loading the view.
    myTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    myTableView.dataSource = self;
    myTableView.delegate = self;
    myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    topView = [MyTopView getUIView1WithFream:CGRectMake(0, 0, ScreenWidth, 300)];
    NSArray * array = topView.subviews;
    UIImageView * TopBackView = array.firstObject;
    TopBackView.backgroundColor = [UIColor blackColor];
    UIImageView * topBackViewHead = array.lastObject;
    topBackViewHead.backgroundColor = [UIColor yellowColor];
    UILabel * label = TopBackView.subviews.firstObject;
    label.text = @"爱你一万年";
    UITapGestureRecognizer * gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageClick )];
    [TopBackView addGestureRecognizer:gesture];
    UITapGestureRecognizer * gesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageClick1 )];
    [topBackViewHead addGestureRecognizer:gesture1];

    [self.view addSubview:myTableView];
    
    [self crreateAlartVIew];
}

- (void)crreateAlartVIew
{
    grayView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    grayView.alpha = 0.5;
    grayView.userInteractionEnabled = YES;
    grayView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:grayView];
    UITapGestureRecognizer * gesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(grayViewClick )];
    [grayView addGestureRecognizer:gesture1];
    grayView.hidden = YES;
    alartView = [[MyAlartView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 90, ScreenWidth, 90)];
    alartView.frame = CGRectMake(0, SCREEN_HEIGHT, ScreenWidth, 90);
    alartView.delegate = self;
    [self.view addSubview:alartView];
}

- (void)grayViewClick
{
    grayView.hidden = YES;
    [UIView animateWithDuration:0.5 animations:^{
        alartView.frame = CGRectMake(0, SCREEN_HEIGHT, ScreenWidth, 90);
    }];

}

- (void)takePhotoes
{
    
}

#pragma mark ==== tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 300;
    }else{
        return 70;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (indexPath.row == 0) {
        static NSString * fistCell = @"first";
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:fistCell];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:fistCell];
            [cell.contentView addSubview:topView];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        return cell;
    }else{
        static NSString * reuseIdentifier = @"myCell";
        MyTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
        if (cell == nil) {
            cell = [[MyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
        }
        return cell;
    }
    
}

- (void)imageClick
{
     NSLog(@"相册背景被点击");
    grayView.hidden = NO;
    [UIView animateWithDuration:0.5 animations:^{
        alartView.frame = CGRectMake(0, SCREEN_HEIGHT - 90, ScreenWidth, 90);
    }];
   
}

- (void)imageClick1
{
     NSLog(@"头像被点击");
}

- (void)alartViewClick:(NSInteger)tag
{
    if (tag == 101) {
        grayView.hidden = YES;
        [UIView animateWithDuration:0.5 animations:^{
            alartView.frame = CGRectMake(0, SCREEN_HEIGHT, ScreenWidth, 90);
        }];
    }
}
- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
