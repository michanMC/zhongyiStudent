//
//  OrganizationViewController.m
//  ZYStudent
//
//  Created by MC on 2016/12/14.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "OrganizationViewController.h"
#import "SearchViewController.h"
#import "MCimgRBtn.h"
#import "CourselistTableViewCell.h"
#import "OrganiDetailsViewController.h"
#import "MCTableSelectView.h"
#import "MyLocationViewController.h"

@interface OrganizationViewController ()<UITableViewDelegate,UITableViewDataSource,MCTableSelectDelegate>
{
    UILabel * locationLbl;
    
    UILabel * _regionLbl;
    UILabel * _courseLbl;
    UILabel * _sortLbl;
    
    NSString * _regionStr;
    NSString * _courseStr;
    NSString * _sortStr;
    
    UIImageView * _regionimg;
    UIImageView * _courseimg;
    UIImageView * _sortimg;
    
    UIButton * _regionbtn;
    UIButton * _coursebtn;
    UIButton * _sortbtn;

    
    UITableView * _tableView;
    MCTableSelectView * TableSelectView;
    
    NSInteger showindex;//当前展示的SelectView  0隐藏 1地区 2课程 3 排序
    
    
}

@end

@implementation OrganizationViewController
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self MCTableSelecthidden];

    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
   _regionStr = @"地区";
    _courseStr = @"课程类别";
    _sortStr = @"综合排序";

    
    
    
    UIView * lview =[[UIView alloc]initWithFrame:CGRectMake(0, 0, 50, 44)];
    
    locationLbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 30, 44)];
    locationLbl.text = @"广州";
    locationLbl.textColor = AppMCNATitleCOLOR;
    locationLbl.font =[UIFont systemFontOfSize:14];
    locationLbl.textAlignment =NSTextAlignmentRight;
    [lview addSubview:locationLbl];
    UIImageView * imgview =[[UIImageView alloc]initWithFrame:CGRectMake(30, 12, 20, 20)];
    imgview.image =[UIImage imageNamed:@"nav_cbb"];
    UIButton * locaBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 44)];
    [locaBtn addTarget:self action:@selector(actiola) forControlEvents:1<<6];
    
    [lview addSubview:locaBtn];
    [lview addSubview:imgview];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:lview];
    
    UIButton * seachbtn = [[UIButton alloc]initWithFrame:CGRectMake(7 + 30 + 15, 0, Main_Screen_Width - 15 - 15 - 30 - 15, 52/2)];
    seachbtn.backgroundColor = [UIColor whiteColor];
    ViewBorderRadius(seachbtn, 52/4, 1, [UIColor groupTableViewBackgroundColor]);
    [seachbtn addTarget:self action:@selector(actionseach) forControlEvents:1<<6];
    self.navigationItem.titleView =seachbtn;
    
    
    UIImageView * img = [[UIImageView alloc]initWithFrame:CGRectMake(10, (52/2 - 15)/2, 15, 15)];
    img.image =[UIImage imageNamed:@"icon_search"];
    [seachbtn addSubview:img];
    UILabel * lbl = [[UILabel alloc]initWithFrame:CGRectMake(10 + 15 + 5, 0, 150, 52/2)];
    lbl.text = @"搜索课程";
    lbl.textColor = [UIColor lightGrayColor];
    lbl.font = [UIFont systemFontOfSize:14];
    [seachbtn addSubview:lbl];

    
    self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_code"] style:UIBarButtonItemStylePlain target:self action:@selector(actionSao)];
    
    [self prepareUI];
    // Do any additional setup after loading the view.
}
-(void)prepareUI{
    
    UIView * headview =[[UIView alloc]initWithFrame:CGRectMake(0, 64, Main_Screen_Width, 44)];
    headview.backgroundColor =[UIColor whiteColor];
    
    [self.view addSubview:headview];
    
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w= Main_Screen_Width/3;
    CGFloat h =44;
    
    UIView * view1 = [[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    _regionLbl =[[UILabel alloc]init];
    _regionLbl.textColor =[UIColor darkTextColor];
    _regionLbl.font =[UIFont systemFontOfSize:14];
    [view1 addSubview:_regionLbl];
    _regionimg = [[UIImageView alloc]initWithFrame:CGRectMake(0, (h - 20)/2, 20, 20)];
    _regionimg.image =[ UIImage imageNamed:@"nav_cbb2"];
    _regionbtn =[[UIButton alloc]initWithFrame:CGRectMake(0, 0, w, h)];
    [_regionbtn addTarget:self action:@selector(actionRegbtn) forControlEvents:1<<6];
    [view1 addSubview:_regionbtn];

    [view1 addSubview:_regionimg];
    
    
    [headview addSubview:view1];
    
    x+=w;
    
     view1 = [[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    _courseLbl =[[UILabel alloc]init];
    _courseLbl.textColor =[UIColor darkTextColor];
    _courseLbl.font =[UIFont systemFontOfSize:14];
    [view1 addSubview:_courseLbl];
    _courseimg = [[UIImageView alloc]initWithFrame:CGRectMake(0, (h - 20)/2, 20, 20)];
    _courseimg.image =[ UIImage imageNamed:@"nav_cbb2"];
    [view1 addSubview:_courseimg];
    _coursebtn =[[UIButton alloc]initWithFrame:CGRectMake(0, 0, w, h)];
    [view1 addSubview:_coursebtn];
    [_coursebtn addTarget:self action:@selector(actioncoursebtn) forControlEvents:1<<6];


    [headview addSubview:view1];

    
    x+=w;
    
    view1 = [[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    _sortLbl =[[UILabel alloc]init];
    _sortLbl.textColor =[UIColor darkTextColor];
    _sortLbl.font =[UIFont systemFontOfSize:14];
    [view1 addSubview:_sortLbl];
    _sortimg = [[UIImageView alloc]initWithFrame:CGRectMake(0, (h - 20)/2, 20, 20)];
    _sortimg.image =[ UIImage imageNamed:@"nav_cbb2"];
    [view1 addSubview:_sortimg];
    _sortbtn =[[UIButton alloc]initWithFrame:CGRectMake(0, 0, w, h)];
    [view1 addSubview:_sortbtn];
    [_sortbtn addTarget:self action:@selector(actionsortbtn) forControlEvents:1<<6];

    [headview addSubview:view1];
    [self loadTitle];
    [self prepareTableview];
}
-(void)prepareTableview{
    
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64 +44, Main_Screen_Width, Main_Screen_Height - 64 - 44 - 49) style:UITableViewStyleGrouped];
    _tableView.delegate =self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 10;
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
    
        cell.index = 1;
    [cell prepareUI];
    return cell;
    
    return [[UITableViewCell alloc]init];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   OrganiDetailsViewController * ctl = [[OrganiDetailsViewController alloc]init];
    [self pushNewViewController:ctl];
    
}



-(void)loadTitle{
    
    CGFloat w = [MCToolsManage heightforString:_regionStr andHeight:44 fontSize:14];
    CGFloat lx = (Main_Screen_Width/3 - w - 3-20)/2;
    _regionLbl.frame = CGRectMake(lx, 0, w, 44);
    _regionimg.frame = CGRectMake(lx +3+w, _regionimg.mj_y, 20, 20);
    _regionLbl.text = _regionStr;
    
    
    
     w = [MCToolsManage heightforString:_sortStr andHeight:44 fontSize:14];
     lx = (Main_Screen_Width/3 - w - 3-20)/2;
    _sortLbl.frame = CGRectMake(lx, 0, w, 44);
    _sortimg.frame = CGRectMake(lx +3+w, _sortimg.mj_y, 20, 20);
    _sortLbl.text = _sortStr;

    
    w = [MCToolsManage heightforString:_courseStr andHeight:44 fontSize:14];
    lx = (Main_Screen_Width/3 - w - 3-20)/2;
    _courseLbl.frame = CGRectMake(lx, 0, w, 44);
    _courseimg.frame = CGRectMake(lx +3+w, _courseimg.mj_y, 20, 20);
    _courseLbl.text = _courseStr;

    
    
    
}
-(void)actionseach{
    [self MCTableSelecthidden];

    SearchViewController * ctl =[[SearchViewController alloc]init];
    [self pushNewViewController:ctl];
    
    
}
-(void)actionSao{
    [self MCTableSelecthidden];

    
}
-(void)actiola{
    [self MCTableSelecthidden];
    MyLocationViewController *ctl = [[MyLocationViewController alloc]init];
    [self pushNewViewController:ctl];
    
    
}
-(void)actionRegbtn{
    
    if (TableSelectView) {
        if (showindex == 1) {
            [self MCTableSelecthidden];
 
        }
        else
        {
        TableSelectView.dataArray = @[@"天河",@"天河",@"天河",@"天河",@"天河",];
            showindex = 1;

        }
    }
    else{
        
    TableSelectView= [[ MCTableSelectView alloc]initWithFrame:CGRectMake(0, 64+44, Main_Screen_Width , Main_Screen_Height - 108)];
    TableSelectView.dataArray = @[@"天河",@"天河",@"天河",@"天河",@"天河",];
    TableSelectView.deldagate =self;
    [TableSelectView showInWindow];
        showindex = 1;
    }
}
-(void)actioncoursebtn{
    
    if (TableSelectView) {
        
        if (showindex == 2) {
            [self MCTableSelecthidden];
            
        }
        else
        {
            TableSelectView.dataArray = @[@"课程",@"天河",@"天河",@"天河",@"天河"];
            showindex = 2;

        }

//        [self MCTableSelecthidden];
    }
    else{
        TableSelectView= [[ MCTableSelectView alloc]initWithFrame:CGRectMake(0, 64+44, Main_Screen_Width , Main_Screen_Height - 108)];
        TableSelectView.dataArray = @[@"课程",@"天河",@"天河",@"天河",@"天河",];
        TableSelectView.deldagate =self;
        [TableSelectView showInWindow];
        showindex = 2;

    }

    
    
}
-(void)actionsortbtn{
    if (TableSelectView) {
        if (showindex == 3) {
            [self MCTableSelecthidden];
            
        }
        else
        {
            TableSelectView.dataArray = @[@"排序",@"天河",@"天河",@"天河",@"天河",];
            showindex = 3;

        }

//        [self MCTableSelecthidden];
    }
    else{
        TableSelectView= [[ MCTableSelectView alloc]initWithFrame:CGRectMake(0, 64+44, Main_Screen_Width , Main_Screen_Height - 108)];
        TableSelectView.dataArray = @[@"排序",@"天河",@"天河",@"天河",@"天河",];
        TableSelectView.deldagate =self;
        [TableSelectView showInWindow];
        showindex = 3;

    }
    

    
    
}
-(void)MCTableSelecthidden
{
    [TableSelectView removeFromSuperview];
    TableSelectView = nil;
    showindex = 0;
    
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
