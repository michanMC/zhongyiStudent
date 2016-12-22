//
//  LessonsViewController.m
//  ZYStudent
//
//  Created by MC on 2016/12/22.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "LessonsViewController.h"
#import "UIPlaceHolderTextView.h"

@interface LessonsViewController ()
{
    UITextField * _nameText;

    UIPlaceHolderTextView *_textview;

}
@end

@implementation LessonsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"补课申请";
    [self prepareUI];
    // Do any additional setup after loading the view.
}
-(void)prepareUI{
    
    CGFloat tw = [MCToolsManage heightforString:@"联系方式" andHeight:44 fontSize:15];
    
    CGFloat x = 10;
    CGFloat y = 10+64;
    CGFloat w = Main_Screen_Width - 2*x;
    CGFloat h = 44;
    
    
    UIView * bgview =[[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    bgview.backgroundColor =[UIColor whiteColor];
    ViewBorderRadius(bgview, 3, 1, [UIColor groupTableViewBackgroundColor]);
    [self.view addSubview:bgview];
    
    UILabel *lbl =[[UILabel alloc]initWithFrame:CGRectMake(10, 0, tw, 44)];
    lbl.text = @"联系方式";
    lbl.font =[UIFont systemFontOfSize:14];
    [bgview addSubview:lbl];
    
    UILabel * img = [[UILabel alloc]initWithFrame:CGRectMake(bgview.mj_w - 5 - 10, 0, 10, 44)];
    img.text = @"*";
    img.textColor =[UIColor redColor];
    
    [bgview addSubview:img];
    
    _nameText =[[UITextField alloc]initWithFrame:CGRectMake(tw + 10 + 10, 0, bgview.mj_w - (tw + 10 + 10+10+10), 44)];
    _nameText.placeholder = @"请输入联系方式，(必填)";
    _nameText.font =[UIFont systemFontOfSize:14];
    [bgview addSubview:_nameText];
    
    y+=h + 10;
    h = 100 + 10;
    //    w = bgview.mj_w
    bgview =[[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    bgview.backgroundColor =[UIColor whiteColor];
    ViewBorderRadius(bgview, 3, 1, [UIColor groupTableViewBackgroundColor]);
    [self.view addSubview:bgview];
    
    _textview =[[UIPlaceHolderTextView alloc]initWithFrame:CGRectMake(10, 5, w - 20, 100)];
    _textview.placeholder =@"请填写备注，不能超过200字";
    _textview.font =[UIFont systemFontOfSize:14];
    [bgview addSubview:_textview];
    
    
    
    
    y += h + 70;
    x = 30;
    w = Main_Screen_Width - 60;
    h = 40;
    UIButton * sutbtn = [[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
    sutbtn.backgroundColor = AppMCNACOLOR;
    ViewRadius(sutbtn, 5);
    [sutbtn setTitle:@"提交" forState:0];
    sutbtn.titleLabel.font =[UIFont systemFontOfSize:15];
    UIColor * cc = AppMCNATitleCOLOR;
    [sutbtn setTitleColor:cc forState:0];
    [self.view addSubview:sutbtn];

 
    
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
