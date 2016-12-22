//
//  LookSutComViewController.m
//  MCZhongYi
//
//  Created by MC on 2016/12/9.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "LookSutComViewController.h"

@interface LookSutComViewController ()
{
    
    
    UIView * _bgView;
    
    
}

@end

@implementation LookSutComViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"查看评价";
    self.view.backgroundColor = AppMCNACOLOR;
    CGFloat bgViewh = 50 + 10 + 20 + 15 + 20 + 10 + 25 + 10 + 0.5 + 8 + 40 +10;
    
    CGFloat x = 15;
    CGFloat w  =Main_Screen_Width - 2*x;
    CGFloat h =bgViewh;
    CGFloat y = (Main_Screen_Height - 64 -bgViewh - 50)/2;
    
    _bgView =[[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    _bgView.backgroundColor = [UIColor whiteColor];
    ViewRadius(_bgView, 5);
    [self.view addSubview:_bgView];
    
    w= 100;
    h = 100;
    x = (Main_Screen_Width - w )/2;
    y = _bgView.mj_y - 50;
    UIImageView * headimgView = [[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    headimgView.image = [UIImage imageNamed:@"def_head112"];
    ViewBorderRadius(headimgView, 50,5, [UIColor whiteColor]);
    [self.view addSubview:headimgView];

    x = 0;
    y = 60;
    w = _bgView.mj_w;
    h = 20;
    UILabel * nameLbl= [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    nameLbl.text = @"michan";
    nameLbl.textColor = [UIColor darkTextColor];
    nameLbl.font = [UIFont systemFontOfSize:16];
    nameLbl.textAlignment = NSTextAlignmentCenter;
    [_bgView addSubview:nameLbl];
    
    w = 125;
    
    x = (_bgView.mj_w - w)/2;
    y +=h +15;
    h = 20;
    
    
  HCSStarRatingView*  _starRatingView  = [[HCSStarRatingView alloc] initWithFrame:CGRectMake(x, y, w, h)];
    _starRatingView.maximumValue = 5;
    _starRatingView.minimumValue = 0;
    _starRatingView.value = 3;
    _starRatingView.tintColor = [UIColor redColor];
    _starRatingView.enabled = NO;
    [_bgView addSubview:_starRatingView];
    
    
    
    
    w = [MCToolsManage heightforString:@"积极回答" andHeight:25 fontSize:13]+ 15;
    x = (_bgView.mj_w - w)/2;
    y +=h + 10;
    h = 25;
    
    
    UILabel * tepyLbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    tepyLbl.text = @"积极回答";
    tepyLbl.font = [UIFont systemFontOfSize:13];
    tepyLbl.textColor = [UIColor orangeColor];
    ViewBorderRadius(tepyLbl, 25/2, 1, [UIColor orangeColor]);
    tepyLbl.textAlignment = NSTextAlignmentCenter;
    [_bgView addSubview:tepyLbl];

    
    x = 10;
    y += h+10;
    w = _bgView.mj_w - 20;
    h = 0.5;
    UIView * lineView = [[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    [_bgView addSubview:lineView];

    
    y +=h + 8;
    h = 40;
    w= _bgView.mj_w - 40;
    x =20;
    UILabel * titleLbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    titleLbl.textColor = [UIColor grayColor];
    titleLbl.numberOfLines = 0;
    titleLbl.text = @"优秀的学生优秀的学生优秀的学生优秀的学生优秀的学生优秀的学生优秀的学生";
    titleLbl.font = [UIFont systemFontOfSize:14];
    [_bgView addSubview:titleLbl];

    
    
    
    // Do any additional setup after loading the view.
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
