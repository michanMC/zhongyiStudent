//
//  NewFriViewController.m
//  ZYStudent
//
//  Created by MC on 2016/12/14.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "NewFriViewController.h"
#import "FriendlistTableViewCell.h"
@interface NewFriViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView * _tableView;
}
@end

@implementation NewFriViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"新的朋友";
    [self prepareUI];
    // Do any additional setup after loading the view.
}
-(void)prepareUI{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, Main_Screen_Width, Main_Screen_Height - 64) style:UITableViewStyleGrouped];
    _tableView.delegate =self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.001;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 55;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString * cellid = @"FriendlistTableViewCell";
    
    FriendlistTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell =[[FriendlistTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    
    [cell prepareUI2];
    cell.okBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    ViewRadius(cell.okBtn, 5);

    if (indexPath.row == 0) {
        [cell.okBtn setTitle:@"同意" forState:0];
        UIColor *cc = AppMCNATitleCOLOR;
        [cell.okBtn setTitleColor:cc forState:0];
        cell.okBtn.backgroundColor = AppMCNACOLOR;
        
        return cell;

    }
    else if(indexPath.row == 1){
        [cell.okBtn setTitle:@"已添加" forState:0];
        UIColor *cc = [UIColor lightGrayColor];
        [cell.okBtn setTitleColor:cc forState:0];
        cell.okBtn.backgroundColor = [UIColor whiteColor];

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
