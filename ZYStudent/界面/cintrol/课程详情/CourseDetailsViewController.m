//
//  CourseDetailsViewController.m
//  MCZhongYi
//
//  Created by MC on 2016/12/8.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "CourseDetailsViewController.h"
#import "CourseDetailsTableViewCell.h"
#import "CourseAllEvaluateViewController.h"
#import "HourViewController.h"
#import "TeacherCardViewController.h"
#import "MakeAcceptViewController.h"
#import "OKOrderViewController.h"
#import "BonusManViewController.h"
#import "LeaveViewController.h"
#import "melodyViewController.h"

@interface CourseDetailsViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView * _tableView;
    UIImageView * _headerImgView;
    UILabel * _titleLbl;
    UILabel * _priceLbl;

    
}

@end

@implementation CourseDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title= @"课程详情";
    [self prepareUI];
    [self preparebarView];
    // Do any additional setup after loading the view.
}
-(void)prepareUI{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, Main_Screen_Width, Main_Screen_Height - 64 - 49) style:UITableViewStyleGrouped];
    _tableView.delegate =self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    _tableView.backgroundColor = RGBCOLOR(250, 247, 247);
    
    [self preapreheaderView];
}
-(void)preapreheaderView{
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w= Main_Screen_Width;
    CGFloat h = MCAdaptiveH(750, 558, w);
    
    
    
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    _tableView.tableHeaderView = view;
    
    h =h - MCAdaptiveH(750, 158, Main_Screen_Width);
   
    
    _headerImgView = [[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    _headerImgView.image = [UIImage imageNamed:@"bg_def_390"];
    
    [view addSubview:_headerImgView];
    
    UIView * bgview = [[UIView alloc]initWithFrame:CGRectMake(0, h, Main_Screen_Width, MCAdaptiveH(750, 158, Main_Screen_Width))];
    bgview.backgroundColor =AppMCNACOLOR;
    [view addSubview:bgview];
    
    _titleLbl = [[UILabel alloc]initWithFrame:CGRectMake(5, 10, bgview.mj_w - 5 -100, 20)];
    _titleLbl.text = @"吉他吉他吉他吉他吉他";
    _titleLbl.font = [UIFont systemFontOfSize:18];
    [bgview addSubview:_titleLbl];
    
    _priceLbl = [[UILabel alloc]initWithFrame:CGRectMake(Main_Screen_Width - 5-100, 10, 100, 20)];
    _priceLbl.text = @"￥888.00";
    _priceLbl.textColor = [UIColor darkTextColor];
    _priceLbl.textAlignment = NSTextAlignmentRight;
    _priceLbl.font = [UIFont systemFontOfSize:15];
    [bgview addSubview:_priceLbl];
    
    
    x = 5;
    h = 20;
    y = bgview.mj_h - 10 - h;
    w = [MCToolsManage heightforString:@"集体课" andHeight:20 fontSize:14]+10;
    UILabel * lbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.text =@"集体课";
    lbl.font = [UIFont systemFontOfSize:14];
    lbl.textColor = AppMCNATitleCOLOR;
    lbl.backgroundColor =[UIColor whiteColor];
    ViewRadius(lbl, 3);
    lbl.textAlignment = NSTextAlignmentCenter;
    [bgview addSubview:lbl];

    x +=w + 5;
    w = Main_Screen_Width - x;
    UILabel * BuycountLbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    BuycountLbl.text =@"购买人数: 233";
    BuycountLbl.font = [UIFont systemFontOfSize:15];
    BuycountLbl.textColor = AppMCNATitleCOLOR;
    [bgview addSubview:BuycountLbl];

    
    
    
    
}
-(void)preparebarView{
    
    //ismeHomeCtl
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, Main_Screen_Height - 49, Main_Screen_Width, 49)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = Main_Screen_Width/2;
    CGFloat h = 49;
    if (_ismeHomeCtl) {
        w  = w/2;
        UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
        btn.backgroundColor = AppBgCOLOR;
        [btn setTitle:@"调班" forState:0];
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        [btn setTitleColor:[UIColor grayColor] forState:0];
        [btn addTarget:self action:@selector(actionTB) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:btn];
        x+=w;
        
        btn = [[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
        btn.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [btn setTitle:@"请假" forState:0];
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        [btn setTitleColor:[UIColor grayColor] forState:0];
            [btn addTarget:self action:@selector(actionQJ) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:btn];

        
        
    }
    else
    {
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
    btn.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [btn setTitle:@"预约试听" forState:0];
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn setTitleColor:[UIColor grayColor] forState:0];
    [btn addTarget:self action:@selector(actionST) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:btn];
    }
    
    
   
    x += w;
    w = Main_Screen_Width/2;
   UIButton* btn = [[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
    btn.backgroundColor = AppMCNACOLOR;
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    
    if (_ismeHomeCtl) {
        [btn setTitle:@"课时管理" forState:0];
        [btn addTarget:self action:@selector(actionClasstoos) forControlEvents:1<<6];

    }
    else
    {
        [btn setTitle:@"立即报名" forState:0];
        [btn addTarget:self action:@selector(actionCallClass) forControlEvents:1<<6];

    }
    UIColor *cc = AppMCNATitleCOLOR;
    [btn setTitleColor:cc forState:0];
    [view addSubview:btn];
    
    
    
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 3) {
        return 4;
    }
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 8;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
       CGFloat h = 10+20+30 +112/2+5+20+10+20+15+20+20;
        return h;
    }
    
    if (indexPath.section == 1) {
        CGFloat imgh = MCAdaptiveH(650, 290, Main_Screen_Width - 40);
        NSString * str = @"课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程";
       CGFloat h = [MCToolsManage heightforString:str andWidth:Main_Screen_Width - 40 fontSize:14];
        
      return   10 + 15 + 2 + 20 + h + 10 + imgh + 10;


    }
    if (indexPath.section == 2) {
        CGFloat viewh=  10 + 15 +2 + 10 + 40 + 20 + 30 + 10 + 30 + 10 +30 + 10 + 25 + 10;
        return viewh;
    }
    if (indexPath.section == 3) {
        if (indexPath.row == 0) {
            return 10 + 15 +2;
        }
        if (indexPath.row == 3) {
            return 50;
        }
        NSString * str = @"课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程";
        CGFloat lh = [MCToolsManage heightforString:str andWidth:Main_Screen_Width - 40 fontSize:14];
        CGFloat viewh =  10+30+10 + lh + 10+20 + 5;
        return viewh;

    }
    
    return 44;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellid = @"CourseDetailsTableViewCell";
    CourseDetailsTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell = [[CourseDetailsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
        cell.selectionStyle = UITableViewCellEditingStyleNone;
    }
    if (indexPath.section == 0) {
        [cell prepareUI6];
        [cell.headerBtn addTarget:self action:@selector(actionHearderBtn) forControlEvents:1<<6];
        return cell;
    }
    if (indexPath.section == 1) {
        [cell prepareUI];
        return cell;
    }
    if (indexPath.section == 2) {
        [cell prepareUI2];
        [cell.moreBtn addTarget:self action:@selector(actionhour) forControlEvents:1<<6];
        return cell;
    }
    if (indexPath.section == 3) {
        if (indexPath.row == 0) {
            [cell prepareUI4];
            return cell;

        }
        if (indexPath.row == 3) {
            [cell prepareUI5];
            [cell.more2Btn addTarget:self action:@selector(actionMorePj) forControlEvents:UIControlEventTouchUpInside];
            return cell;
            
        }

        if (indexPath.row!=3) {
            [cell prepareUI3];
            return cell;
        }

    }

   
    
    
    return [[UITableViewCell alloc]init];
}

#pragma mark-更多评价
-(void)actionMorePj{
    
    CourseAllEvaluateViewController * ctl = [[CourseAllEvaluateViewController alloc]init];
    [self pushNewViewController:ctl];
}
#pragma mark-更多课时
-(void)actionhour{
    HourViewController * ctl = [[HourViewController alloc]init];
    [self pushNewViewController:ctl];

    
}
#pragma mark-查看老师
-(void)actionHearderBtn{
    if (!_headerBtnON) {
        TeacherCardViewController * ctl =[[TeacherCardViewController alloc]init];
        [self pushNewViewController:ctl];
    }
   
}
#pragma mark-试听
-(void)actionST{
    MakeAcceptViewController * ctl =[[MakeAcceptViewController alloc]init];
    [self pushNewViewController:ctl];
}
#pragma mark-
-(void)actionCallClass{
    OKOrderViewController * ctl =[[OKOrderViewController alloc]init];
    [self pushNewViewController:ctl];
}
#pragma mark-管理课时
-(void)actionClasstoos{
    
    BonusManViewController * ctl =[[BonusManViewController alloc]init];
    [self pushNewViewController:ctl];

    
}
-(void)actionQJ{
    LeaveViewController * ctl =[[LeaveViewController alloc]init];
    [self pushNewViewController:ctl];
    
}
-(void)actionTB{
    melodyViewController * ctl =[[melodyViewController alloc]init];
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
