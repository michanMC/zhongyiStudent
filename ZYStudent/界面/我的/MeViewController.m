//
//  MeViewController.m
//  ZYStudent
//
//  Created by MC on 2016/12/14.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "MeViewController.h"
#import "MeViewTableViewCell.h"
#import "PersonaViewController.h"
#import "MCChangePwdViewController.h"
#import "MyOrderViewController.h"
#import "ActivityViewController.h"
#import "MyKCViewController.h"
#import "SonDataViewController.h"
@interface MeViewController ()<UITableViewDelegate,UITableViewDataSource,MeViewTableDelegate>
{
    
    UITableView *_tableView;
    UIButton *_headerBtn;
    
    
    UILabel *_nameLbl;
    UIImageView * _sexImgview;
    UIButton * _imBtn;
    
    
}

@end

@implementation MeViewController


-(void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    
    
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self prepareUI];
    // Do any additional setup after loading the view.
}
-(void)prepareUI{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, Main_Screen_Height - 49) style:UITableViewStyleGrouped];
    _tableView.delegate =self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    _tableView.backgroundColor =[UIColor whiteColor];
    _tableView.bounces = NO;
    [self prepareHearview];
//    _tableView.tableFooterView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, 0.01)];
}
-(void)prepareHearview{
    
    CGFloat h = MCAdaptiveH(750, 356, Main_Screen_Width);
    UIImageView * bgimgview =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, h)];
    bgimgview.image =[UIImage imageNamed:@"bg_teacher1"];
    bgimgview.userInteractionEnabled = YES;
    bgimgview.backgroundColor = AppMCNACOLOR;
//   bgimgview.contentMode= UIViewContentModeRedraw;
    _tableView.tableHeaderView = bgimgview;
    
    
    CGFloat x = 0;
    CGFloat y = 30;
    CGFloat w = Main_Screen_Width;
    h = 20;
    UILabel *titleLbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
titleLbl.text=@"个人中心";
    titleLbl.font = [UIFont fontWithName:@"CourierNewPSMT" size:20.0];
    titleLbl.textAlignment = NSTextAlignmentCenter;
    [bgimgview addSubview:titleLbl];
    titleLbl.textColor = AppMCNATitleCOLOR;
    _imBtn =[[UIButton alloc]initWithFrame:CGRectMake(Main_Screen_Width - 10-28, y-6, 28, 25)];
    [_imBtn setImage:[UIImage imageNamed:@"nav_message"] forState:0];
    
    [bgimgview addSubview:_imBtn];

    w= 60;
    h = w;
    x = (Main_Screen_Width - w)/2;
    y = (bgimgview.mj_h - w)/2;
    _headerBtn =[[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
    [_headerBtn setImage:[UIImage imageNamed:@"def_head112"] forState:0];
    ViewRadius(_headerBtn, w/2);
    [_headerBtn addTarget:self action:@selector(actionHeaderBtn) forControlEvents:1<<6];
    [bgimgview addSubview:_headerBtn];

    y+=h + 10;
    h = 20;
    w =Main_Screen_Width;
    x = 0;
    _nameLbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    _nameLbl.text =@"michan";
    _nameLbl.font =[UIFont systemFontOfSize:18];
    _nameLbl.textAlignment = NSTextAlignmentCenter;
    [bgimgview addSubview:_nameLbl];

  w =  [MCToolsManage heightforString:@"michan" andHeight:20 fontSize:18];
    x = Main_Screen_Width/2+w /2 + 5;
    w = 20;
    h = 20;
    _sexImgview = [[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    _sexImgview.image =[UIImage imageNamed:@"icon_female2"];
    [bgimgview addSubview:_sexImgview];

    
    
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.000;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    
    return  ( Main_Screen_Width - 1)/3;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString * cellid = @"MeViewTableViewCell";
    
    MeViewTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell =[[MeViewTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.delegate = self;
    if (indexPath.row == 0) {
        cell.index = 100;
        cell.titleArray= @[@"我的订单",@"我的课程",@"我的活动"];
        cell.imgArray = @[@"icon_order",@"icon_lesson",@"icon_activity"],
        [cell prepareUI];
        return cell;


    }
    else
    {
        cell.index = 200;
        cell.titleArray= @[@"孩子资料",@"联系客服",@"设置"];
        cell.imgArray = @[@"icon_child-information",@"icon_client",@"icon_setting"],
        [cell prepareUI];
        return cell;

    }
    

    
    return [[UITableViewCell alloc]init];
}
-(void)selectBtn:(UIButton *)btn
{
    
    if ([btn.titleLabel.text isEqualToString:@"我的订单"]) {
        MyOrderViewController * ctl =[[MyOrderViewController alloc]init];
        [self pushNewViewController:ctl];
    }
    if ([btn.titleLabel.text isEqualToString:@"我的活动"]) {
        ActivityViewController * ctl =[[ActivityViewController alloc]init];
        ctl.mectl = 1;
        [self pushNewViewController:ctl];
    }
    if ([btn.titleLabel.text isEqualToString:@"我的课程"]) {
        MyKCViewController * ctl =[[MyKCViewController alloc]init];
        [self pushNewViewController:ctl];
    }
    if ([btn.titleLabel.text isEqualToString:@"孩子资料"]) {
        SonDataViewController * ctl =[[SonDataViewController alloc]init];
        [self pushNewViewController:ctl];
    }
    


    
}
#pragma mark-头像
-(void)actionHeaderBtn{
    
    PersonaViewController * ctl =[[PersonaViewController alloc]init];
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
