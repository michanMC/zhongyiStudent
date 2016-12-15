//
//  SearchViewController.m
//  ZYStudent
//
//  Created by MC on 2016/12/15.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "SearchViewController.h"
#import "CourselistTableViewCell.h"
#import "OrganiDetailsViewController.h"
@interface SearchViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
    
    UITextField * _Searchtext;
}

@end

@implementation SearchViewController
-(void)actionr{
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"课程";
    [self prepareUI];
    self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(actionr)];

    
    UIImageView * bgview = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width - 15 - 15 - 30 - 15, 52/2)];
        bgview.backgroundColor = [UIColor whiteColor];
    ViewBorderRadius(bgview, 52/4, 1, [UIColor groupTableViewBackgroundColor]);
    self.navigationItem.titleView =bgview;
    bgview.userInteractionEnabled = YES;
    
    UIImageView * img = [[UIImageView alloc]initWithFrame:CGRectMake(10, (52/2 - 15)/2, 15, 15)];
    img.image =[UIImage imageNamed:@"icon_search"];
    [bgview addSubview:img];
    
    
    _Searchtext = [[UITextField alloc]initWithFrame:CGRectMake(10 + 15 + 5, 0, 200 , 52/2)];
    _Searchtext.placeholder = @"搜索课程";
    _Searchtext.textColor = [UIColor lightGrayColor];
    _Searchtext.font = [UIFont systemFontOfSize:14];
    _Searchtext.clearButtonMode = UITextFieldViewModeAlways;
    [bgview addSubview:_Searchtext];

    
    
    
    // Do any additional setup after loading the view.
}
-(void)prepareUI{
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, Main_Screen_Width, Main_Screen_Height - 64) style:UITableViewStyleGrouped];
    _tableView.delegate =self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}
-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    
    
    return @"  课程";
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat viewh = MCAdaptiveH(750, 280, Main_Screen_Width);

    return viewh;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString * cellid = @"CourselistTableViewCell";
    
    CourselistTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell =[[CourselistTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
//    cell.index = 1;
    [cell prepareUI];
    return cell;
    
    return [[UITableViewCell alloc]init];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    OrganiDetailsViewController * ctl = [[OrganiDetailsViewController alloc]init];
    [self pushNewViewController:ctl];

}
-(void)viewDidLayoutSubviews {
    if (IOS7) {
        
        if ([_tableView respondsToSelector:@selector(setSeparatorInset:)]) {
            [_tableView setSeparatorInset:UIEdgeInsetsZero];
            
        }
        if ([_tableView respondsToSelector:@selector(setLayoutMargins:)])  {
            [_tableView setLayoutMargins:UIEdgeInsetsZero];
        }
    }
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPat{
    if (IOS8) {
        
        if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
            [cell setLayoutMargins:UIEdgeInsetsZero];
        }
        if ([cell respondsToSelector:@selector(setSeparatorInset:)]){
            [cell setSeparatorInset:UIEdgeInsetsZero];
        }
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
