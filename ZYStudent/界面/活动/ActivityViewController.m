//
//  ActivityViewController.m
//  ZYStudent
//
//  Created by MC on 2016/12/14.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "ActivityViewController.h"
#import "ActivityTableViewCell.h"
#import "ActivityDetailsViewController.h"

@interface ActivityViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    
    UITableView *_tableView;
    
    
}

@end

@implementation ActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"活动";
    [self prepareUI];
    
    // Do any additional setup after loading the view.
}
-(void)prepareUI{
    
    CGFloat yy = 49;
    if (_mectl) {
        yy = 0;
    }
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, Main_Screen_Width, Main_Screen_Height - 64-yy) style:UITableViewStyleGrouped];
    _tableView.delegate =self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    _tableView.backgroundColor =AppBgCOLOR;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
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
    CGFloat viewh = 5 + 40 + 10 + 15 + 5 +MCAdaptiveH(750, 250, Main_Screen_Width) + 50;

    return viewh;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellid = @"ActivityTableViewCell";
    
    ActivityTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell =[[ActivityTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    
    [cell prepareUI];
    UIColor * cc = AppMCNATitleCOLOR;
    UIColor * cc2 = [UIColor orangeColor];
    UIColor * cc3 = kUIColorFromRGB(0x53dc7c);

    if (indexPath.section == 0) {
        [cell.tepyBtn setTitle:@"报名中" forState:0];
        [cell.tepyBtn setTitleColor:cc forState:0];
        ViewBorderRadius(cell.tepyBtn, 3, 1, cc);
        return cell;
        
    }
    if (indexPath.section == 1) {
        [cell.tepyBtn setTitle:@"已结束" forState:0];
        [cell.tepyBtn setTitleColor:[UIColor lightGrayColor] forState:0];
        ViewBorderRadius(cell.tepyBtn, 3, 1, [UIColor lightGrayColor]);
        return cell;
        
    }
    if (indexPath.section == 2) {
        [cell.tepyBtn setTitle:@"进行中" forState:0];
        [cell.tepyBtn setTitleColor:cc2 forState:0];
        ViewBorderRadius(cell.tepyBtn, 3, 1, cc2);
        return cell;
        
    }
    if (indexPath.section == 3) {
        [cell.tepyBtn setTitle:@"未开始" forState:0];
        [cell.tepyBtn setTitleColor:cc3 forState:0];
        ViewBorderRadius(cell.tepyBtn, 3, 1, cc3);
        return cell;
        
    }
    return cell;
    

    
    
    
    
    return [[UITableViewCell alloc]init];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    ActivityDetailsViewController * ctl =[[ActivityDetailsViewController alloc]init];
    
    ctl.stateindex = indexPath.section +1;
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
