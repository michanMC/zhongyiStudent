//
//  OrderDatasiltViewController.m
//  ZYStudent
//
//  Created by MC on 2016/12/20.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "OrderDatasiltViewController.h"
#import "OKOrderTableViewCell.h"
#import "OrderDatasiltTableViewCell.h"
#import "OrganiDetailsViewController.h"
#import "PayViewController.h"
@interface OrderDatasiltViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    
    UITableView *_tableView;
    
}

@end

@implementation OrderDatasiltViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"订单详情";
    [self prepareUI];
    // Do any additional setup after loading the view.
}
-(void)prepareUI{
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, Main_Screen_Width, Main_Screen_Height - 64 - 49) style:UITableViewStyleGrouped];
    _tableView.delegate =self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    [self preparefooerView];
    
    [self preparebarView];

    
}
-(void)preparefooerView{
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, 100)];
    _tableView.tableFooterView = view;
    
    CGFloat x = 0;
    CGFloat y = 30;
    CGFloat w =Main_Screen_Width - 10;
    CGFloat h = 20;
    UILabel * lbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.text = @"实付款:￥36.00";
    lbl.textColor = [UIColor grayColor];
    lbl.font = [UIFont systemFontOfSize:14];
    lbl.textAlignment = NSTextAlignmentRight;
    
    [view addSubview:lbl];
    y +=h + 5;
    lbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.text = @"下单时间:2016-06-09 15:13:00";
    lbl.textColor = [UIColor grayColor];
    lbl.font = [UIFont systemFontOfSize:14];
    lbl.textAlignment = NSTextAlignmentRight;
    
    [view addSubview:lbl];

    
    
    
    
    
    
    
    
}
-(void)preparebarView{
    UIView *bgview =[[UIView alloc]initWithFrame:CGRectMake(0, Main_Screen_Height - 49, Main_Screen_Width, 49)];
    bgview.backgroundColor =[UIColor clearColor];
    
    [self.view addSubview:bgview];

    UIColor * cc = AppMCNATitleCOLOR;

    
    
    
    
    
    
    //去支付
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = Main_Screen_Width/2;
    CGFloat h = 49;
    
    
//    w = Main_Screen_Width;
//    UIButton * btn2 =[[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
//    btn2.backgroundColor =AppMCNACOLOR;
//    [btn2 setTitle:@"去评论" forState:0];
//    [btn2 setTitleColor:cc forState:0];
//    btn2.titleLabel.font =[UIFont systemFontOfSize:14];
//    [bgview addSubview:btn2];
//    
    
    
    
    
    UIButton * btn1 =[[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
    btn1.backgroundColor =[UIColor whiteColor];
    [btn1 setTitle:@"取消订单" forState:0];
    [btn1 setTitleColor:[UIColor darkTextColor] forState:0];
    btn1.titleLabel.font =[UIFont systemFontOfSize:14];
    [bgview addSubview:btn1];
    
    x +=w;
    
    UIButton * btn2 =[[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
    btn2.backgroundColor =AppMCNACOLOR;
    [btn2 setTitle:@"去支付" forState:0];
    [btn2 setTitleColor:cc forState:0];
    btn2.titleLabel.font =[UIFont systemFontOfSize:14];
    [btn2 addTarget:self action:@selector(actionpayBtn) forControlEvents:1<<6];
    [bgview addSubview:btn2];

    
    
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 2;
    }
    else if ( section == 1){
        return 1;
    }
    return 2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    
    
    return 0.001;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    if (indexPath.section == 0) {
        if (indexPath.row == 1) {
            CGFloat h = MCAdaptiveH(750, 240, Main_Screen_Width);
            return  h + 20;

        }
    }
    if (indexPath.section == 1) {
        return 50;
    }
    return 44;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0) {
        
        static NSString * cellid = @"OrderDatasiltTableViewCell";
        
        OrderDatasiltTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid];
        if (!cell) {
            cell =[[OrderDatasiltTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        if (indexPath.row == 0) {
            [cell prepareUI1];
            cell.stateLbl.textColor = AppMCNATitleCOLOR;
            cell.stateLbl.text = @"待支付";
            
            return cell;

        }
        else if (indexPath.row == 1){
            [cell prepareUI2];

            return cell;
   
        }
        
        

        
        
    }
    
    
    
    if (indexPath.section == 1) {
        static NSString * cellid = @"OKOrderTableViewCell";
        OKOrderTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid];
        if (!cell) {
            cell =[[OKOrderTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        cell.accessoryType= UITableViewCellAccessoryNone;
        
            [cell prepareUI4];
            return cell;
        
    
    
    }

    if (indexPath.section == 2) {
        static NSString * cellid = @"UITableViewCell";
        
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid];
        if (!cell) {
            cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        if (indexPath.row == 0) {
            cell.textLabel.text = @"联系电话 134200656858";
            cell.textLabel.font = [UIFont systemFontOfSize:14];
            
            
            return cell;

        }
        if(indexPath.row == 1){
            cell.textLabel.text = @"备注 无";
            cell.textLabel.font = [UIFont systemFontOfSize:14];
            
            return cell;

        }
  
    }
    

    return [[UITableViewCell alloc]init];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0 && indexPath.row == 1) {
        
        
        OrganiDetailsViewController * ctl = [[OrganiDetailsViewController alloc]init];
        [self pushNewViewController:ctl];
    }
    
    
}
-(void)actionpayBtn{
    
    PayViewController * ctl =[[PayViewController alloc]init];
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
