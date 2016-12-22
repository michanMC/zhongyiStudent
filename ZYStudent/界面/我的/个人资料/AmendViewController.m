//
//  AmendViewController.m
//  ZYStudent
//
//  Created by MC on 2016/12/19.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "AmendViewController.h"

@interface AmendViewController ()<UITextFieldDelegate>
{
    UITextField * _TextField;

    
}

@end

@implementation AmendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString * str = @"";
    NSString * pstr = @"";
    if (_Amenindex == 1) {
        str = @"修改昵称";
        pstr = @"请输入昵称";
        
    }
    if (_Amenindex == 2) {
        str = @"修改姓名";
        pstr = @"请输入姓名";
        
    }
    if (_Amenindex == 3) {
        str = @"修改真实姓名";
        pstr = @"请输入真实姓名";
        
    }
    self.title = str;

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(actionok)];
    self.view.backgroundColor =[UIColor whiteColor];

    
    CGFloat x = 10;
    CGFloat y = 64;
    CGFloat w = Main_Screen_Width - 2*x;
    CGFloat h = 44;
    _TextField = [[UITextField alloc]initWithFrame:CGRectMake(x, y, w, h)];
    _TextField.delegate = self;
    _TextField.placeholder = pstr;//@"请输入原密码";
    _TextField.font = [UIFont systemFontOfSize:14];
    _TextField.backgroundColor = [UIColor whiteColor];
    _TextField.clearButtonMode = UITextFieldViewModeAlways;
    [self.view addSubview:_TextField];
    y+=h;
    UIView * lineView = [[UIView alloc]initWithFrame:CGRectMake(0, y, Main_Screen_Width, 0.5)];
    lineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:lineView];

    // Do any additional setup after loading the view.
}
-(void)actionok{
    
    [_TextField resignFirstResponder];
    
    
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
