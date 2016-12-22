//
//  SubmitSutComViewController.m
//  MCZhongYi
//
//  Created by MC on 2016/12/9.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "SubmitSutComViewController.h"
#import "ItemView.h"
#import "UIPlaceHolderTextView.h"
@interface SubmitSutComViewController ()<ItemViewDelegate>
{
    
    
    UIView * _bgView;
    ItemView *_itemView;
    CGFloat _itemViewh;
}

@end

@implementation SubmitSutComViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"评价老师";
    [self prepareUI];
    self.view.backgroundColor = AppMCNACOLOR;
    // Do any additional setup after loading the view.
}
-(void)prepareUI{
    
    
    CGFloat bgViewh = 50 + 10 + 20 + 10 + 20 +10 +_itemViewh +10 + 0.5 + 80 + 0.5 + 44;
    CGFloat x = 15;
    CGFloat w  =Main_Screen_Width - 2*x;
    CGFloat h =bgViewh;
    CGFloat y = (Main_Screen_Height - 64 -bgViewh - 100)/2;
    
    _bgView =[[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    _bgView.backgroundColor = [UIColor whiteColor];
    ViewRadius(_bgView, 5);
    [self.view addSubview:_bgView];
//    w= 100;
//    h = 100;
//    x = (Main_Screen_Width - w )/2;
//    y = _bgView.mj_y - 50;
//    
//    UIImageView * headimgView = [[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
//    headimgView.image = [UIImage imageNamed:@"def_head112"];
//    ViewBorderRadius(headimgView, 50,5, [UIColor whiteColor]);
//    [self.view addSubview:headimgView];

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

    
    
    _itemView = [[ItemView alloc] initWithFrame:CGRectMake(5, 50 + 10 + 20 + 10 + 20 +10, _bgView.mj_w - 10 , 100)];
    _itemView.backgroundColor = [UIColor whiteColor];

    _itemView.delegate = self;
    _itemView.itemHeith = 25;
    _itemView.itemArray = @[@"的萨芬",@"撒旦飞洒地方",@"阿斯顿",@"撒地方",@"阿斯顿发送到",@"阿斯蒂芬斯蒂芬",@"撒地方",@"撒地方都是"];
    [_bgView addSubview:_itemView];

}
#pragma mark-_itemView代理
-(void)itemH:(CGFloat)itemh
{
    _itemViewh =itemh;
  CGFloat  bgViewh = 50 + 10 + 20 + 10 + 20 +10 +_itemViewh +10 + 0.5 + 80 + 0.5 + 44;
    
    CGFloat bgViewy = (Main_Screen_Height  -bgViewh )/2;
    if (bgViewy<115) {
        bgViewy = 115;
    }

    
    _bgView.frame = CGRectMake(_bgView.mj_x, bgViewy, _bgView.mj_w, bgViewh);
    
  CGFloat  headimgw= 100;
  CGFloat  headimgh = 100;
  CGFloat  headimgx = (Main_Screen_Width - headimgw )/2;
   CGFloat headimgy = _bgView.mj_y - 50;
    
    UIImageView * headimgView = [[UIImageView alloc]initWithFrame:CGRectMake(headimgx, headimgy, headimgw, headimgh)];
    headimgView.image = [UIImage imageNamed:@"def_head112"];
    ViewBorderRadius(headimgView, 50,5, [UIColor whiteColor]);
    [self.view addSubview:headimgView];
    

    
    
     _itemView.frame = CGRectMake(CGRectGetMinX(_itemView.frame), CGRectGetMinY(_itemView.frame), CGRectGetWidth(_itemView.frame), itemh );
    CGFloat y = _itemView.mj_y + _itemViewh + 10;
    CGFloat x = 5;
    CGFloat h = 0.5;
    CGFloat w = _bgView.mj_w - 10;
    UIView * lineView = [[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    [_bgView addSubview:lineView];

    
    
    y += h + 5;
    w= 20;
    h = 20;
    UIImageView * iocimg = [[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    iocimg.image =[UIImage imageNamed:@"icon_white"];
    [_bgView addSubview:iocimg];

    x+=w +3;
    w = _bgView.mj_w -x - 5;
    y -=5;
    h = 75;
    UIPlaceHolderTextView * TextView =[[UIPlaceHolderTextView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    TextView.placeholder = @"请输入评价内容";
    TextView.font = [UIFont systemFontOfSize:14];
    [_bgView addSubview:TextView];

    y += h + 5;
    x = 0;
    h = 0.5;
    w = _bgView.mj_w;
    lineView = [[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    [_bgView addSubview:lineView];
    
    y +=h;
    h = 44;
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
    [btn setTitle:@"提交评价" forState:0];
    UIColor *cc = AppMCNATitleCOLOR;
    [btn setTitleColor:cc forState:0];
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    [_bgView addSubview:btn];

    
}
-(void)seleIndex:(NSInteger)index
{
    
    
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
