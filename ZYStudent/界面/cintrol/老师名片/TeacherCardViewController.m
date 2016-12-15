//
//  TeacherCardViewController.m
//  ZYStudent
//
//  Created by MC on 2016/12/15.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "TeacherCardViewController.h"
#import "TeacherCardTableViewCell.h"
#import "CourselistTableViewCell.h"
#import "CourseDetailsTableViewCell.h"
#import "CourseAllEvaluateViewController.h"
#import "CourseDetailsViewController.h"
#import "ClassSlitViewController.h"
@interface TeacherCardViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
    
    
    
}

@end

@implementation TeacherCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"老师名片";
    [self prepareUI];
    
    
    // Do any additional setup after loading the view.
}
-(void)prepareUI{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, Main_Screen_Width, Main_Screen_Height - 64) style:UITableViewStyleGrouped];
    _tableView.delegate =self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    [self preparehearView];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}


-(void)preparehearView{
    CGFloat h = MCAdaptiveH(750, 424, Main_Screen_Width);
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, h)];
    view.backgroundColor =AppMCNACOLOR;
    _tableView.tableHeaderView = view;
    
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w  = Main_Screen_Width - 2*x;
    h = h - 2*y;
    
    UIImageView * bgimgview =[[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    bgimgview.image =[UIImage imageNamed:@"bg_teacher"];
    [view addSubview:bgimgview];
    
    x = 15+10;
    y = 15+10;
    w = 112/2;
    h = w;
    
    UIImageView * headimgview =[[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    ViewBorderRadius(headimgview, w/2, 2, [UIColor whiteColor]);
    headimgview.image =[UIImage imageNamed:@"def_head112"];
    [bgimgview addSubview:headimgview];
    
    y+=h + 10;
    h = 20;
    w = [MCToolsManage heightforString:@"所属机构" andHeight:20 fontSize:14];
    UILabel * lbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.text = @"所属机构";
    lbl.font =[UIFont systemFontOfSize:14];
    [bgimgview addSubview:lbl];
    
    x +=w + 10;
    w = bgimgview.mj_w - x - 10;
    UILabel * titleLbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    titleLbl.text = @"不知名机构";
    titleLbl.textColor = [UIColor grayColor];
    titleLbl.font =[UIFont systemFontOfSize:13];
    [bgimgview addSubview:titleLbl];

    y += h +8;
    w= lbl.mj_w;
    x = 15 + 10;
    lbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.text = @"个人简介";
    lbl.font =[UIFont systemFontOfSize:14];
    [bgimgview addSubview:lbl];
    
    
    NSString*str =@"吉他手吉他手吉他手吉他手吉他手吉他手吉他手吉他手吉他手吉他手吉他手吉他手";
    x +=w + 10;
    w = bgimgview.mj_w - x - 10;
    
  h = [MCToolsManage heightforString:str andWidth:w fontSize:13];

    if ((bgimgview.mj_h - y - 15)< h) {
        h =bgimgview.mj_h - y;
    }
    titleLbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    titleLbl.text = str;
    titleLbl.textColor = [UIColor grayColor];

    titleLbl.numberOfLines = 0;
    titleLbl.font =[UIFont systemFontOfSize:13];
    [bgimgview addSubview:titleLbl];
    
    x = titleLbl.mj_x;
    y = headimgview.mj_y;
    w = titleLbl.mj_w;
    h = 20;
    UILabel * namelbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    namelbl.text = @"michan";
    namelbl.font =[UIFont systemFontOfSize:15];
    [bgimgview addSubview:namelbl];

    y += h + 10;
    w = [MCToolsManage heightforString:@"好老师" andHeight:20 fontSize:14]+10;
    UILabel*tepyLbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    tepyLbl.text = @"好老师";
    tepyLbl.font =AppFont;
    tepyLbl.textColor = AppMCNATitleCOLOR;
    UIColor * cc =AppMCNATitleCOLOR;
    tepyLbl.textAlignment = NSTextAlignmentCenter;
    ViewBorderRadius(tepyLbl, h/2, 1, cc);
    [bgimgview addSubview:tepyLbl];

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section == 0){
        return 1;
    }
    return 2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, 30)];
    UILabel * lbl =[[UILabel alloc]initWithFrame:CGRectMake(10, 0, 100, 30)];
    lbl.font = [UIFont systemFontOfSize:15];
    [view addSubview:lbl];
    
    if (section == 0) {
        lbl.text = @"任教经历";
        return view;

    }
    if (section == 1) {
        lbl.text = @"课程(10)";
        UIImageView * img2 = [[UIImageView alloc]initWithFrame:CGRectMake(Main_Screen_Width - 10 - 20, 5, 20, 20)];
        img2.image =[UIImage imageNamed:@"btn_next-arrow"];
        [view addSubview:img2];

        UILabel * lbl2 =[[UILabel alloc]initWithFrame:CGRectMake(Main_Screen_Width - 10 -20 -50, 0, 50, 30)];
        lbl2.text = @"更多";
        lbl2.textColor  =[UIColor lightGrayColor];
        lbl2.textAlignment = NSTextAlignmentRight;
        lbl2.font = [UIFont systemFontOfSize:14];
        [view addSubview:lbl2];
        UIButton * btn =[[UIButton alloc]initWithFrame:CGRectMake(Main_Screen_Width/2, 0, Main_Screen_Width/2, 30)];
        [btn addTarget:self action:@selector(actionkc) forControlEvents:1<<6];
        [view addSubview:btn];
        

        return view;

    }
    if (section == 2) {
        lbl.text = @"用户评论";
        UIImageView * img2 = [[UIImageView alloc]initWithFrame:CGRectMake(Main_Screen_Width - 10 - 20, 5, 20, 20)];
        img2.image =[UIImage imageNamed:@"btn_next-arrow"];
        [view addSubview:img2];

        
        UILabel * lbl2 =[[UILabel alloc]initWithFrame:CGRectMake(Main_Screen_Width - 10 -20 -50, 0, 50, 30)];
        lbl2.text = @"更多";
        lbl2.textColor  =[UIColor lightGrayColor];
        lbl2.textAlignment = NSTextAlignmentRight;
        lbl2.font = [UIFont systemFontOfSize:14];
        [view addSubview:lbl2];
        
        UIButton * btn =[[UIButton alloc]initWithFrame:CGRectMake(Main_Screen_Width/2, 0, Main_Screen_Width/2, 30)];
        [btn addTarget:self action:@selector(actionpl) forControlEvents:1<<6];
        [view addSubview:btn];
        
        
        return view;

    }
    return view;

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        CGFloat hx = 15;
        CGFloat hy = 8 + (15-6)/2;
        CGFloat hw = 6;
        CGFloat hh = 6;
        CGFloat offhh = (15-6) + 8 ;
        
        CGFloat x = 15 + hw + 5;
        CGFloat y = 5;
        CGFloat w = Main_Screen_Width - x - 5;
        CGFloat h = 15;
        CGFloat offh = 8 ;
        
        
        for (NSInteger i = 0; i < 5; i ++) {
            
            y+=h+offh;
            hy+=hh+offhh;
            
            
        }
        return y + 8;

    }
    if (indexPath.section == 1) {
        CGFloat viewh = MCAdaptiveH(750, 280, Main_Screen_Width);
        
        return viewh;

    }
    if (indexPath.section == 2) {
        NSString * str = @"课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程";
        CGFloat lh = [MCToolsManage heightforString:str andWidth:Main_Screen_Width - 40 fontSize:14];
        CGFloat viewh =  10+30+10 + lh + 10+20 + 5;
        return viewh;

    }
    return 44;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section ==0) {

    static NSString * cellid = @"TeacherCardTableViewCell";
    
    TeacherCardTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell =[[TeacherCardTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
        [cell prepareUI1];
        return cell;


    }
    else if (indexPath.section == 1){
        static NSString * cellid2 = @"CourselistTableViewCell";
        
        CourselistTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid2];
        if (!cell) {
            cell =[[CourselistTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid2];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
            cell.index = 2;
        [cell prepareUI];
        return cell;
 
        
        
    }
    else if (indexPath.section == 2){
        
        static NSString * cellid = @"CourseDetailsTableViewCell";
        CourseDetailsTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid];
        if (!cell) {
            cell = [[CourseDetailsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
            cell.selectionStyle = UITableViewCellEditingStyleNone;
        }
        [cell prepareUI3];

        return cell;

        
    }
    

    
    
    
    return [[UITableViewCell alloc]init];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
     if (indexPath.section == 1){
         CourseDetailsViewController * ctl =[[CourseDetailsViewController alloc]init];
         ctl.headerBtnON = 1;
         [self pushNewViewController:ctl];
         

         
 
     }
    
}
#pragma mark-更多课程
-(void)actionkc{
    ClassSlitViewController * ctl =[[ClassSlitViewController alloc]init];
    [self pushNewViewController:ctl];

    
}
#pragma mark-更多评论

-(void)actionpl{
    CourseAllEvaluateViewController * ctl =[[CourseAllEvaluateViewController alloc]init];
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
