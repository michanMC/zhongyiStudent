//
//  AllOrderViewController.m
//  ZYStudent
//
//  Created by MC on 2016/12/20.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "AllOrderViewController.h"
#import "OrderViewTableViewCell.h"
#import "OrderDatasiltViewController.h"
#import "PayViewController.h"
#import "AppraiseKCViewController.h"
@interface AllOrderViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
    
    
}

@end

@implementation AllOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self prepareUI];
    
    // Do any additional setup after loading the view.
}
-(void)prepareUI{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, Main_Screen_Height - 64 - 44) style:UITableViewStyleGrouped];
    _tableView.delegate =self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.001;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat viewh = 44 * 2 + 1 + MCAdaptiveH(750, 240, Main_Screen_Width) + 20;
    
    
    return viewh;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString * cellid = @"OrderViewTableViewCell";
    
    OrderViewTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell =[[OrderViewTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.stateIndex = indexPath.section+1;
    
    [cell prepareUI];
    [cell.stateBtn addTarget:self action:@selector(actionStateBtn:) forControlEvents:1<<6];
    return cell;
    

    return [[UITableViewCell alloc]init];
}
-(void)actionStateBtn:(UIButton*)btn{
    
    if ([btn.titleLabel.text isEqualToString:@"去支付"]) {
        PayViewController * ctl =[[PayViewController alloc]init];
        [self pushNewViewController:ctl];

    }
    if ([btn.titleLabel.text isEqualToString:@"去评价"]) {
        AppraiseKCViewController * ctl =[[AppraiseKCViewController alloc]init];
        [self pushNewViewController:ctl];

    }
    

    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    OrderDatasiltViewController * ctl =[[OrderDatasiltViewController alloc]init];
    [self pushNewViewController:ctl];
    
    
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
