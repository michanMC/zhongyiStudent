//
//  MCChangePwdViewController.m
//  MCZhongYi
//
//  Created by MC on 2016/12/6.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "MCChangePwdViewController.h"

@interface MCChangePwdViewController ()<UITextFieldDelegate>
{
    
    UITextField * _pwdText;
    UITextField * _oldText;
    UITextField * _newText;

    
    
}

@end

@implementation MCChangePwdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"修改密码";
    self.view.backgroundColor =[UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(actionok)];
//    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    CGFloat x = 10;
    CGFloat y = 64;
    CGFloat w = Main_Screen_Width - 2*x;
    CGFloat h = 44;
    _pwdText = [[UITextField alloc]initWithFrame:CGRectMake(x, y, w, h)];
    _pwdText.delegate = self;
    _pwdText.placeholder = @"请输入原密码";
    _pwdText.font = [UIFont systemFontOfSize:14];
    _pwdText.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_pwdText];
    y+=h;
    UIView * lineView = [[UIView alloc]initWithFrame:CGRectMake(0, y, Main_Screen_Width, 0.5)];
    lineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:lineView];
    y+=0.5;
    _oldText = [[UITextField alloc]initWithFrame:CGRectMake(x, y, w, h)];
    _oldText.delegate = self;
    _oldText.placeholder = @"请输入旧密码";
    _oldText.backgroundColor = [UIColor whiteColor];

    _oldText.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:_oldText];
    y+=h;
     lineView = [[UIView alloc]initWithFrame:CGRectMake(0, y, Main_Screen_Width, 0.5)];
    lineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:lineView];
    
    y+=0.5;

    _newText = [[UITextField alloc]initWithFrame:CGRectMake(x, y, w, h)];
    _newText.delegate = self;
    _newText.placeholder = @"请输入新密码";
    _newText.font = [UIFont systemFontOfSize:14];
    _newText.backgroundColor = [UIColor whiteColor];

    [self.view addSubview:_newText];
    y+=h;
    lineView = [[UIView alloc]initWithFrame:CGRectMake(0, y, Main_Screen_Width, 0.5)];
    lineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:lineView];

    
    
    
    // Do any additional setup after loading the view.
}
-(void)actionok{
    [_pwdText resignFirstResponder];
    [_oldText resignFirstResponder];
    [_newText resignFirstResponder];

    
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
