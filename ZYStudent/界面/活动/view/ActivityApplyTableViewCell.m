//
//  ActivityApplyTableViewCell.m
//  ZYStudent
//
//  Created by MC on 2016/12/18.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "ActivityApplyTableViewCell.h"
#import "LXGradientProcessView.h"
@implementation ActivityApplyTableViewCell


-(void)prepareUI{
    
    for (UIView *view in self.contentView.subviews) {
        [view removeFromSuperview];
    }
    CGFloat x = 10;
    CGFloat y =0;
    CGFloat w = Main_Screen_Width -2*x;
    CGFloat viewh = 196;
    UIColor * cc = AppMCNACOLOR;
    self.contentView.backgroundColor = AppBgCOLOR;
    UIView * bgview =[[UIView alloc]initWithFrame:CGRectMake(x, y, w, viewh)];
    bgview.backgroundColor =[UIColor whiteColor];
    ViewBorderRadius(bgview, 3, 0.5, cc);
    [self.contentView addSubview:bgview];
    
    w = [MCToolsManage heightforString:@"报名须知" andHeight:20 fontSize:15];
    x = (bgview.mj_w - w)/2;
   CGFloat h = 20;
    y = 10;
    UILabel * lbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.text = @"报名须知";
    lbl.font = [UIFont systemFontOfSize:15];
    [bgview addSubview:lbl];
    y +=h;
    h = 1;
    UIView * lineView =[[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lineView.backgroundColor  = AppMCNACOLOR;
    [bgview addSubview:lineView];

    y+=h + 15;
    x = 10;
    w = 20;
    h = 20;
    CGFloat yy = y;
    NSArray * imgarray = @[@"icon_date",@"icon_address",@"icon_child'age",@"icon_building",@"icon_cost"];
    
    for (NSString * str in imgarray) {
        
        UIImageView * imgview =[[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
        imgview.image =[UIImage imageNamed:str];
        [bgview addSubview:imgview];
        y+=h + 10;
        
    }
    x +=w + 3;
    y =yy;
    
    w = [MCToolsManage heightforString:@"报名时间" andHeight:20 fontSize:14];
    
    NSArray * titlearray = @[@"报名时间",@"活动地址",@"年龄范围",@"主办单位",@"活动费用"];
    
    for (NSString * str in titlearray) {
        
        UILabel * titleLbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
        titleLbl.text = str;
        titleLbl.font = [UIFont systemFontOfSize:14];
        titleLbl.textColor =[UIColor lightGrayColor];
        
        
        [bgview addSubview:titleLbl];
        y+=h + 10;
        
    }
    x +=w;

    w = bgview.mj_w - x - 10;
    y = yy;
    UILabel * titleLbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    titleLbl.font =[UIFont systemFontOfSize:14];
    titleLbl.textAlignment = NSTextAlignmentRight;
    titleLbl.text = @"2016-09-09 - 2016-09-10";
    [bgview addSubview:titleLbl];
    y+=h+10;
    titleLbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    titleLbl.font =[UIFont systemFontOfSize:14];
    titleLbl.textAlignment = NSTextAlignmentRight;
    titleLbl.text = @"地址地址地址地址地址地址";
    [bgview addSubview:titleLbl];
    y+=h+10;
    titleLbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    titleLbl.font =[UIFont systemFontOfSize:14];
    titleLbl.textAlignment = NSTextAlignmentRight;
    titleLbl.text = @"6-13岁";
    [bgview addSubview:titleLbl];

    y+=h+10;
    titleLbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    titleLbl.font =[UIFont systemFontOfSize:14];
    titleLbl.textAlignment = NSTextAlignmentRight;
    titleLbl.text = @"不知名机构";
    [bgview addSubview:titleLbl];
    y+=h+10;
    titleLbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    titleLbl.font =[UIFont systemFontOfSize:14];
    titleLbl.textAlignment = NSTextAlignmentRight;
    titleLbl.text = @"￥2300.00";
    [bgview addSubview:titleLbl];

    y+=h+10;
    NSLog(@"%f",y);
    
}
-(void)prepareUI2{
    
    for (UIView *view in self.contentView.subviews) {
        [view removeFromSuperview];
    }
    CGFloat x = 10;
    CGFloat y =0;
    CGFloat w = Main_Screen_Width -2*x;
    CGFloat viewh = 91;
    UIColor * cc = AppMCNACOLOR;
    self.contentView.backgroundColor = AppBgCOLOR;
    UIView * bgview =[[UIView alloc]initWithFrame:CGRectMake(x, y, w, viewh)];
    bgview.backgroundColor =[UIColor whiteColor];
    ViewBorderRadius(bgview, 3, 0.5, cc);
    [self.contentView addSubview:bgview];
    
    w = [MCToolsManage heightforString:@"报名须知" andHeight:20 fontSize:15];
    x = (bgview.mj_w - w)/2;
    CGFloat h = 20;
    y = 10;
    UILabel * lbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.text = @"报名须知";
    lbl.font = [UIFont systemFontOfSize:15];
    [bgview addSubview:lbl];
    y +=h;
    h = 1;
    UIView * lineView =[[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lineView.backgroundColor  = AppMCNACOLOR;
    [bgview addSubview:lineView];
    CGFloat yy  = y+h + 10;
    y += h + 10 + 20;
    x = 10;
    w = bgview.mj_w - 2*x;
    h = 20;
    
   LXGradientProcessView* progressView = [[LXGradientProcessView alloc] initWithFrame:CGRectMake(x, y, w, h)];
       progressView.percent = 88.0f;
//    progressView.backgroundColor = [UIColor redColor];
    [bgview addSubview:progressView];
    

    y +=h + 10;
    
    
    UILabel * countLbl =[[UILabel alloc]initWithFrame:CGRectMake(30,yy , 100, 20)];
    countLbl.text = @"1/10";
    countLbl.font =[UIFont systemFontOfSize:14];
    [bgview addSubview:countLbl];

    
    
    
    

    NSLog(@"%f",y);

    
    
}
-(void)prepareUI3{
    
    for (UIView *view in self.contentView.subviews) {
        [view removeFromSuperview];
    }
    CGFloat x = 10;
    CGFloat y = 10;
    CGFloat w = Main_Screen_Width -2*x;
    CGFloat h = 40;
    UILabel * titleLbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    titleLbl.font =[UIFont systemFontOfSize:15];
    titleLbl.numberOfLines = 0;
    titleLbl.text = @"首届首届首届首届首届首届首届首届首届首届首届首届首届首届首届";
    [self.contentView addSubview:titleLbl];
    y +=h + 10;
    h = MCAdaptiveH(750, 400,Main_Screen_Width);
    
    
    
    UIImageView * imgview =[[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    imgview.image =[UIImage imageNamed:@"bg_def_424"];
    [self.contentView addSubview:imgview];
    
    y +=h + 10;
    NSString * ss = @"手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机手机";
    h = [MCToolsManage heightforString:ss andWidth:w fontSize:14];
    
    titleLbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    titleLbl.font =[UIFont systemFontOfSize:14];
    titleLbl.numberOfLines = 0;
    titleLbl.text = ss;
    [self.contentView addSubview:titleLbl];

}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
