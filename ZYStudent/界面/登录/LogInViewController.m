//
//  LogInViewController.m
//  MCZhongYi
//
//  Created by MC on 2016/12/12.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "LogInViewController.h"
#import "ChangePwdViewController.h"
#import "RegisterViewController.h"
#import "HomeViewController.h"
#import "MainTableViewController.h"

@interface LogInViewController ()
{
    
    UITextField * _phoneText;
    UITextField * _pwdText;

    
    
}

@end

@implementation LogInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"登录";
    [self prepareUI];
    
    
    // Do any additional setup after loading the view.
}
-(void)prepareUI{
    
    CGFloat w = Main_Screen_Width - 40;
    CGFloat h = 44*2 + 0.5;
    CGFloat x = 20;
    CGFloat y = 64 + 35;
    UIView * bgview = [[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    bgview.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bgview];
    ViewBorderRadius(bgview, 3, 1, [UIColor groupTableViewBackgroundColor]);
    UIView *lineview=[[UIView alloc]initWithFrame:CGRectMake(10, 44, bgview.mj_w - 20, 0.5)];
    lineview.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [bgview addSubview:lineview];
    
    
    UIImageView * img =[[ UIImageView alloc]initWithFrame:CGRectMake(10, 12, 20, 20)];
    img.image = [UIImage imageNamed:@"icon_tel"];
    [bgview addSubview:img];

    img =[[ UIImageView alloc]initWithFrame:CGRectMake(10, 44.5 + 12, 20, 20)];
    img.image = [UIImage imageNamed:@"icon_password"];
    [bgview addSubview:img];
    
    x = 10 + 20 + 8;
    w = bgview.mj_w - x - 8;
    h = 44;
    y = 0;
    _phoneText = [[UITextField alloc]initWithFrame:CGRectMake(x, y, w, h)];
    _phoneText.placeholder = @"请输入手机号/邮箱";
    _phoneText.font = [UIFont systemFontOfSize:14];
    _phoneText.clearButtonMode = UITextFieldViewModeAlways;
    [bgview addSubview:_phoneText];

    y+=h + 0.5;
    
    _pwdText = [[UITextField alloc]initWithFrame:CGRectMake(x, y, w, h)];
    _pwdText.placeholder = @"请输入密码";
    _pwdText.font = [UIFont systemFontOfSize:14];
    _pwdText.clearButtonMode = UITextFieldViewModeAlways;

    [bgview addSubview:_pwdText];
    
    y =bgview.mj_y + bgview.mj_h + 10;

    w = [MCToolsManage heightforString:@"忘记密码" andHeight:20 fontSize:14];
    x = Main_Screen_Width - 20 - w;
    h = 20;
    UIButton *pwdbtn = [[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
//    pwdbtn.backgroundColor =AppMCNACOLOR;
    [pwdbtn setTitle:@"忘记密码" forState:0];
    UIColor *cc = AppMCNATitleCOLOR;
    [pwdbtn setTitleColor:cc forState:0];
    pwdbtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:pwdbtn];
    [pwdbtn addTarget:self action:@selector(actionpwdBtn) forControlEvents:1<<6];
    
    UIButton *resbtn = [[UIButton alloc]initWithFrame:CGRectMake(20, y, w, h)];
    //    pwdbtn.backgroundColor =AppMCNACOLOR;
    [resbtn setTitle:@"立即注册" forState:0];
    [resbtn setTitleColor:cc forState:0];
    resbtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:resbtn];
   [resbtn addTarget:self action:@selector(actionresBtn) forControlEvents:1<<6];

    
    
    x = 30;
    y +=h + 30;
    w= Main_Screen_Width - 2*x;
    h = 40;
    
    UIButton *okbtn = [[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
    okbtn.backgroundColor =AppMCNACOLOR;
    [okbtn setTitle:@"登录" forState:0];
    [okbtn setTitleColor:cc forState:0];
    okbtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:okbtn];
    [okbtn addTarget:self action:@selector(actionOkbtn) forControlEvents:1<<6];
    ViewRadius(okbtn, 3);

    y +=h + 58/2;
    x = Main_Screen_Width/2 + 75/2;
    w = 40;
    h = 40;
    UIButton * weixinbtn = [[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
    [weixinbtn setImage:[UIImage imageNamed:@"btn_wechat"] forState:0];
    [self.view addSubview:weixinbtn];
    UILabel * lbl  = [[UILabel alloc]initWithFrame:CGRectMake(x - 20, y+h + 5, 80, 15)];
    lbl.text = @"微信登录";
    lbl.font = [UIFont systemFontOfSize:13];
    lbl.textColor = [UIColor lightGrayColor];
    lbl.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:lbl];

    
    x =Main_Screen_Width/2 - 75/2 - w;
    UIButton * QQbtn = [[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
    [QQbtn setImage:[UIImage imageNamed:@"btn_qq"] forState:0];
    [self.view addSubview:QQbtn];

    lbl  = [[UILabel alloc]initWithFrame:CGRectMake(x - 20, y+h + 5, 80, 15)];
    lbl.text = @"QQ登录";
    lbl.font = [UIFont systemFontOfSize:13];
    lbl.textColor = [UIColor lightGrayColor];
    lbl.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:lbl];
    
    
//
    w = 296/2;
    h = w;
    y = Main_Screen_Height - 15 - 20 - 20 - w;

    x= (Main_Screen_Width - w )/2;
    UIImageView * imgview = [[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    imgview.image = [UIImage imageNamed:@"pic_bg"];
    [self.view addSubview:imgview];
    
    
    y = Main_Screen_Height - 15 - 20;
    w= Main_Screen_Width;
    h = 20;
    x = 0;
    lbl  = [[UILabel alloc]initWithFrame:CGRectMake(x , y , w, h)];
    lbl.text = @"艺术加贵族学院";
    lbl.font = [UIFont systemFontOfSize:15];
    lbl.textColor = [UIColor lightGrayColor];
    lbl.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:lbl];

    
}
-(void)actionOkbtn{
//    [self toPopVC];
    MainTableViewController * root = [[MainTableViewController alloc]init];
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    appDelegate.window.rootViewController = root;
    
}
-(void)actionpwdBtn{
    ChangePwdViewController * ctl =[[ChangePwdViewController alloc]init];
    [self pushNewViewController:ctl];
    
    
}
-(void)actionresBtn{
    
    RegisterViewController * ctl =[[RegisterViewController alloc]init];
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
