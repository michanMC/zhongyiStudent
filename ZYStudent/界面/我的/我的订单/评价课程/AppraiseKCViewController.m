//
//  AppraiseKCViewController.m
//  ZYStudent
//
//  Created by MC on 2016/12/20.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "AppraiseKCViewController.h"
#import "OrderDatasiltTableViewCell.h"
#import "UIPlaceHolderTextView.h"
#import "ItemView.h"
@interface AppraiseKCViewController ()<UITableViewDelegate,UITableViewDataSource,ItemViewDelegate>
{
    
    UITableView * _tableView;
    
    ItemView *_itemView;
    UIView * bgview;
    
    UIPlaceHolderTextView * TextView;
    
}

@end

@implementation AppraiseKCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"评价课程";
    [self prepareUI];
    // Do any additional setup after loading the view.
}
-(void)prepareUI{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, Main_Screen_Width, Main_Screen_Height - 64) style:UITableViewStyleGrouped];
    _tableView.delegate =self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    [self prepareFooerView];
    
}

-(void)prepareFooerView{
    
    
    
    bgview =[[UIView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, 10 + 30 + 130 + 10)];
    
    _tableView.tableFooterView = bgview;
    
    
    UIView * view =[[UIView alloc]initWithFrame:CGRectMake(10, 10, Main_Screen_Width - 20, 30+130)];
    [bgview addSubview:view];
    view.backgroundColor =[UIColor whiteColor];
    ViewBorderRadius(view, 3, 1, [UIColor groupTableViewBackgroundColor]);
    
    HCSStarRatingView*  _starRatingView  = [[HCSStarRatingView alloc] initWithFrame:CGRectMake(10, 5, view.mj_w/3, 20)];
    _starRatingView.maximumValue = 5;
    _starRatingView.minimumValue = 0;
    _starRatingView.value = 0;
    _starRatingView.tintColor = [UIColor redColor];
//    _starRatingView.enabled = NO;
    [view addSubview:_starRatingView];

    UIView * lineView =[[UIView alloc]initWithFrame:CGRectMake(10, 30, view.mj_w - 20, 0.5)];
    lineView.backgroundColor =[UIColor groupTableViewBackgroundColor];
    [view addSubview:lineView];

    
    TextView =[[UIPlaceHolderTextView alloc]initWithFrame:CGRectMake(10, 30.5 + 5, view.mj_w - 20, 120)];
    TextView.placeholder = @"请输入评价内容";
    TextView.font = [UIFont systemFontOfSize:14];
    [view addSubview:TextView];
    
    
    
    _itemView = [[ItemView alloc] initWithFrame:CGRectMake(10, 10 + 30 + 130 + 10, bgview.mj_w - 10 , 100)];
    _itemView.backgroundColor = [UIColor clearColor];
    
    _itemView.delegate = self;
    _itemView.itemHeith = 25;
    _itemView.itemArray = @[@"的萨芬",@"撒旦飞洒地方",@"阿斯顿",@"撒地方",@"阿斯顿发送到",@"阿斯蒂芬斯蒂芬",@"撒地方",@"撒地方都是"];
    [bgview addSubview:_itemView];

    
    
    
}
#pragma mark-_itemView代理
-(void)itemH:(CGFloat)itemh
{

    CGFloat h =  10 + 30 + 130 + 10 +itemh;
    _itemView.frame = CGRectMake(CGRectGetMinX(_itemView.frame), CGRectGetMinY(_itemView.frame), CGRectGetWidth(_itemView.frame), itemh );

    bgview.frame = CGRectMake(bgview.mj_x, bgview.mj_y, bgview.mj_w, h + 64 + 35 + 20);

    
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(30, h + 64, bgview.mj_w - 60, 40)];
    [btn setTitle:@"提交评价" forState:0];
    UIColor *cc = AppMCNATitleCOLOR;
    [btn setTitleColor:cc forState:0];
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    btn.backgroundColor = AppMCNACOLOR;
    [bgview addSubview:btn];

    
}
-(void)seleIndex:(NSInteger)index
{
    
    
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
    
    CGFloat h = MCAdaptiveH(750, 240, Main_Screen_Width);
    return  h + 20;

    return 44;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellid = @"OrderDatasiltTableViewCell";
    
    OrderDatasiltTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell =[[OrderDatasiltTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
        [cell prepareUI2];
        
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
