//
//  MainTableViewController.m
//  Hair
//
//  Created by michan on 15/5/26.
//  Copyright (c) 2015年 MC. All rights reserved.
//

#import "MainTableViewController.h"
#import "HomeViewController.h"
#import "ActivityViewController.h"
#import "OrganizationViewController.h"
#import "MeViewController.h"

@interface MainTableViewController (){
    
    
    
}

@end

@implementation MainTableViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    

    [self setupViews];

    // Do any additional setup after loading the view.
}
- (void)setupViews
{
   
    
    

    HomeViewController *home = [[HomeViewController alloc]init];
    [self setUpChildController:home title:@"首页" imageName:@"tab_icon_home_white" selectedImageName:@"tab_icon_home" Tag:90000];
    
    ////    _contasctsVC = [[ContactsViewController alloc]init];
    //
    OrganizationViewController *Organiview= [[OrganizationViewController alloc] init];
    //    [_chatListVC networkChanged:_connectionState];
    [self setUpChildController:Organiview title:@"机构" imageName:@"tab_icon_organ_white" selectedImageName:@"tab_icon_organ" Tag:90001];

    
    
    ActivityViewController *ActivityView = [[ActivityViewController alloc]init];
    [self setUpChildController:ActivityView title:@"活动" imageName:@"tab_icon_activity_white" selectedImageName:@"tab_icon_activity" Tag:90002];
    
    
    
    
    MeViewController *meview = [[MeViewController alloc]init];
    [self setUpChildController:meview title:@"我的" imageName:@"tab_icon_me_white" selectedImageName:@"tab_icon_me" Tag:90003];

}
-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    
}
- (void)setUpChildController:(UIViewController *)controller title:(NSString *)title imageName:(NSString *)image selectedImageName:(NSString *)selectedImage Tag:(NSInteger)tag
{
    controller.title = title;
    // 底部字体颜色
    self.tabBar.tintColor = AppMCNATitleCOLOR;//RGBCOLOR(254, 96, 149);
    //默认的图片
    [controller.tabBarItem setImage:[[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];

   // if (title)
    //选择时的图片,将其渲染方式设置为原始的颜色
    [controller.tabBarItem setSelectedImage:[[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    controller.tabBarItem.tag = tag;
 
    
    MCNavViewController *nav = [[MCNavViewController alloc]initWithRootViewController:controller];
   
    [self addChildViewController:nav];
    
    
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
