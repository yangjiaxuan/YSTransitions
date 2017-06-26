//
//  ViewController.m
//  YSTransitions
//
//  Created by yangsen on 17/6/21.
//  Copyright © 2017年 yangsen. All rights reserved.
//

#import "ViewController.h"
#import "FromVC.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    NSArray *_dataArr;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = YES;
    _dataArr = @[
                 @"默认 覆盖",
                 @"覆盖",
                 @"立体",
                 @"淡化",
                 @"翻转",
                 @"翻页",
                 @"推拉",
                 @"滴水",
                 @"抽拉",
                 @"线性",
                 @"缩放",
                 @"开窗"
                 ];
    
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64) style:UITableViewStylePlain];
    tableView.delegate   = self;
    tableView.dataSource = self;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    [self.view addSubview:tableView];
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return _dataArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    NSArray *titles = @[@"    左", @"    上",  @"    下", @"    右"];
    cell.textLabel.text = titles[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    FromVC *fromVC   = [FromVC controller];
    fromVC.direction = indexPath.row;
    fromVC.type      = indexPath.section;
    [self.navigationController pushViewController:fromVC animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 30;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{

    return _dataArr[section];
}

@end
