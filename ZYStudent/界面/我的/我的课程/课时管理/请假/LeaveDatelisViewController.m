//
//  LeaveDatelisViewController.m
//  ZYStudent
//
//  Created by MC on 2016/12/22.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "LeaveDatelisViewController.h"

@interface LeaveDatelisViewController ()

@end

@implementation LeaveDatelisViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"请假详情";
    [self prepareUI];
    self.view.backgroundColor =[UIColor whiteColor];
    
    // Do any additional setup after loading the view.
}
-(void)prepareUI{
    
    CGFloat x = 10;
    CGFloat y = 7 + 64;
    CGFloat w = 40;
    CGFloat h = w;
    UIImageView * imgview =[[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    imgview.image =[UIImage imageNamed:@"def_head112"];
    [self.view addSubview:imgview];
    
    x +=w + 8;
    w = Main_Screen_Width - x - 10;
    h = 20;
    UILabel * nameLbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    nameLbl.text = @"michan";
    nameLbl.font =[UIFont systemFontOfSize:15];
    [self.view addSubview:nameLbl];
    y+=h+2;
    UILabel * sateLbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    sateLbl.text = @"已拒绝";
    sateLbl.font =[UIFont systemFontOfSize:14];
    sateLbl.textColor =[UIColor grayColor];
    [self.view addSubview:sateLbl];
    
    x = 10;
    w = Main_Screen_Width - 20;
    y  = imgview.mj_h + imgview.mj_y + 7;
    h =0.5;
    
    UIView * lineView =[[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lineView.backgroundColor =[UIColor groupTableViewBackgroundColor];
    [self.view addSubview:lineView];

    y+=h + 10;
    w= [MCToolsManage heightforString:@"课程名称:" andHeight:20 fontSize:14];
    h = 20;
    NSArray * titlearray = @[@"课程名称:",@"课程课时:",@"请假时间:",@"请假事由:",@"拒绝原因:"];
    NSArray * titlearray2 = @[@"吉他",@"2016-09-09 12：00-13：00",@"2016-09-07 12：27",@"生病",@"请至少提前3天请假"];
    
    
    for (NSInteger i =0; i < titlearray.count; i++) {
        UILabel * lbl1 =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
        lbl1.textColor =[UIColor grayColor ];
        lbl1.font =[UIFont systemFontOfSize:14];
        lbl1.text = titlearray[i];
        [self.view addSubview:lbl1];
        UILabel * lbl2 =[[UILabel alloc]initWithFrame:CGRectMake(w + 5 + 10, y, Main_Screen_Width - w -5 -10, h)];
        lbl2.textColor =[UIColor grayColor ];
        lbl2.font =[UIFont systemFontOfSize:14];
        lbl2.text = titlearray2[i];
        [self.view addSubview:lbl2];
        y +=h+7;
        if (i+1 ==titlearray.count) {
            UIView * lineView =[[UIView alloc]initWithFrame:CGRectMake(0, y, Main_Screen_Width, 0.5)];
            lineView.backgroundColor =[UIColor groupTableViewBackgroundColor];
            [self.view addSubview:lineView];
        }
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
