//
//  RootViewController.m
//  HelpProject
//
//  Created by 许波波 on 16/6/2.
//  Copyright © 2016年 许波波. All rights reserved.
//

#import "RootViewController.h"
#import "MyView.h"
#import "MapView.h"
#import "LeftViewController.h"
#import <CoreData/CoreData.h>
@interface RootViewController () <MyViewDelegate,UITableViewDelegate,UITableViewDataSource>{
    MyView * myView;
    MapView * mapView;
    LeftViewController * leftVC;
    UITableView * myTableView;
    NSArray * rows;
}

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    myTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    myTableView.dataSource  =  self;
    myTableView.delegate = self;
    rows = @[@"朋友圈"];
    [self.view addSubview:myTableView];
/*
    myView = [[MyView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
    [myView setMyScrollViewWithViewNumber:9];
    myView.mydelegate = self;
    myView.center = self.view.center;
    [self.view addSubview:myView];
 */
//    mapView = [[MapView alloc] initWithFrame:self.view.bounds];
//    mapView.backgroundColor = [UIColor grayColor];
//    [self.view addSubview:mapView];
    // Do any additional setup after loading the view.
    [self getData ];
    
}

- (void)getData
{
    NSURL * modelURL = [[NSBundle mainBundle] URLForResource:@"MessageModel" withExtension:@"momd"];
    self.ObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    self.ObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return rows.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellString = @"cellRE";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellString];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellString];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@",rows[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
            leftVC = [[LeftViewController alloc] init];
            leftVC.title = [NSString stringWithFormat:@"%@",rows[indexPath.row]];
            [self.navigationController pushViewController:leftVC animated:YES];
            break;
            
        default:
            break;
    }
}
- (void)selecedViewIndex:(NSInteger)index
{
    NSLog(@"%ld",index);
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
