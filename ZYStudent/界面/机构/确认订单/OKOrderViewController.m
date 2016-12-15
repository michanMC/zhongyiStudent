//
//  OKOrderViewController.m
//  ZYStudent
//
//  Created by MC on 2016/12/15.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "OKOrderViewController.h"
#import "OKOrderTableViewCell.h"
#import "SelectSonViewController.h"

@interface OKOrderViewController ()<UITableViewDelegate,UITableViewDataSource,SelectSondelegare>
{
    
    UITableView *_tableView;
    
    
}

@end

@implementation OKOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"确认订单";
    [self prepareUI];
    // Do any additional setup after loading the view.
}
-(void)prepareUI{
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, Main_Screen_Width, Main_Screen_Height - 64-49) style:UITableViewStyleGrouped];
    _tableView.delegate =self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    UIView * view =[[UIView alloc]initWithFrame:CGRectMake(0, Main_Screen_Height - 49, Main_Screen_Width, 49)];
    view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:view];

    UILabel * lbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width/2 + 20, 49)];
    lbl.textColor = AppMCNATitleCOLOR;
    lbl.text =@"订单总额: ￥2300.00";
    lbl.font = [UIFont systemFontOfSize:15];
    lbl.textAlignment = NSTextAlignmentCenter;
    [view addSubview:lbl];
    
    
    UIButton * btn =[[UIButton alloc]initWithFrame:CGRectMake(Main_Screen_Width/2 + 20, 0,  Main_Screen_Width /2 - 20,49)];
    btn.backgroundColor =AppMCNACOLOR;
    [btn setTitle:@"提交订单" forState:0];
    UIColor *cc = AppMCNATitleCOLOR;
    [btn setTitleColor:cc forState:0];
    btn.titleLabel.font =[UIFont systemFontOfSize:15];
    [view addSubview:btn];

    
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        CGFloat viewh = MCAdaptiveH(750, 280, Main_Screen_Width);
        return viewh;

    }
    if(indexPath.section == 1){
        return 50;
        
    }
    
    
    return 44;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString * cellid = @"OKOrderTableViewCell";
    
    OKOrderTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell =[[OKOrderTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.accessoryType= UITableViewCellAccessoryNone;
    if (indexPath.section == 0) {
        [cell prepareUI1];
        return cell;

    }
    if (indexPath.section == 1) {
        cell.accessoryType= UITableViewCellAccessoryDisclosureIndicator;

        [cell prepareUI4];
        return cell;
        
    }
    if (indexPath.section == 2) {
        [cell prepareUI3];
        return cell;
        
    }


    

    
    
    
    return [[UITableViewCell alloc]init];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    if (indexPath.section ==1) {
        SelectSonViewController * ctl =[[SelectSonViewController alloc]init];
        ctl.delegate = self;
        [self pushNewViewController:ctl];
        

    }
    
}
-(void)selectSon
{
    
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
