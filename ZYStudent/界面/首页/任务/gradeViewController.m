//
//  gradeViewController.m
//  ZYStudent
//
//  Created by MC on 2016/12/15.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "gradeViewController.h"
#import "gradeViewTableViewCell.h"
@interface gradeViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
    
}

@end

@implementation gradeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =@"等级说明";
    [self prepareUI];
    // Do any additional setup after loading the view.
}
-(void)prepareUI{
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, Main_Screen_Width, Main_Screen_Height - 64) style:UITableViewStyleGrouped];
    _tableView.delegate =self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    _tableView.backgroundColor =[UIColor whiteColor];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
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
    NSString * str = @"广州紫鲸互联网科技有限公司（Guangzhou Zijing Internet Technology Co.,Ltd）前身是深圳粉果科技，注册资金为1000万。总部在广州，佛山设立分公司，同时在深圳设立办事处。紫鲸互联以“为新经济体护航“为企业使命，致力于APP定制开发业务与APP运营推广全案服务。";
  CGFloat  h =  [MCToolsManage heightforString:str andWidth:Main_Screen_Width - 20 fontSize:14] + 10 + MCAdaptiveH(750, 420, Main_Screen_Width);
    return h;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString * cellid = @"gradeViewTableViewCell";
    
    gradeViewTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell =[[gradeViewTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    
    [cell prepareUI];
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
