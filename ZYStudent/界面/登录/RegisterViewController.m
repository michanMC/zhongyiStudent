//
//  RegisterViewController.m
//  ZYStudent
//
//  Created by MC on 2016/12/12.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()
{
    UIButton * _vccBtn;
    UITextField * _phonetext;
    UITextField * _vcctext;
    UITextField * _pwdtext;
    NSTimer *_gameTimer;
    NSDate   *_gameStartTime;
    

    
}

@end

@implementation RegisterViewController
-(void)actionL{
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"注册";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:@selector(actionL)];

    [self prepareUI];
    // Do any additional setup after loading the view.
}
-(void)prepareUI{
    
    CGFloat w = Main_Screen_Width - 40;
    CGFloat h = 44*3 + 1;
    CGFloat x = 20;
    CGFloat y = (Main_Screen_Height - h)/2;
    UIView * bgview = [[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    bgview.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bgview];
    ViewBorderRadius(bgview, 3, 1, [UIColor groupTableViewBackgroundColor]);
    UIView *lineview=[[UIView alloc]initWithFrame:CGRectMake(10, 44, bgview.mj_w - 20, 0.5)];
    lineview.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [bgview addSubview:lineview];
    lineview=[[UIView alloc]initWithFrame:CGRectMake(10, 44+0.5+44, bgview.mj_w - 20, 0.5)];
    lineview.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [bgview addSubview:lineview];
    
    UIImageView * img =[[ UIImageView alloc]initWithFrame:CGRectMake(10, 12, 20, 20)];
    img.image = [UIImage imageNamed:@"icon_tel"];
    [bgview addSubview:img];
    
    img =[[ UIImageView alloc]initWithFrame:CGRectMake(10, 44.5 + 12, 20, 20)];
    img.image = [UIImage imageNamed:@"icon_code"];
    [bgview addSubview:img];
    
    img =[[ UIImageView alloc]initWithFrame:CGRectMake(10, 44.5+44 + 12, 20, 20)];
    img.image = [UIImage imageNamed:@"icon_password"];
    [bgview addSubview:img];
    
    x = 10 + 20 + 8;
    w = bgview.mj_w - x - 8;
    h = 44;
    y = 0;
    _phonetext = [[UITextField alloc]initWithFrame:CGRectMake(x, y, w, h)];
    _phonetext.placeholder = @"请输入手机号/邮箱";
    _phonetext.font = [UIFont systemFontOfSize:14];
    _phonetext.clearButtonMode = UITextFieldViewModeAlways;
    [bgview addSubview:_phonetext];
    
    y+=h + 0.5;
    CGFloat lw = [MCToolsManage heightforString:@"获取验证码" andHeight:40 fontSize:14];
    
    w = bgview.mj_w - x - 8 - lw - 10;
    _vcctext = [[UITextField alloc]initWithFrame:CGRectMake(x, y, w, h)];
    _vcctext.placeholder = @"请输入验证码";
    _vcctext.font = [UIFont systemFontOfSize:14];
    _vcctext.clearButtonMode = UITextFieldViewModeAlways;
    
    [bgview addSubview:_vcctext];
    
    _vccBtn = [[UIButton alloc]initWithFrame:CGRectMake(bgview.mj_w - 8 - lw, y, lw, h)];
    //    pwdbtn.backgroundColor =AppMCNACOLOR;
    [_vccBtn setTitle:@"获取验证码" forState:0];
    UIColor *cc = AppMCNATitleCOLOR;
    [_vccBtn setTitleColor:cc forState:0];
    _vccBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [bgview addSubview:_vccBtn];
    [_vccBtn addTarget:self action:@selector(actionvccBtn) forControlEvents:1<<6];
    
    
    
    
    y+=h + 0.5;
    w = bgview.mj_w - x - 8 - 40;
    
    _pwdtext = [[UITextField alloc]initWithFrame:CGRectMake(x, y, w, h)];
    _pwdtext.placeholder = @"请输入密码";
    _pwdtext.font = [UIFont systemFontOfSize:14];
    _pwdtext.clearButtonMode = UITextFieldViewModeAlways;
    
    [bgview addSubview:_pwdtext];
    
    
    UIButton * lookBtn = [[UIButton alloc]initWithFrame:CGRectMake(bgview.mj_w - 8 - 20, y+12, 20, 20)];
    //    pwdbtn.backgroundColor =AppMCNACOLOR;
    [lookBtn setImage:[UIImage imageNamed:@"btn_see"] forState:UIControlStateNormal];
    [lookBtn setImage:[UIImage imageNamed:@"btn_see_pre"] forState:UIControlStateSelected];
    [lookBtn addTarget:self action:@selector(actionLookbtn:) forControlEvents:1<<6];
    
    [bgview addSubview:lookBtn];
    
    x = 30;
    y =bgview.mj_y + bgview.mj_h + 60;
    w= Main_Screen_Width - 2*x;
    h = 40;
    
    UIButton *okbtn = [[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
    okbtn.backgroundColor =AppMCNACOLOR;
    [okbtn setTitle:@"完成" forState:0];
    [okbtn setTitleColor:cc forState:0];
    okbtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:okbtn];
    [okbtn addTarget:self action:@selector(actionOkbtn) forControlEvents:1<<6];
    ViewRadius(okbtn, 3);
    y = (bgview.mj_y  - 240/2)/2+64/2;
    
    w = 240/2;
    h = w;
    x= (Main_Screen_Width - w )/2;
    UIImageView * imgview = [[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    imgview.image = [UIImage imageNamed:@"login_logo"];
    [self.view addSubview:imgview];
    

    
    
}
-(void)actionLookbtn:(UIButton*)btn{
    
    btn.selected = !btn.selected;
}
-(void)actionOkbtn{
    [self toPopVC];
}

-(void)actionvccBtn{
    _gameStartTime=[NSDate date];
    _gameTimer= [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(updateTimer:) userInfo:nil repeats:YES];
    
    
}
// 时钟触发执行的方法
- (void)updateTimer:(NSTimer *)sender
{
    NSInteger deltaTime = [sender.fireDate timeIntervalSinceDate:_gameStartTime];
    
    NSString *text = [NSString stringWithFormat:@"%lds",60 - deltaTime];
    
    if (deltaTime>60) {
        [_vccBtn setTitle:@"重新发送" forState:UIControlStateNormal];
        [_vccBtn setUserInteractionEnabled:YES];
        [_gameTimer invalidate];
        return;
    }else
    {
        [_vccBtn setTitle:text forState:UIControlStateNormal];
        [_vccBtn setUserInteractionEnabled:NO];
        
    }
    
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
