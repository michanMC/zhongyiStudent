//
//  FriStateViewController.m
//  ZYStudent
//
//  Created by MC on 2016/12/14.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "FriStateViewController.h"
#import "FriStateTableViewCell.h"
#import "MyDetailsViewController.h"
@interface FriStateViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    
    UITableView *_tableView;
    
    
}

@end

@implementation FriStateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"好友动态";
    [self prepareUI];
    self.view.backgroundColor =[UIColor whiteColor];
    // Do any additional setup after loading the view.
}
-(void)prepareUI{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, Main_Screen_Width, Main_Screen_Height - 64) style:UITableViewStyleGrouped];
    _tableView.delegate =self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    _tableView.backgroundColor =[UIColor whiteColor];
    [self prepareheaderView];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}
-(void)prepareheaderView{
    
    
    CGFloat h = MCAdaptiveH(750, 390, Main_Screen_Width) + 30 + 20;
    
    UIView * view =[[UIView alloc ]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, h)];
    _tableView.tableHeaderView = view;
    
    UIImageView*imgview =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, MCAdaptiveH(750, 390, Main_Screen_Width))];
    imgview.image =[UIImage imageNamed:@"bg_def_424"];
    
    [view addSubview:imgview];
    
    
    
    UIImageView * headerimgview =[[UIImageView alloc]initWithFrame:CGRectMake(25, h  - 20 - 60, 60, 60)];
    headerimgview.image =[UIImage imageNamed:@"def_user_120"];
    [view addSubview:headerimgview];
    
    UILabel * nameLbl = [[UILabel alloc]initWithFrame:CGRectMake(25 + 60 + 6, imgview.mj_h, Main_Screen_Width - 25 + 60 + 6 - 10, 30)];
    nameLbl.textColor =[UIColor darkTextColor];
    nameLbl.font = [UIFont systemFontOfSize:17];
    nameLbl.text =@"michan";
    [view addSubview:nameLbl];

    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
  CGFloat  ih = MCAdaptiveH(750, 280, Main_Screen_Width);
    NSString * str = @"下午下午下午下午下午下午下午下午下午下午下午下午下午下午下午下午";
    CGFloat w= Main_Screen_Width - 25 - 6 - 5 - 25;
   CGFloat  lh = [MCToolsManage heightforString:str andWidth:w fontSize:14];
    return 20 + 7 + lh + 15 + ih + 15;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString * cellid = @"FriStateTableViewCell";
    
    FriStateTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell =[[FriStateTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    
    [cell prepareUI];
    return cell;
    

    
    
    return [[UITableViewCell alloc]init];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyDetailsViewController * ctl =[[MyDetailsViewController alloc]init];
    ctl.title = @"动态详情";
    ctl.indexCtl = 1;
    [self pushNewViewController:ctl];

    
}
-(void)viewDidLayoutSubviews {
    if (IOS7) {
        
        if ([_tableView respondsToSelector:@selector(setSeparatorInset:)]) {
            [_tableView setSeparatorInset:UIEdgeInsetsZero];
            
        }
        if ([_tableView respondsToSelector:@selector(setLayoutMargins:)])  {
            [_tableView setLayoutMargins:UIEdgeInsetsZero];
        }
    }
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPat{
    if (IOS8) {
        
        if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
            [cell setLayoutMargins:UIEdgeInsetsZero];
        }
        if ([cell respondsToSelector:@selector(setSeparatorInset:)]){
            [cell setSeparatorInset:UIEdgeInsetsZero];
        }
    }
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
