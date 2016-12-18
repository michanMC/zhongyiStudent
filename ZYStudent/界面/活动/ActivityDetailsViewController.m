//
//  ActivityDetailsViewController.m
//  ZYStudent
//
//  Created by MC on 2016/12/18.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "ActivityDetailsViewController.h"
#import "ActicitIntroduceViewController.h"
#import "ActivityApplyViewController.h"
#import "ZJScrollPageView.h"

@interface ActivityDetailsViewController ()<ZJScrollPageViewDelegate>
{
    
    
    
}
@property(strong, nonatomic)NSArray<NSString *> *titles;
@property(strong, nonatomic)NSArray<UIViewController<ZJScrollPageViewChildVcDelegate> *> *childVcs;
@property (weak, nonatomic) ZJScrollSegmentView *segmentView;
@property (weak, nonatomic) ZJContentView *contentView;

@end

@implementation ActivityDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //必要的设置, 如果没有设置可能导致内容显示不正常
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.childVcs = [self setupChildVc];
    // 初始化
    [self setupSegmentView];
    [self setupContentView];


    // Do any additional setup after loading the view.
}
- (void)setupSegmentView {
    ZJSegmentStyle *style = [[ZJSegmentStyle alloc] init];
    style.showCover = YES;
    // 不要滚动标题, 每个标题将平分宽度
    style.scrollTitle = NO;
    
    // 渐变
    style.gradualChangeTitleColor = YES;
    // 遮盖背景颜色
    style.coverBackgroundColor = AppMCNATitleCOLOR;//[UIColor whiteColor];
    //标题一般状态颜色 --- 注意一定要使用RGB空间的颜色值
    style.normalTitleColor = RGBCOLOR(105, 63, 20);//[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0];
    //标题选中状态颜色 --- 注意一定要使用RGB空间的颜色值
    style.selectedTitleColor = RGBCOLOR(255, 255, 255);//[UIColor colorWithRed:235.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1.0];
    
    self.titles = @[@"报名", @"介绍"];
    
    // 注意: 一定要避免循环引用!!
    __weak typeof(self) weakSelf = self;
    ZJScrollSegmentView *segment = [[ZJScrollSegmentView alloc] initWithFrame:CGRectMake(0, 0.0, 160.0, 28.0) segmentStyle:style delegate:self titles:self.titles titleDidClick:^(ZJTitleView *titleView, NSInteger index) {
        
        [weakSelf.contentView setContentOffSet:CGPointMake(weakSelf.contentView.bounds.size.width * index, 0.0) animated:YES];
        
    }];
    // 自定义标题的样式
    UIColor * cc =AppMCNATitleCOLOR;
    segment.layer.cornerRadius = 14.0;
    segment.backgroundColor = AppMCNACOLOR;
    ViewBorderRadius(segment, 14, 1, cc);

    // 当然推荐直接设置背景图片的方式
    //    segment.backgroundImage = [UIImage imageNamed:@"extraBtnBackgroundImage"];
    
    self.segmentView = segment;
//    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 64, 160, 28)];
//    [view addSubview:self.segmentView];
//    ViewBorderRadius(view, 14, 1, cc);

    self.navigationItem.titleView = self.segmentView;
    
}
- (void)setupContentView {
    
    ZJContentView *content = [[ZJContentView alloc] initWithFrame:CGRectMake(0.0, 64.0, self.view.bounds.size.width, self.view.bounds.size.height - 64.0) segmentView:self.segmentView parentViewController:self delegate:self];
    self.contentView = content;
    [self.view addSubview:self.contentView];
    
}


- (NSArray *)setupChildVc {
    
    ActivityApplyViewController *vc1 = [ActivityApplyViewController new];
//    vc1.view.backgroundColor = [UIColor redColor];
    
    vc1.stateindex = _stateindex;
    
    ActicitIntroduceViewController *vc2 = [ActicitIntroduceViewController new];
//    vc2.view.backgroundColor = [UIColor greenColor];
    
    NSArray *childVcs = [NSArray arrayWithObjects:vc1, vc2, nil];
    return childVcs;
}
- (NSInteger)numberOfChildViewControllers {
    return self.titles.count;
}


- (UIViewController<ZJScrollPageViewChildVcDelegate> *)childViewController:(UIViewController<ZJScrollPageViewChildVcDelegate> *)reuseViewController forIndex:(NSInteger)index {
    UIViewController<ZJScrollPageViewChildVcDelegate> *childVc = reuseViewController;
    
    if (!childVc) {
        childVc = self.childVcs[index];
    }
    return childVc;
}


-(CGRect)frameOfChildControllerForContainer:(UIView *)containerView {
    return  CGRectInset(containerView.bounds, 20, 20);
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
