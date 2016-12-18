//
//  ApplyViewController.m
//  ZYStudent
//
//  Created by MC on 2016/12/18.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "ApplyViewController.h"
#import "OKOrderTableViewCell.h"
#import "SelectSonViewController.h"
#import "PayViewController.h"
@interface ApplyViewController ()<UITableViewDataSource,UITableViewDelegate,SelectSondelegare>
{
    
    UITableView *_tableView;
    
}

@end

@implementation ApplyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我要报名";
    [self prepareUI];
    // Do any additional setup after loading the view.
}
-(void)prepareUI{
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, Main_Screen_Width, Main_Screen_Height - 64) style:UITableViewStyleGrouped];
    _tableView.delegate =self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    [self preparefooerView];
}
-(void)preparefooerView{
    
    UIView * view =[[UIView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, 100)];
    _tableView.tableFooterView = view;
    UIButton * btn =[[UIButton alloc]initWithFrame:CGRectMake(30, 15, Main_Screen_Width - 60, 40)];
    btn.backgroundColor = AppMCNACOLOR;
    btn.titleLabel.font =[UIFont systemFontOfSize:15];
    [btn setTitle:@"提交" forState:0];
    UIColor * cc = AppMCNATitleCOLOR;
    [btn setTitleColor:cc forState:0];
    [btn addTarget:self action:@selector(actionBtn) forControlEvents:1<<6];
    [view addSubview:btn];
    ViewRadius(btn, 3);
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
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
        cell.accessoryType= UITableViewCellAccessoryDisclosureIndicator;

        [cell prepareUI4];
        return cell;
        

    }
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {


            [cell prepareUI3];
            cell.titleLbl.text = @"联系方式";
            cell.phoneText.placeholder = @"请输入手机号码";
            return cell;

        }
        else
        {
            [cell prepareUI3];
            cell.titleLbl.text = @"备注";
            cell.phoneText.placeholder = @"请输入备注，限20字";
            return cell;
  
        }
        
    }
    
    return [[UITableViewCell alloc]init];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0) {
        
        SelectSonViewController * ctl =[[SelectSonViewController alloc]init];
        ctl.delegate = self;
        [self pushNewViewController:ctl];
        
        
        
    }

    
    
}
-(void)actionBtn{
    
    PayViewController * ctl =[[PayViewController alloc]init];
    [self pushNewViewController:ctl];
 
    
    
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
