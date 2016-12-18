//
//  PayViewController.m
//  ZYStudent
//
//  Created by MC on 2016/12/17.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "PayViewController.h"
#import "PayViewTableViewCell.h"
#import "PayStateViewController.h"

@interface PayViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    
    UITableView *_tableView;
    
}

@end

@implementation PayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"支付";
    [self prepareUI];
    // Do any additional setup after loading the view.
}
-(void)prepareUI{
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, Main_Screen_Width, Main_Screen_Height - 64-49) style:UITableViewStyleGrouped];
    _tableView.delegate =self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    [self prepareheadView];
    
    UIView * view =[[UIView alloc]initWithFrame:CGRectMake(0, Main_Screen_Height - 49, Main_Screen_Width, 49)];
    view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:view];

    UILabel * lbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width/2 + 20, 49)];
    lbl.textColor = AppMCNATitleCOLOR;
    lbl.text =@"应付金额: ￥2300.00";
    lbl.font = [UIFont systemFontOfSize:15];
    lbl.textAlignment = NSTextAlignmentCenter;
    [view addSubview:lbl];
    
    
    UIButton * btn =[[UIButton alloc]initWithFrame:CGRectMake(Main_Screen_Width/2 + 20, 0,  Main_Screen_Width /2 - 20,49)];
    btn.backgroundColor =AppMCNACOLOR;
    [btn setTitle:@"付款" forState:0];
    UIColor *cc = AppMCNATitleCOLOR;
    [btn setTitleColor:cc forState:0];
    btn.titleLabel.font =[UIFont systemFontOfSize:15];
    [btn addTarget:self action:@selector(actionOKbtn) forControlEvents:1<<6];
    [view addSubview:btn];
    
    

    
    
    
}
-(void)actionOKbtn{
    PayStateViewController *ctl =[[PayStateViewController alloc]init];
    ctl.StateStr = @"0";
    
    [self  pushNewViewController:ctl];
    
    
}
-(void)prepareheadView{
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, 40)];
    view.backgroundColor = RGBCOLOR(212, 244, 248);
    _tableView.tableHeaderView = view;
    
    UIImageView * imgview = [[UIImageView alloc]initWithFrame:CGRectMake(15, (40-25)/2, 25, 25)];
    imgview.image =[UIImage imageNamed:@"icon_notice"];
    [view addSubview:imgview];
    UILabel * lbl = [[UILabel alloc]initWithFrame:CGRectMake(15+25 + 10, 0, Main_Screen_Width - 45 -5, 44)];
    lbl.text =@"请在24小时内付款，超时未付款订单将被取消。";
    lbl.textColor = [UIColor grayColor];
    lbl.font = [UIFont systemFontOfSize:14];
    [view addSubview:lbl];
    
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    return 2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 3;
    }
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0) {
        static NSString * cellid = @"UITableViewCellMC";
        
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid];
        if (!cell) {
            cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        cell.textLabel.text = @"订单号  10000000000000";
        
        
        return cell;

    }
    else if (indexPath.section == 1){
        
        static NSString * cellid = @"PayViewTableViewCell";
        
        PayViewTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid];
        if (!cell) {
            cell =[[PayViewTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        
        [cell prepareUI];
        cell.selectimg.hidden = YES;

        if (indexPath.row == 0) {
            cell.imgview.image =[UIImage imageNamed:@"icon_wechat"];
            cell.titleLbl.text = @"微信支付";
            cell.selectimg.hidden = NO;
            return cell;

        }
        if (indexPath.row == 1) {
            cell.imgview.image =[UIImage imageNamed:@"icon_alipay"];
            cell.titleLbl.text = @"支付宝支付";
            cell.selectimg.hidden = YES;
            return cell;
            
        }
        

        
        return cell;

    }
    
    
    return [[UITableViewCell alloc]init];
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
