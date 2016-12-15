//
//  MakeAcceptViewController.m
//  ZYStudent
//
//  Created by MC on 2016/12/15.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "MakeAcceptViewController.h"
#import "SelectSonViewController.h"

@interface MakeAcceptViewController ()<SelectSondelegare>
{
    UITextField * _nameText;
    UITextField * _phoneText;
    UITextField * _mudiText;

    UILabel * _sunLbl;

    
}

@end

@implementation MakeAcceptViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"预约试听";
    [self prepareUI];
    
    
    
    // Do any additional setup after loading the view.
}
-(void)prepareUI{
   
    CGFloat x  = 15;
    CGFloat y = 15+64;
    CGFloat w = Main_Screen_Width - 2*x;
    CGFloat h = 44*2 + 0.5;
    
    UIView * bgview =[[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    bgview.backgroundColor =[UIColor whiteColor];
    ViewBorderRadius(bgview, 3, 1, [UIColor groupTableViewBackgroundColor]);
    [self.view addSubview:bgview];
    UIView * lineView =[[UIView alloc]initWithFrame:CGRectMake(0, 44, bgview.mj_w, 0.5)];
    lineView.backgroundColor =[UIColor groupTableViewBackgroundColor];
    [bgview addSubview:lineView];
    
    w= [MCToolsManage heightforString:@"联系方式" andHeight:44 fontSize:15];
    x = 10;
    y = 0;
    h = 44;
    UILabel * lbl =[[ UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.text = @"姓名";
    lbl.font =[UIFont systemFontOfSize:15];
    [bgview addSubview:lbl];
    x += w+10;
    w = bgview.mj_w - x - 10;
    
    
    _nameText = [[UITextField alloc]initWithFrame:CGRectMake(x, y, w, h)];
    _nameText.font =[UIFont systemFontOfSize:14];
    _nameText.placeholder = @"请输入真实姓名(必填)";
    [bgview addSubview:_nameText];

    
    x = 10;
    y = 44.5;
    h = 44;
    lbl =[[ UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.text = @"联系方式";
    lbl.font =[UIFont systemFontOfSize:15];
    [bgview addSubview:lbl];
    x =_nameText.mj_x;

    w = bgview.mj_w - x - 10;
    _phoneText = [[UITextField alloc]initWithFrame:CGRectMake(x, y, w, h)];
    _phoneText.font =[UIFont systemFontOfSize:14];
    _phoneText.placeholder = @"请输入联系方式(必填)";
    [bgview addSubview:_phoneText];
    
    

    
     x  = 15;
     y = 15 + bgview.mj_h + 10+64;
    w = Main_Screen_Width - 2*x;
     h = 44*2 + 0.5;
    
     bgview =[[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    bgview.backgroundColor =[UIColor whiteColor];
    ViewBorderRadius(bgview, 3, 1, [UIColor groupTableViewBackgroundColor]);
    [self.view addSubview:bgview];
    lineView =[[UIView alloc]initWithFrame:CGRectMake(0, 44, bgview.mj_w, 0.5)];
    lineView.backgroundColor =[UIColor groupTableViewBackgroundColor];
    [bgview addSubview:lineView];
    
    
    
    
    w= [MCToolsManage heightforString:@"联系方式" andHeight:44 fontSize:15];
    x = 10;
    y = 0;
    h = 44;
    lbl =[[ UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.text = @"选择孩子";
    lbl.font =[UIFont systemFontOfSize:15];
    [bgview addSubview:lbl];
    x += w+10;
    w = bgview.mj_w - x - 10;
    
    
    _sunLbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    _sunLbl.font =[UIFont systemFontOfSize:14];
    _sunLbl.text = @"请选择孩子(必填)";
    _sunLbl.textColor =[UIColor lightGrayColor];
    [bgview addSubview:_sunLbl];
    UIButton * selectBtn = [[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
    [selectBtn addTarget:self action:@selector(actionselectBtn) forControlEvents:1<<6];
    [bgview addSubview:selectBtn];

    
    x = 10;
    y = 44.5;
    h = 44;
    lbl =[[ UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.text = @"报班目的";
    lbl.font =[UIFont systemFontOfSize:15];
    [bgview addSubview:lbl];
    x =_nameText.mj_x;
    
    w = bgview.mj_w - x - 10;
    _phoneText = [[UITextField alloc]initWithFrame:CGRectMake(x, y, w, h)];
    _phoneText.font =[UIFont systemFontOfSize:14];
    _phoneText.placeholder = @"请输入报班目的(必填)";
    [bgview addSubview:_phoneText];
    

    UIButton * sutBtn = [[UIButton alloc]initWithFrame:CGRectMake(30, bgview.mj_y + bgview.mj_h + 50, Main_Screen_Width - 60, 35)];
    sutBtn.backgroundColor = AppMCNACOLOR;
    [sutBtn setTitle:@"提交" forState:0];
    sutBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    UIColor *cc = AppMCNATitleCOLOR;
    [sutBtn setTitleColor:cc forState:0];
    [self.view addSubview:sutBtn];
    ViewRadius(sutBtn, 3);
    
    
}
-(void)actionselectBtn{
    SelectSonViewController * ctl =[[SelectSonViewController alloc]init];
    ctl.delegate = self;
    [self pushNewViewController:ctl];
    
    
    
    
}
-(void)selectSon
{
    
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
