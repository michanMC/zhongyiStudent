//
//  ActivityTableViewCell.m
//  ZYStudent
//
//  Created by MC on 2016/12/18.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "ActivityTableViewCell.h"

@implementation ActivityTableViewCell


-(void)prepareUI{
    
    for (UIView *view in self.contentView.subviews) {
        [view removeFromSuperview];
    }
    self.contentView.backgroundColor =AppBgCOLOR;
    CGFloat x = 10;
    CGFloat y = 0;
    CGFloat w = Main_Screen_Width - 2*x;
    
    CGFloat viewh = 5 + 40 + 10 + 15 + 5 +MCAdaptiveH(750, 250, Main_Screen_Width) + 50;
    UIColor * cc = AppMCNACOLOR;
    UIView * bgiew =[[ UIView alloc]initWithFrame:CGRectMake(x, y, w, viewh)];
    bgiew.backgroundColor =[UIColor whiteColor];
    ViewBorderRadius(bgiew, 4, 0.5, cc);
    [self.contentView addSubview:bgiew];
    
    x = 10;
    y = 5;
    w = bgiew.mj_w  - 2*x;
   CGFloat h = 40;
    
    UILabel * titleLbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    titleLbl.text= @"活动活动活动活动活动活动活动活动活动活动活动活动活动活动活动活动活动";
    titleLbl.font =[UIFont systemFontOfSize:15];
    titleLbl.numberOfLines = 0;
    [bgiew addSubview:titleLbl];
    
    y +=h+ 10;
    h = 15;
    UILabel * timeLbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    timeLbl.text= @"报名时间: 2016-09-09至2016-10-10";
    timeLbl.font =[UIFont systemFontOfSize:13];
    timeLbl.textColor =[UIColor lightGrayColor];
    [bgiew addSubview:timeLbl];

    y+=h + 5;
    
    h =MCAdaptiveH(750, 250, Main_Screen_Width);
    UIImageView * imgview =[[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    imgview.image =[UIImage imageNamed:@"bg_def_240"];
    [bgiew addSubview:imgview];
    y +=h + 10;

    w = 70;
    h = 30;
    x = bgiew.mj_w  -10 -w;
    _tepyBtn = [[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
    _tepyBtn.titleLabel.font =[UIFont systemFontOfSize:14];
    [bgiew addSubview:_tepyBtn];

    
    
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
