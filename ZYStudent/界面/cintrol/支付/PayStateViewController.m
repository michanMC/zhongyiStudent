//
//  PayStateViewController.m
//  ZYStudent
//
//  Created by MC on 2016/12/17.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "PayStateViewController.h"

@interface PayStateViewController ()

@end

@implementation PayStateViewController
-(void)actionl{
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([_StateStr isEqualToString:@"1"]) {
        self.title = @"支付成功";
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:@selector(actionl)];
    }
    else
    {
        self.title = @"支付失败";
 
    }
    [self prepareUI];
    
    
    // Do any additional setup after loading the view.
}
-(void)prepareUI{
    
    
    CGFloat x = 0;
    CGFloat h = 20;
    CGFloat w = Main_Screen_Width;
    CGFloat y = (Main_Screen_Height - h)/2;
    UILabel* titleLbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    titleLbl.font =[UIFont systemFontOfSize:17];
    titleLbl.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:titleLbl];
    
    UIImageView * imgview = [[UIImageView alloc]initWithFrame:CGRectMake((Main_Screen_Width - 110)/2, titleLbl.mj_y - 50 -110, 110, 110)];
    
    [self.view addSubview:imgview];

    
    
    y += h +10;

    if ([_StateStr isEqualToString:@"1"]) {
        titleLbl.text= @"你已成功支付￥233.00";
        h = 20;
        imgview.image =[UIImage imageNamed:@"bg_pay_success"];
    }
    else
    {
        imgview.image =[UIImage imageNamed:@"bg_pay_fail"];

        titleLbl.text= @"支付失败";
        h = 40;
    }
    
    titleLbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    titleLbl.font =[UIFont systemFontOfSize:15];
    titleLbl.textAlignment = NSTextAlignmentCenter;
    titleLbl.numberOfLines =0;
    titleLbl.textColor =[UIColor grayColor];
    [self.view addSubview:titleLbl];
    
    if ([_StateStr isEqualToString:@"1"]) {
        titleLbl.text= @"你的订单编号:1000000000000";
        
    }
    else
    {
        titleLbl.text= @"尊敬的用户，订单支付失败，\n请重新支付";
    }
    UIColor *cc = AppMCNATitleCOLOR;

    y +=h+60;
    if ([_StateStr isEqualToString:@"1"]) {
        w = 80;
        h = 35;
        x = Main_Screen_Width /2- 10 - w;
        UIButton *btn1 =[[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
        btn1.backgroundColor =[UIColor groupTableViewBackgroundColor];
        [btn1 setTitle:@"回首页" forState:0];
        [btn1 setTitleColor:[UIColor darkTextColor] forState:0];
        btn1.titleLabel.font = [UIFont systemFontOfSize:15];
        ViewRadius(btn1, 3);
        [btn1 addTarget:self action:@selector(actionhome) forControlEvents:1<<6];
        [self.view addSubview:btn1];
        x = Main_Screen_Width /2+ 10;
        UIButton *btn =[[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
        btn.backgroundColor =AppMCNACOLOR;
        [btn setTitle:@"查看订单" forState:0];
        [btn setTitleColor:cc forState:0];
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        ViewRadius(btn, 3);
        [self.view addSubview:btn];
        [btn addTarget:self action:@selector(actionored) forControlEvents:1<<6];


        
        

    }
    else
    {
        w = 80;
        h = 35;
        x = (Main_Screen_Width - w)/2;
        UIButton *btn =[[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
        btn.backgroundColor =AppMCNACOLOR;
        [btn setTitle:@"重新支付" forState:0];
        [btn setTitleColor:cc forState:0];
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        ViewRadius(btn, 3);
        [self.view addSubview:btn];
        [btn addTarget:self action:@selector(actionback) forControlEvents:1<<6];

        
    }
    
    
    
}
-(void)actionhome{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}
#pragma mark-订单
-(void)actionored{
    
    
}
-(void)actionback{
    [self.navigationController popViewControllerAnimated:YES];
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
