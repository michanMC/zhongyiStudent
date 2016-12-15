//
//  MyDynamicViewController.m
//  ZYStudent
//
//  Created by MC on 2016/12/12.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "MyDynamicViewController.h"
#import "MyDynamicTableViewCell.h"
#import "MyDetailsViewController.h"
#import "PubliShrouteViewController.h"

@interface MyDynamicViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    
    UITableView*_tableView;
    UIButton * _topBtn;
}

@end

@implementation MyDynamicViewController

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
    [self prepareHeaderView];
    _topBtn = [[UIButton alloc]initWithFrame:CGRectMake(Main_Screen_Width - 5 - 128/2, _tableView.mj_h  - 5 - 110/2, 128/2, 110/2)];
    [_topBtn setImage:[UIImage imageNamed:@"btn_top"] forState:0];
    _topBtn.hidden = YES;
    [self.view addSubview:_topBtn];
    
    
    
}
-(void)prepareHeaderView{
    CGFloat h = MCAdaptiveH(750, 220, Main_Screen_Width);
    CGFloat x = 0;
    CGFloat y =0;
    CGFloat w= Main_Screen_Width;
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    view.backgroundColor =[UIColor whiteColor];
    _tableView.tableHeaderView = view;
    
    x = 15;
    y = 10;
    w = 25;
    h = 25;
    
    
    UIImageView * imgview = [[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    imgview.image =[UIImage imageNamed:@"icon_camera"];
    [view addSubview:imgview];
    
    x +=w+7;
    w = Main_Screen_Width - x;
    UILabel * lbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.textColor = [UIColor grayColor];
    lbl.text = @"今天发布的精彩内容";
    lbl.font =[UIFont systemFontOfSize:16];
    [view addSubview:lbl];

    x = 25;
    h =35;
   y = view.mj_h - 50/2  - h;
    w = Main_Screen_Width - x - 35;
    
    UIButton * addBtn = [[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
    [addBtn setImage:[UIImage imageNamed:@"btn_add-pic"] forState:0];
    [addBtn addTarget:self action:@selector(actionadd) forControlEvents:1<<6];
    [view addSubview:addBtn];
    
}
-(void)actionadd{
    
    PubliShrouteViewController * ctl =[[PubliShrouteViewController alloc]init];
    [self pushNewViewController:ctl];
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
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.001;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
  CGFloat w=  Main_Screen_Width - 15 - 25 - 7 - 10;
  CGFloat h = [MCToolsManage heightforString:@"下午下午下午下午下午下午下午下午下午下午下午下午下午下午下午下午下午下午下午下午下午下午下午下午下午下午下午下午下午下午下午下午下午" andWidth:w fontSize:15];
   CGFloat ih = MCAdaptiveH(750, 406, Main_Screen_Width);

   return 25+5+h+8+ih+56/2;
//    return 44;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString * cellid = @"MyDynamicTableViewCell";
    
    MyDynamicTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell =[[MyDynamicTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    
    [cell prepareUI];
    return cell;
    

    
    
    return [[UITableViewCell alloc]init];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyDetailsViewController * ctl =[[MyDetailsViewController alloc]init];
    ctl.title = @"行程详情";
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
