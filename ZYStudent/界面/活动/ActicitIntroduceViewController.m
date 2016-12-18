//
//  ActicitIntroduceViewController.m
//  ZYStudent
//
//  Created by MC on 2016/12/18.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "ActicitIntroduceViewController.h"
#import "ZJScrollPageView.h"
#import "ActivityApplyTableViewCell.h"
@interface ActicitIntroduceViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    
    
    UITableView *_tableView;
    
    
}

@end

@implementation ActicitIntroduceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self prepareUI];
    
    
    // Do any additional setup after loading the view.
}
-(void)prepareUI{
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, self.view.mj_h -64) style:UITableViewStyleGrouped];
    _tableView.delegate =self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = [UIColor whiteColor];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.001;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString * ss = @"手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机";
 CGFloat h = [MCToolsManage heightforString:ss andWidth:Main_Screen_Width - 20 fontSize:14];
   
    
    h += 10 + 40 + 10 + 10 + MCAdaptiveH(750, 400,Main_Screen_Width);
    return h;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    static NSString * cellid = @"ActivityApplyTableViewCell";
    
    ActivityApplyTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell =[[ActivityApplyTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    [cell prepareUI3];
    return cell;
    

    
    
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
