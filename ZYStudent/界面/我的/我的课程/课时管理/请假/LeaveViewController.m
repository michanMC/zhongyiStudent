//
//  LeaveViewController.m
//  ZYStudent
//
//  Created by MC on 2016/12/22.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "LeaveViewController.h"
#import "SelectLeaClass2ViewController.h"
#import "UIPlaceHolderTextView.h"
#import "MCtimeSelectView.h"
#import "LeaveJLViewController.h"

@interface LeaveViewController ()<MCtimeSelectDelegate>
{
    
    UILabel * _selectKsLbl;
    UILabel * _selectTimeLbl;
    UIPlaceHolderTextView * _textview;
    MCtimeSelectView *  SelectView;

}

@end

@implementation LeaveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title= @"请假";
    [self prepareUI];
    self.navigationItem.rightBarButtonItem= [[UIBarButtonItem alloc]initWithTitle:@"请假纪录" style:UIBarButtonItemStylePlain target:self action:@selector(actionjL)];

    
    
    // Do any additional setup after loading the view.
}
-(void)prepareUI{
    CGFloat x = 10;
    CGFloat y = 10+64;
    CGFloat w = Main_Screen_Width - 2*x;
    CGFloat h = 44;
    
    
    UIView * bgview =[[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    bgview.backgroundColor =[UIColor whiteColor];
    ViewBorderRadius(bgview, 3, 1, [UIColor groupTableViewBackgroundColor]);
    [self.view addSubview:bgview];
    UILabel *lbl =[[UILabel alloc]initWithFrame:CGRectMake(10, 0, 70, 44)];
    lbl.text = @"选择课时";
    lbl.font =[UIFont systemFontOfSize:14];
    [bgview addSubview:lbl];
    
    UIImageView * img = [[UIImageView alloc]initWithFrame:CGRectMake(bgview.mj_w - 5 - 20, 12, 20, 20)];
    img.image =[UIImage imageNamed:@"btn_next-arrow"];
    
    [bgview addSubview:img];

    _selectKsLbl =[[UILabel alloc]initWithFrame:CGRectMake(80, 0, bgview.mj_w - 80 - 40, 44)];
    _selectKsLbl.text = @"请选择(必填)";
    _selectKsLbl.font =[UIFont systemFontOfSize:14];
    _selectKsLbl.textColor =[UIColor lightGrayColor];
    _selectKsLbl.textAlignment = NSTextAlignmentRight;
    [bgview addSubview:_selectKsLbl];
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, bgview.mj_w, bgview.mj_h)];
    [btn addTarget:self action:@selector(actionSeleKs) forControlEvents:1<<6];
    [bgview addSubview:btn];

    
    
    
    
    x = 10;
     y = bgview.mj_y + bgview.mj_h + 10;
     w = Main_Screen_Width - 2*x;
    h = 44;
    bgview =[[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    bgview.backgroundColor =[UIColor whiteColor];
    ViewBorderRadius(bgview, 3, 1, [UIColor groupTableViewBackgroundColor]);
    [self.view addSubview:bgview];

    lbl =[[UILabel alloc]initWithFrame:CGRectMake(10, 0, 70, 44)];
    lbl.text = @"请假时间";
    lbl.font =[UIFont systemFontOfSize:14];
    [bgview addSubview:lbl];
     img = [[UIImageView alloc]initWithFrame:CGRectMake(bgview.mj_w - 5 - 20, 12, 20, 20)];
    img.image =[UIImage imageNamed:@"btn_next-arrow"];
    
    [bgview addSubview:img];
    
    _selectTimeLbl =[[UILabel alloc]initWithFrame:CGRectMake(80, 0, bgview.mj_w - 80 - 40, 44)];
    _selectTimeLbl.text = @"请选择(必填)";
    _selectTimeLbl.font =[UIFont systemFontOfSize:14];
    _selectTimeLbl.textColor =[UIColor lightGrayColor];
    _selectTimeLbl.textAlignment = NSTextAlignmentRight;
    [bgview addSubview:_selectTimeLbl];
    btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, bgview.mj_w, bgview.mj_h)];
    [btn addTarget:self action:@selector(actionSeletime) forControlEvents:1<<6];
    [bgview addSubview:btn];
    
    y+=h + 10;
    h = 30 + 100 + 10;
    
    bgview =[[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    bgview.backgroundColor =[UIColor whiteColor];
    ViewBorderRadius(bgview, 3, 1, [UIColor groupTableViewBackgroundColor]);
    [self.view addSubview:bgview];
    lbl =[[UILabel alloc]initWithFrame:CGRectMake(10, 5, 70, 20)];
    lbl.text = @"请假事由";
    lbl.font =[UIFont systemFontOfSize:14];
    [bgview addSubview:lbl];


    _textview =[[UIPlaceHolderTextView alloc]initWithFrame:CGRectMake(10, 30, w - 20, 100)];
    _textview.placeholder =@"请输入请假事由(必填)";
    _textview.font =[UIFont systemFontOfSize:14];
    [bgview addSubview:_textview];


    
    y +=h + 5;
    x = 10;
    w = 20;
    h = 20;
    UIImageView * iocnImg = [[UIImageView alloc]initWithFrame:CGRectMake(10, y, 20, 20)];
    iocnImg.image = [UIImage imageNamed:@"icon_time"];
    [self.view addSubview:iocnImg];
    x +=w+3;
    w = Main_Screen_Width - w;
   UILabel* lbl2 = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl2.text = @"需提前3天进行请假";
    lbl2.textColor =[UIColor darkTextColor];
    lbl2.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:lbl2];
   
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
-(void)actionjL{
    LeaveJLViewController * ctl =[[LeaveJLViewController alloc]init];
    [self pushNewViewController:ctl];

}
-(void)actionSeleKs{
    SelectLeaClass2ViewController * ctl =[[SelectLeaClass2ViewController alloc]init];
    [self pushNewViewController:ctl];
    
    
}
-(void)actionSeletime{
    SelectView= [[MCtimeSelectView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, Main_Screen_Height)];
    SelectView.deldagate = self;
    [SelectView showInWindow];
}
-(void)MCtimeSelecthidden
{
    [SelectView removeFromSuperview];
    
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
