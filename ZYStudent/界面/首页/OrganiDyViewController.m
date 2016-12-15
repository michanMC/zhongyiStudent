//
//  OrganiDyViewController.m
//  ZYStudent
//
//  Created by MC on 2016/12/12.
//  Copyright © 2016年 MC. All rights reserved.
//
#import "OrganiDyViewController.h"
#import "MyDetailsViewController.h"
#import "OrganTableViewCell.h"
@interface OrganiDyViewController ()<UITableViewDelegate,UITableViewDataSource>

{
    
    UITableView*_tableView;
    UIButton * _topBtn;
    
}

@end

@implementation OrganiDyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self prepareUI];

    // Do any additional setup after loading the view.
}
-(void)prepareUI{
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, self.view.mj_h-49-44-64) style:UITableViewStyleGrouped];
    _tableView.delegate =self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    [self prepareHeaderView];
    _topBtn = [[UIButton alloc]initWithFrame:CGRectMake(Main_Screen_Width - 5 - 128/2, _tableView.mj_h  - 5 - 110/2, 128/2, 110/2)];
    [_topBtn setImage:[UIImage imageNamed:@"btn_top"] forState:0];
    _topBtn.hidden = YES;
    [self.view addSubview:_topBtn];
    
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.001;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat h = 0;
    if (indexPath.row == 0) {
      h  = 10 +95 + 40;

    }
    else if (indexPath.row == 1){
        
        NSString * str = @"今天今天今天今天今天今天今天今天今天今天今天今天今天今天今天今天今天今天今天";
        CGFloat x = 15 + 25 +10;
        CGFloat  w = Main_Screen_Width - x - 25;

       CGFloat lh = [MCToolsManage heightforString:str andWidth:w fontSize:14];
       CGFloat ih = (w - 10)/3;
      
        NSInteger count = 9;
        for (NSInteger i = 0; i < count; i++) {
            if ((i == 2||i == 5)&&count != 2&&count !=5) {
                ih +=(w - 10)/3+5;

            }
            else
            {
            }
            
        }

        h = 25  + 20 +10+lh +14+ih + 25;
        
        
    }
    else if (indexPath.row == 2){
         h = 25 + 5 +95 + 30;

    }
    else if (indexPath.row == 3){
        NSString * str = @"今天今天今天今天今天今天今天今天今天今天今天今天今天今天今天今天今天今天今天";
        
        CGFloat lh = [MCToolsManage heightforString:str andWidth:Main_Screen_Width -25 - 15 - 25 - 10 - 10 fontSize:14];
        

        h = 25 + 20 + 10 + 8 + 20 + 8 + lh + 8 + 30;

        
    }
    return h;
    //    return 44;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString * cellid = @"OrganTableViewCell";
    
    OrganTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell =[[OrganTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    if (indexPath.row == 0) {
        [cell prepareUI1];
        return cell;

 
    }
    else if (indexPath.row == 1){
        [cell prepareUI2];
        return cell;

    }
    else if (indexPath.row == 2){
        [cell prepareUI3];
        return cell;
        
    }else if (indexPath.row == 3){
        [cell prepareUI4];
        return cell;
        
    }



    
    
    
    
    return [[UITableViewCell alloc]init];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(indexPath.row == 1){
        MyDetailsViewController * ctl =[[MyDetailsViewController alloc]init];
        ctl.title = @"动态详情";
        ctl.indexCtl = 1;
        [self pushNewViewController:ctl];

    }
    
    
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
    if( scrollView.mj_offsetY>=Main_Screen_Height){
        
        _topBtn.hidden = NO;
    }
    else
    {
        _topBtn.hidden = YES;
        
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
