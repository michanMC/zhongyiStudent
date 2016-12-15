//
//  OpinionViewController.m
//  MCZhongYi
//
//  Created by MC on 2016/12/12.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "OpinionViewController.h"
#import "UIPlaceHolderTextView.h"

@interface OpinionViewController ()
{
    
    UIPlaceHolderTextView *_TextView1;

}

@end

@implementation OpinionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.title =@"机构意见箱";
    [self prepareUI];
    
    // Do any additional setup after loading the view.
}
-(void)prepareUI{
    CGFloat x = 20;
    CGFloat y = 20+64;
    CGFloat w = Main_Screen_Width- 2*x;
    CGFloat h = 150;
    
    UIView * bgview = [[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    bgview.backgroundColor = [UIColor whiteColor];
    ViewBorderRadius(bgview, 3, 1, [UIColor groupTableViewBackgroundColor]);
    [self.view addSubview:bgview];
    y=5;
    x = 5;
    w = bgview.mj_w -2*x;
    h = 140;
    _TextView1 = [[UIPlaceHolderTextView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    _TextView1.placeholder = @"你的要求是我们努力的方向，期待听到您的声音";
    _TextView1.font = [UIFont systemFontOfSize:14];
    [bgview addSubview:_TextView1];

  UIButton*  btn = [[UIButton alloc]initWithFrame:CGRectMake(30, bgview.mj_h + bgview.mj_y + 25, Main_Screen_Width - 60, 40)];
    btn.backgroundColor =  AppMCNACOLOR;
    ViewRadius(btn, 3);
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn setTitle:@"提交" forState:0];
    UIColor *cc = AppMCNATitleCOLOR;
    [btn setTitleColor:cc forState:0];
    
    [self.view addSubview:btn];

    
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
