//
//  ResultsInquiryViewController.m
//  ZYStudent
//
//  Created by MC on 2016/12/18.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "ResultsInquiryViewController.h"
#import "InquirydateilsViewController.h"

@interface ResultsInquiryViewController ()
{
    UITextField * _numtext;
    UITextField * _nametext;

}

@end

@implementation ResultsInquiryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"查询成绩";
    [self prepareUI];
    // Do any additional setup after loading the view.
}
-(void)prepareUI{
    UIView * bgview =[[UIView alloc]initWithFrame:CGRectMake(10, 64+10, Main_Screen_Width - 20, 44*2 +0.5)];
    bgview.backgroundColor =[UIColor whiteColor];
    ViewBorderRadius(bgview, 3, 1, [UIColor groupTableViewBackgroundColor]);
    
    [self.view addSubview:bgview];
    
    UIView * lineview =[[UIView alloc]initWithFrame:CGRectMake(0, 44, bgview.mj_w, 0.5)];
    lineview.backgroundColor =[UIColor groupTableViewBackgroundColor];
    [bgview addSubview:lineview];
    
    CGFloat w = [MCToolsManage heightforString:@"参赛号" andHeight:44 fontSize:15];
    UILabel * lbl =[[UILabel alloc]initWithFrame:CGRectMake(10, 0, w, 44)];
    
    lbl.text =@"参赛号";
    lbl.font =[UIFont systemFontOfSize:15];
    
    [bgview addSubview:lbl];
    lbl =[[UILabel alloc]initWithFrame:CGRectMake(10, 44.5, w, 44)];
    
    lbl.text =@"姓名";
    lbl.font =[UIFont systemFontOfSize:15];
    
    [bgview addSubview:lbl];
    

    
    _numtext =[[UITextField alloc]initWithFrame:CGRectMake(10+w + 10, 0, bgview.mj_w - 10 -(10+w + 10), 44)];
    _numtext.placeholder = @"请输入参赛号";
    _numtext.font = [UIFont systemFontOfSize:15];
    [bgview addSubview:_numtext];

    
    _nametext =[[UITextField alloc]initWithFrame:CGRectMake(10+w + 10, 44.5, bgview.mj_w - 10 -(10+w + 10), 44)];
    _nametext.placeholder = @"请输入姓名";
    _nametext.font = [UIFont systemFontOfSize:15];
    [bgview addSubview:_nametext];
    

    
    UIButton * btn =[[UIButton alloc]initWithFrame:CGRectMake(30, bgview.mj_y + bgview.mj_h + 30, Main_Screen_Width - 60, 40)];
    btn.backgroundColor = AppMCNACOLOR;
    btn.titleLabel.font =[UIFont systemFontOfSize:15];
    [btn setTitle:@"查询" forState:0];
    UIColor * cc = AppMCNATitleCOLOR;
    [btn setTitleColor:cc forState:0];
    [btn addTarget:self action:@selector(actionBtn) forControlEvents:1<<6];
    [self.view addSubview:btn];
    ViewRadius(btn, 3);
    
    
    
    
    
    
    
}
-(void)actionBtn{
    InquirydateilsViewController * ctl =[[InquirydateilsViewController alloc]init];
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
