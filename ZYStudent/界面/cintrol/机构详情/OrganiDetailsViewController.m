//
//  OrganiDetailsViewController.m
//  MCZhongYi
//
//  Created by MC on 2016/12/11.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "OrganiDetailsViewController.h"
#import "ZJScrollPageView.h"
#import "OrganiHomeViewController.h"
#import "ClassKCViewController.h"
//#import "DimissionViewController.h"
#import "OpinionViewController.h"
@interface OrganiDetailsViewController ()
<ZJScrollPageViewDelegate>
{
    
    NSArray * _noimgarray;
    
    NSArray * _seleimgarray;

    UIView * _menuview;
    
    
    
    
}
@property(strong, nonatomic)NSArray<NSString *> *titles;
@property(strong, nonatomic)NSArray<UIViewController *> *childVcs;


@end

@implementation OrganiDetailsViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _noimgarray = @[@"tab_list_grey",@"tab_list_red"];
    _seleimgarray = @[@"tab_home_grey",@"tab_home_red"];

    [self prepareUI];
    // Do any additional setup after loading the view.
}
-(void)prepareUI{
  CGFloat h =  MCAdaptiveH(750, 400, Main_Screen_Width);
    CGFloat x = 0;
    
    CGFloat y = 0;
    CGFloat w = Main_Screen_Width;
    UIImageView * bgimgView = [[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    bgimgView.image =[UIImage imageNamed:@"bg_def_390"];
    [self.view addSubview:bgimgView];
    bgimgView.userInteractionEnabled = YES;
    x = 15;
    w= 25;
    h = 25;
    y = 30;
    UIButton * backBtn = [[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
    [backBtn setImage:[UIImage imageNamed:@"nav_back_arrow_white"] forState:0];
    [backBtn addTarget:self action:@selector(actionBack) forControlEvents:1<<6];

    UILabel *titleLbl = [[UILabel alloc]initWithFrame:CGRectMake(0, y, Main_Screen_Width, h)];
    titleLbl.textColor = [UIColor whiteColor];
    titleLbl.font = [UIFont systemFontOfSize:18];
    titleLbl.textAlignment = NSTextAlignmentCenter;
    titleLbl.text = @"机构详情";
    [bgimgView addSubview:titleLbl];
    [bgimgView addSubview:backBtn];

    x = Main_Screen_Width - 10 - 20;
    w = 20;
    h = 20;
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
    [btn setImage:[UIImage imageNamed:@"nav_menu1"] forState:0];
    [btn addTarget:self action:@selector(actionyj) forControlEvents:1<<6];
    [bgimgView addSubview:btn];
    CGFloat vw = [MCToolsManage heightforString:@"离职申请" andHeight:25 fontSize:14]+10;
    _menuview = [[UIView alloc]initWithFrame:CGRectMake(Main_Screen_Width - vw -10, y+h + 5, vw, 50.5)];
    ViewBorderRadius(_menuview, 1, 1, [UIColor groupTableViewBackgroundColor]);
    _menuview.backgroundColor = [UIColor whiteColor];
    [bgimgView addSubview:_menuview];

    UIButton * yjBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, vw, 25)];
    [yjBtn setTitle:@"意见反馈" forState:0];
    [yjBtn setTitleColor:[UIColor darkTextColor] forState:0];
    yjBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [_menuview addSubview:yjBtn];
    [yjBtn addTarget:self action:@selector(actionyj) forControlEvents:1<<6];

    
    UIView * lineView =[[UIView alloc]initWithFrame:CGRectMake(0, 25, vw, 0.5)];
    lineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [_menuview addSubview:lineView];

    UIButton * lzBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 25.5, vw, 25)];
    [lzBtn setTitle:@"离职申请" forState:0];
    [lzBtn setTitleColor:[UIColor darkTextColor] forState:0];
    lzBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [_menuview addSubview:lzBtn];
    [lzBtn addTarget:self action:@selector(actionLz) forControlEvents:1<<6];
    _menuview.hidden = YES;
    
    
    
    
    
    
    h = 60;
  MCIucencyView * gview =  [[MCIucencyView alloc]initWithFrame:CGRectMake(0, bgimgView.mj_h-60, Main_Screen_Width, 60)];
    
    [gview setBgViewColor:[UIColor blackColor]];
    [gview setBgViewAlpha:0.3];
    [bgimgView addSubview:gview];

    x = 15;
    w= Main_Screen_Width - 30;
    h = 20;
    y = 8;
    UILabel * namelbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    namelbl.text = @"不知名机构";
    namelbl.textColor = [UIColor whiteColor];
    namelbl.font =[UIFont systemFontOfSize:15];
    [gview addSubview:namelbl];
    [bgimgView addSubview:gview];

    y +=h+8;
    h = 15;
    w = Main_Screen_Width/3;
    x=10;
    HCSStarRatingView* starRatingView  = [[HCSStarRatingView alloc] initWithFrame:CGRectMake(x, y, w, h)];
    starRatingView.maximumValue = 5;
    starRatingView.minimumValue = 0;
    starRatingView.value = 4;
    starRatingView.tintColor = [UIColor whiteColor];
    starRatingView.enabled = NO;
    [gview addSubview:starRatingView];
    x+=w+10;
    UILabel * countLbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    countLbl.textColor = [UIColor whiteColor];
    countLbl.font =[UIFont systemFontOfSize:13];
    countLbl.text =@"66条评论";
    [gview addSubview:countLbl];



    
    ZJSegmentStyle *style = [[ZJSegmentStyle alloc] init];
    /// 显示遮盖
    style.showLine = YES;

    /// 设置滚动条高度
    style.segmentHeight = 60;
    /// 显示图片 (在显示图片的时候只有下划线的效果可以开启, 其他的'遮盖','渐变',效果会被内部关闭)
    style.showImage = YES;
    /// 图片位置
    style.imagePosition = TitleImagePositionTop;
    // 开始滚动就改变标题
    style.adjustTitleWhenBeginDrag = YES;
    // 当标题(和图片)宽度总和小于ZJScrollPageView的宽度的时候, 标题会自适应宽度
    style.autoAdjustTitlesWidth = YES;

    
    
    style.coverBackgroundColor = [UIColor whiteColor];
    style.normalTitleColor = RGBCOLOR(196, 195, 196);
    style.selectedTitleColor = RGBCOLOR(92, 45, 5);
    style.titleFont = [UIFont systemFontOfSize:13];
//    style.titleMargin = 100*MCWidthScale;
    // 根据title总宽度自动调整位置 -- 达到个数少的时候会'平分'的效果, 个数多的时候就是可以滚动的效果 只有当scrollTitle == YES的时候才有效
    //    style.autoAdjustTitlesWidth = YES;
    // 不滚动标题
    style.scrollTitle = YES;
    // 同步调整遮盖或者滚动条的宽度 -- 只有当scrollTitle == NO的时候有效
    style.adjustCoverOrLineWidth = YES;
    // 颜色渐变
    style.gradualChangeTitleColor = YES;
//    style.segmentHeight = 44;
    //    style.showExtraButton = YES;
    self.titles = @[@"机构首页",
                    @"课程列表"
                    ];
    // 初始化
    ZJScrollPageView *scrollPageView = [[ZJScrollPageView alloc] initWithFrame:CGRectMake(0, bgimgView.mj_h, self.view.bounds.size.width, self.view.bounds.size.height - bgimgView.mj_h) segmentStyle:style titles:self.titles parentViewController:self delegate:self];
//    scrollPageView.segmentView.backgroundColor = AppMCNACOLOR;
    NSLog(@"%@", self.view);
    
    //    scrollPageView.extraBtnOnClick = ^(UIButton *btn){
    //        NSLog(@"ffff");
    //    };
    [self.view addSubview:scrollPageView];
    

    
    
    
}
-(void)actionyj{
    
    _menuview.hidden = YES;
    OpinionViewController * ctl =[[OpinionViewController alloc]init];
    ctl.title = @"机构意见箱";
    [self pushNewViewController:ctl];

}

-(void)actionLz{
    _menuview.hidden = YES;
//    DimissionViewController * ctl =[[DimissionViewController alloc]init];
//    
//    [self pushNewViewController:ctl];
}
-(void)actionmenubtn{
    _menuview.hidden = !_menuview.hidden;
    
}
-(void)actionBack{
    
    [self toPopVC];
}
- (BOOL)shouldAutomaticallyForwardAppearanceMethods {
    return NO;
}
- (NSInteger)numberOfChildViewControllers {
    return self.titles.count;
}


- (void)setUpTitleView:(ZJTitleView *)titleView forIndex:(NSInteger)index {
    //    titleView.label.backgroundColor = [UIColor redColor];
    titleView.normalImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@", _noimgarray[index]]];
   
    titleView.selectedImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@", _seleimgarray[index]]];

}

- (UIViewController<ZJScrollPageViewChildVcDelegate> *)childViewController:(UIViewController<ZJScrollPageViewChildVcDelegate> *)reuseViewController forIndex:(NSInteger)index {
    
    
    
    UIViewController<ZJScrollPageViewChildVcDelegate> *childVc = reuseViewController;
    
    
    
    if (!childVc) {
        if (index == 0) {
            childVc = [[OrganiHomeViewController alloc]init];
        }
        else
        {
            childVc = [[ClassKCViewController alloc]init];
            
        }
        
    }
    
    return childVc;
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
