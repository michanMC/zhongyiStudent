//
//  InquirydateilsViewController.m
//  ZYStudent
//
//  Created by MC on 2016/12/18.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "InquirydateilsViewController.h"

@interface InquirydateilsViewController ()

@end

@implementation InquirydateilsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"获奖信息";
    self.view.backgroundColor = AppMCNACOLOR;
    [self prepareUI];
    // Do any additional setup after loading the view.
}
-(void)prepareUI{
    CGFloat h = MCAdaptiveH(750, 900, Main_Screen_Width);
    
    UIImageView * imgview =[[UIImageView alloc]initWithFrame:CGRectMake(10, 64 * 2, Main_Screen_Width-20, h)];
    imgview.image =[UIImage imageNamed:@"bg_champion"];
    [self.view addSubview:imgview];
    

    h = 20 + 10+20+10;
  CGFloat  y =imgview.mj_h - h - 80;
    
    
    UIView * view =[[UIView alloc]initWithFrame:CGRectMake(0, y, Main_Screen_Width - 20, h)];
    [imgview addSubview:view];
    
    CGFloat w = Main_Screen_Width - 20;
    UILabel * lbl =[[UILabel alloc]initWithFrame:CGRectMake(0, 0, w, 20)];
    lbl.text = @"参赛号:132321321";
    lbl.font =[UIFont systemFontOfSize:15];
    lbl.textAlignment = NSTextAlignmentCenter;
    [view addSubview:lbl];
    
    lbl =[[UILabel alloc]initWithFrame:CGRectMake(0, 20+10, w, 20)];
    lbl.text = @"姓名:michan";
    lbl.font =[UIFont systemFontOfSize:15];
    lbl.textAlignment = NSTextAlignmentCenter;
    [view addSubview:lbl];

    lbl =[[UILabel alloc]initWithFrame:CGRectMake(0, 20+10 +20 + 10, w, 20)];
    lbl.text = @"获奖状况:一等奖";
    lbl.font =[UIFont systemFontOfSize:15];
    lbl.textAlignment = NSTextAlignmentCenter;
    [view addSubview:lbl];
    

    
    
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
