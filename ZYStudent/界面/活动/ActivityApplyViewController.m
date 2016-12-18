//
//  ActivityApplyViewController.m
//  ZYStudent
//
//  Created by MC on 2016/12/18.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "ActivityApplyViewController.h"
#import "ActivityApplyTableViewCell.h"
#import "ApplyViewController.h"
#import "ResultsInquiryViewController.h"

@interface ActivityApplyViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    
    
    
    UITableView *_tableView;
    
    
    
}

@end

@implementation ActivityApplyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self prepareUI];
    // Do any additional setup after loading the view.
}
-(void)prepareUI{
    
    CGFloat h = 0;
    if (_stateindex ==1 ||_stateindex == 2) {
        h = 49;
    }
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, self.view.mj_h - h-64) style:UITableViewStyleGrouped];
    _tableView.delegate =self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = AppBgCOLOR;
    [self prepareheaderView];
    if (_stateindex ==1 ||_stateindex == 2) {
        [self prepareBarView];

    }
}
-(void)prepareBarView{
    UIView * view =[[UIView alloc]initWithFrame:CGRectMake(0, Main_Screen_Height - 49 - 64, Main_Screen_Width, 49)];
    view.backgroundColor =[UIColor whiteColor];
    [self.view addSubview:view];
    
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, 49)];
    btn.backgroundColor = AppMCNACOLOR;
    if (_stateindex == 1) {
        [btn setTitle:@"我要报名" forState:0];
  
    }
    if (_stateindex == 2) {
        [btn setTitle:@"查询成绩" forState:0];
        
    }
    [btn addTarget:self action:@selector(actionOK) forControlEvents:1<<6];
    UIColor *cc = AppMCNATitleCOLOR;
    [btn setTitleColor:cc forState:0];
    btn.titleLabel.font =[UIFont systemFontOfSize:15];
    [view addSubview:btn];
    
    
    
}
-(void)prepareheaderView{
    CGFloat viewh = MCAdaptiveH(750, 400,Main_Screen_Width) + 5 + 40 + 35;
    UIView * view =[[UIView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, viewh)];
    _tableView.tableHeaderView = view;
    
    UIImageView * imgview =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, MCAdaptiveH(750, 400,Main_Screen_Width))];
    imgview.image =[UIImage imageNamed:@"bg_def_424"];
    [view addSubview:imgview];
    
    CGFloat y =MCAdaptiveH(750, 400,Main_Screen_Width)+5;
    UILabel *lbl =[[UILabel alloc]initWithFrame:CGRectMake(10, y, Main_Screen_Width-20, 40)];
    lbl.text = @"手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机";
    lbl.font =[UIFont systemFontOfSize:14];
    lbl.numberOfLines =0;
    [view addSubview:lbl];
    
    y+=40 + 5;
    UILabel *teypLbl =[[UILabel alloc]initWithFrame:CGRectMake(Main_Screen_Width - 10 - 60, y, 60, 25)];
    UIColor *cc = AppMCNATitleCOLOR;
    
    UIColor * cc2 = [UIColor orangeColor];
    UIColor * cc3 = kUIColorFromRGB(0x53dc7c);

    if (_stateindex == 1) {
        teypLbl.text = @"报名中";
        ViewBorderRadius(teypLbl, 3, 1, cc);
        teypLbl.textColor = cc;

    }
    if (_stateindex == 2) {
        teypLbl.text = @"已结束";
        ViewBorderRadius(teypLbl, 3, 1, [UIColor lightGrayColor]);
        teypLbl.textColor = [UIColor lightGrayColor];
        
    }
    if (_stateindex == 3) {
        teypLbl.text = @"进行中";
        ViewBorderRadius(teypLbl, 3, 1, cc2);
        teypLbl.textColor = cc2;
        
    }
    if (_stateindex == 4) {
        teypLbl.text = @"未开始";
        ViewBorderRadius(teypLbl, 3, 1, cc3);
        teypLbl.textColor = cc3;
        
    }

    
    
    
    teypLbl.font =[UIFont systemFontOfSize:14];
    teypLbl.textAlignment =NSTextAlignmentCenter;
    [view addSubview:teypLbl];

    view.backgroundColor =[UIColor whiteColor];
    
    
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (_stateindex == 1) {
        return 2;

    }
    else
    {
        return 1;
    }
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 196;
    }
    return 91;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString * cellid = @"ActivityApplyTableViewCell";
    
    ActivityApplyTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell =[[ActivityApplyTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    if (indexPath.section == 0) {
        [cell prepareUI];

    }
    if (indexPath.section == 1) {
        [cell prepareUI2];
        
    }

    return cell;
    

    
    
    
    return [[UITableViewCell alloc]init];
}
-(void)actionOK{
    
    if (_stateindex == 1) {
        ApplyViewController * ctl =[[ApplyViewController alloc]init];
        [self pushNewViewController:ctl];
    }
    else
    {
        ResultsInquiryViewController * ctl =[[ResultsInquiryViewController alloc]init];
        [self pushNewViewController:ctl];
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
