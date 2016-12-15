//
//  HomeViewController.m
//  ZYStudent
//
//  Created by MC on 2016/12/12.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "HomeViewController.h"
#import "ZJScrollPageView.h"
#import "MyDynamicViewController.h"
#import "OrganiDyViewController.h"
#import "ZZCarousel.h"
#import "FriendlistViewController.h"
#import "MyTaskViewController.h"
#import "PubliShrouteViewController.h"
#import "SearchViewController.h"
static CGFloat const segmentViewHeight = 44.0;
static CGFloat const naviBarHeight = 64.0;
//static CGFloat const headViewHeight = 200.0;

NSString *const ZJParentTableViewDidLeaveFromTopNotification = @"ZJParentTableViewDidLeaveFromTopNotification";


@interface ZJCustomGestureTableView : UITableView

@end

@implementation ZJCustomGestureTableView

/// 返回YES同时识别多个手势
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return [gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]] && [otherGestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]];
}
@end

@interface HomeViewController ()
<ZJScrollPageViewDelegate, ZJPageViewControllerDelegate, UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource,ZZCarouselDelegate>
{
    CGFloat headViewHeight;
    
    
    UIImageView * _myDyImgview;

    UILabel * _myDyLbl;
    UILabel * _OrDyLbl;
    
    ZZCarousel *_headwheel;//广告图
    UIView *_headView;
    ZJCustomGestureTableView *_tableView;
    
    
    UIImageView *_bgImgview;
    
    
    
    UIImageView * _taskImgview;//任务条
    
}
@property (strong, nonatomic) NSArray<NSString *> *titles;
@property (strong, nonatomic) UIView *containerView;
@property (strong, nonatomic) ZJScrollSegmentView *segmentView;
@property (strong, nonatomic) ZJContentView *contentView;
//@property (strong, nonatomic)
@property (strong, nonatomic) UIScrollView *childScrollView;
//@property (strong, nonatomic)

@end



static NSString * const cellID = @"cellID";

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self prepareUI];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"tab_icon_home"] style:UIBarButtonItemStylePlain target:self action:@selector(actionleft)];
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

    
    
    
    // Do any additional setup after loading the view.
}
-(void)prepareUI{
    CGFloat h = MCAdaptiveH(750, 400, Main_Screen_Width);
    h+=MCAdaptiveH(750, 360, Main_Screen_Width)+5;
    headViewHeight = h;
    [self preparetableView];
    [_headwheel reloadData];
    __weak typeof(self) weakself = self;

    /// 下拉刷新
    _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            
            typeof(weakself) strongSelf = weakself;
            
            [_tableView.mj_header endRefreshing];
        });
    }];

    
    
}
-(void)actionseach{
    SearchViewController * ctl =[[SearchViewController alloc]init];
    [self pushNewViewController:ctl];

    
}
-(void)actionleft{
    FriendlistViewController * ctl =[[FriendlistViewController alloc]init];
    [self pushNewViewController:ctl];

}
#pragma ZJScrollPageViewDelegate 代理方法
- (NSInteger)numberOfChildViewControllers {
    return self.titles.count;
}
- (UIViewController<ZJScrollPageViewChildVcDelegate> *)childViewController:(UIViewController<ZJScrollPageViewChildVcDelegate> *)reuseViewController forIndex:(NSInteger)index {
    UIViewController<ZJScrollPageViewChildVcDelegate> *childVc = reuseViewController;
    
    if (!childVc) {
        if (index==0) {
            childVc = [[MyDynamicViewController alloc] init];
            MyDynamicViewController *vc = (MyDynamicViewController *)childVc;
            vc.delegate = self;
        } else {
            childVc = [[OrganiDyViewController alloc] init];
            OrganiDyViewController *vc = (OrganiDyViewController *)childVc;
            vc.delegate = self;
            
        }
        
    }
    
    
    
    
    
    return childVc;
}
- (void)scrollPageController:(UIViewController *)scrollPageController childViewControllDidAppear:(UIViewController *)childViewController forIndex:(NSInteger)index;
{
    
    if (index==0) {
        _myDyImgview.image = [UIImage imageNamed:@"pic_bg-yellow2"];
        
        _myDyLbl.textColor=[UIColor darkTextColor];
        _OrDyLbl.textColor=[UIColor grayColor];
        
    }
    else
    {
        
        _myDyImgview.image = [UIImage imageNamed:@"pic_bg-yellow1"];
        _myDyLbl.textColor=[UIColor grayColor];
        _OrDyLbl.textColor=[UIColor darkTextColor];
        
    }
    
}
#pragma mark- ZJPageViewControllerDelegate

- (void)scrollViewIsScrolling:(UIScrollView *)scrollView {
    _childScrollView = scrollView;
    if (_tableView.contentOffset.y < headViewHeight) {
        scrollView.contentOffset = CGPointZero;
        scrollView.showsVerticalScrollIndicator = NO;
    }
    else {
        _tableView.contentOffset = CGPointMake(0.0f, headViewHeight);
        scrollView.showsVerticalScrollIndicator = YES;
    }
    
}

#pragma mark- UIScrollViewDelegate
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
    NSLog(@">>>>>%f",scrollView.contentOffset.x);

    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (self.childScrollView && _childScrollView.contentOffset.y > 0) {
        _tableView.contentOffset = CGPointMake(0.0f, headViewHeight);
    }
    CGFloat offsetY = scrollView.contentOffset.y;
    if(offsetY < headViewHeight) {
        [[NSNotificationCenter defaultCenter] postNotificationName:ZJParentTableViewDidLeaveFromTopNotification object:nil];
        
    }
    
    
    
    
    
    
}
//-(void)shouldAutomaticallyForwardAppearanceMethods{
//    
//    
//}
- (BOOL)shouldAutomaticallyForwardAppearanceMethods {
    return NO;
}

#pragma mark- UITableViewDelegate, UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    [cell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [cell.contentView addSubview:self.contentView];
    
    return cell;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return self.segmentView;
}

#pragma mark- setter getter
- (ZJScrollSegmentView *)segmentView {
    if (_segmentView == nil) {
        ZJSegmentStyle *style = [[ZJSegmentStyle alloc] init];
//        style.showCover = YES;
        style.scrollTitle = NO;

        self.titles = @[@"个人动态",
                        @"机构动态"
                        ];
        
        _myDyImgview = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, 44)];
        _myDyImgview.image = [UIImage imageNamed:@"pic_bg-yellow2"];
        
        _myDyLbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width/2, 44)];
        _myDyLbl.textColor = [UIColor darkTextColor];
        _myDyLbl.font = [UIFont systemFontOfSize:16];
        _myDyLbl.textAlignment = NSTextAlignmentCenter;
        _myDyLbl.text =@"个人动态";
        [_myDyImgview addSubview:_myDyLbl];
        
        _OrDyLbl = [[UILabel alloc]initWithFrame:CGRectMake(Main_Screen_Width/2, 0, Main_Screen_Width/2, 44)];
        _OrDyLbl.textColor = [UIColor grayColor];
        _OrDyLbl.font = [UIFont systemFontOfSize:16];
        _OrDyLbl.textAlignment = NSTextAlignmentCenter;
        _OrDyLbl.text =@"机构动态";
        [_myDyImgview addSubview:_OrDyLbl];
        

        

        // 注意: 一定要避免循环引用!!
        __weak typeof(self) weakSelf = self;
        __weak typeof(UIImageView*) weakmyimg = _myDyImgview;
        __weak typeof(UILabel*) weakmyLbl = _myDyLbl;
        __weak typeof(UILabel*) weakorLbl = _OrDyLbl;

        ZJScrollSegmentView *segment = [[ZJScrollSegmentView alloc] initWithFrame:CGRectMake(0, naviBarHeight + headViewHeight, self.view.bounds.size.width, segmentViewHeight) segmentStyle:style delegate:self titles:self.titles titleDidClick:^(ZJTitleView *titleView, NSInteger index) {
            
            [weakSelf.contentView setContentOffSet:CGPointMake(weakSelf.contentView.bounds.size.width * index, 0.0) animated:YES];
            
            if (index == 0) {
                
                weakmyimg.image = [UIImage imageNamed:@"pic_bg-yellow2"];
                
                weakmyLbl.textColor=[UIColor darkTextColor];
                weakorLbl.textColor=[UIColor grayColor];



            }
            
           else if (index == 1) {

               
               weakmyimg.image = [UIImage imageNamed:@"pic_bg-yellow1"];
               weakmyLbl.textColor=[UIColor grayColor];
               weakorLbl.textColor=[UIColor darkTextColor];

           }

            
        }];
        
        
        segment.backgroundColor = AppBgCOLOR;
       
        
        [segment addSubview:_myDyImgview];
        
        
        _segmentView = segment;
        
    }
    return _segmentView;
}


- (ZJContentView *)contentView {
    if (_contentView == nil) {
        ZJContentView *content = [[ZJContentView alloc] initWithFrame:self.view.bounds segmentView:self.segmentView parentViewController:self delegate:self];
        _contentView = content;
    }
    return _contentView;
}
#pragma mark-头
- (UIView*)prepareheadView {
    

        _headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, headViewHeight)];
        _headView.backgroundColor = AppBgCOLOR;
        
        _headwheel = [[ZZCarousel alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, MCAdaptiveH(750, 400, Main_Screen_Width) )];
//    _headwheel.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [_headView addSubview:_headwheel];

        /*
         *   carouseScrollTimeInterval  ---  此属性为设置轮播多长时间滚动到下一张
         */
        _headwheel.carouseScrollTimeInterval = 5.0f;

        // 代理
        _headwheel.delegate = self;
        
        /*
         *   isAutoScroll  ---  默认为NO，当为YES时 才能使轮播进行滚动
         */
        _headwheel.isAutoScroll = YES;
        
        /*
         *   pageType  ---  设置轮播样式 默认为系统样式。ZZCarousel 中封装了 两种样式，另外一种为数字样式
         */
        _headwheel.pageType = ZZCarouselPageTypeOfNone;

        _headwheel.pageControlFrame = CGRectMake((Main_Screen_Width - 60 ) / 2, _headwheel.frame.size.height - 10, 60, 5);

        _headwheel.pageIndicatorTintColor = [UIColor whiteColor];
        _headwheel.currentPageIndicatorTintColor = AppMCNACOLOR;
        _headwheel.pageControlBackGroundColor = [UIColor whiteColor];
        _headwheel.pageControlOfNumberFont = [UIFont fontWithName:@"Helvetica-Bold" size:18];
        _headwheel.pageContolOfNumberFontColor = [UIColor whiteColor];
    
    
    _bgImgview = [[UIImageView alloc]initWithFrame:CGRectMake(0, MCAdaptiveH(750, 400, Main_Screen_Width), Main_Screen_Width,MCAdaptiveH(750, 360, Main_Screen_Width) )];
    _bgImgview.image = [UIImage imageNamed:@"list_bg2"];
    _bgImgview.userInteractionEnabled = YES;
    [_headView addSubview:_bgImgview];
    CGFloat x = -30;
    CGFloat y = 10;
    CGFloat w = [MCToolsManage heightforString:@"任务中心:3个未完成任务" andHeight:30  fontSize:15] + 15 + 20 + 30;
 CGFloat   h = 30;
    _taskImgview = [[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    _taskImgview.backgroundColor = kUIColorFromRGB(0xf6ae22);
    _taskImgview.userInteractionEnabled = YES;

    ViewRadius(_taskImgview, 30/2);
    [_bgImgview addSubview:_taskImgview];
    
    UILabel * lbl = [[UILabel alloc]initWithFrame:CGRectMake(30+15, 0,w , 30)];
    lbl.text = @"任务中心:3个未完成任务";
    lbl.textColor = [UIColor whiteColor];
    lbl.font = [UIFont systemFontOfSize:15];
    [_taskImgview addSubview:lbl];
    UIButton * taskBtn = [[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
    [taskBtn addTarget:self action:@selector(actiontaskBtn) forControlEvents:1<<6];
    [_taskImgview addSubview:taskBtn];
    UIButton * headerBtn = [[UIButton alloc]initWithFrame:CGRectMake((Main_Screen_Width - 90)/2,(_bgImgview.mj_h - 90) /2, 90, 90)];
    [headerBtn setImage:[UIImage imageNamed:@"pic_toy-small"] forState:0];
    [_bgImgview addSubview:headerBtn];
    
    
    w =  [MCToolsManage heightforString:@"LV6" andHeight:20 fontSize:15] + 20;
    h = 20;
    y = _bgImgview.mj_h - h - 10;
    x = Main_Screen_Width/2 - 6 - w;
    
  MCIucencyView * IucencyView = [[MCIucencyView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    [IucencyView setBgViewColor:[UIColor whiteColor ]];
    [IucencyView setBgViewAlpha:.8];
    ViewBorderRadius(IucencyView, h/2, 1, [UIColor groupTableViewBackgroundColor]);
    
    [_bgImgview addSubview:IucencyView];
    lbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, w, h)];
    lbl.text =@"LV6";
    lbl.textColor = AppMCNATitleCOLOR;
    lbl.font  =[UIFont systemFontOfSize:15];
    lbl.textAlignment = NSTextAlignmentCenter;
    [IucencyView addSubview:lbl];
    
    x = Main_Screen_Width/2 + 6;
    w= 20;
    UIImageView * img = [[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    img.image = [UIImage imageNamed:@"icon_plant"];
    [_bgImgview addSubview:img];

    x =Main_Screen_Width/2 + 6 + 20 +3;
    w =150;//Main_Screen_Width/2 - x - 5;
    lbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    
    lbl.text =@"233";
    lbl.textColor = AppMCNATitleCOLOR;
    lbl.font  =[UIFont systemFontOfSize:15];
    [_bgImgview addSubview:lbl];
    
    
    
    
    
    return _headView;
    
}
#pragma mark --- ZZCarouselDelegate


-(NSInteger)numberOfZZCarousel:(ZZCarousel *)wheel
{
    
        return 5;
}
-(ZZCarouselView *)zzcarousel:(UICollectionView *)zzcarousel viewForItemAtIndex:(NSIndexPath *)index itemsIndex:(NSInteger)itemsIndex identifire:(NSString *)identifire ZZCarousel:(ZZCarousel *)zZCarousel
{
    /*
     *  index参数         ※ 注意
     */
    ZZCarouselView *cell = [zzcarousel dequeueReusableCellWithReuseIdentifier:identifire forIndexPath:index];
    
    if (!cell) {
        cell = [[ZZCarouselView alloc]init];
    }
    cell.imageView.contentMode = UIViewContentModeScaleAspectFill;
    cell.imageView.clipsToBounds = YES; // 裁剪边缘
    cell.imageView.image =[UIImage imageNamed:@"bg_def_390"];
    
    
    return cell;

}
//点击方法

-(void)zzcarouselScrollView:(ZZCarousel *)zzcarouselScrollView didSelectItemAtIndex:(NSInteger)index
{
}
- (void)preparetableView {
        CGRect frame = CGRectMake(0.0f, naviBarHeight, self.view.bounds.size.width, self.view.bounds.size.height);
        _tableView = [[ZJCustomGestureTableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        // 设置tableView的headView
        _tableView.tableHeaderView = [self prepareheadView];
        _tableView.tableFooterView = [UIView new];
        // 设置cell行高为contentView的高度
        _tableView.rowHeight = self.contentView.bounds.size.height;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        // 设置tableView的sectionHeadHeight为segmentViewHeight
        _tableView.sectionHeaderHeight = segmentViewHeight;
        _tableView.showsVerticalScrollIndicator = false;
    
    [self.view addSubview:_tableView];
}

-(void)actiontaskBtn{
    MyTaskViewController * ctl =[[MyTaskViewController alloc]init];
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
