//
//  OrganiHomeTableViewCell.m
//  MCZhongYi
//
//  Created by MC on 2016/12/12.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "OrganiHomeTableViewCell.h"

@implementation OrganiHomeTableViewCell
-(void)prepareUI1{
    for (UIView * view in self.contentView.subviews) {
        [view removeFromSuperview];
        
    }
    CGFloat x = 10;
    CGFloat y= 8;
    CGFloat w = 20;
    CGFloat h = 20;
    UIImageView * img = [[UIImageView alloc]initWithFrame:CGRectMake(x, y, w-5, h-3)];
    img.image =[UIImage imageNamed:@"icon_location2"];
    [self.contentView addSubview:img];
    
    
    x +=w +10;
    w = Main_Screen_Width - x - 70 - 10;
    h = (60 - 16);
    UILabel * lbl  =[[UILabel alloc]initWithFrame:CGRectMake(x, y-5, w, h)];
    lbl.text= @"地址地址地址地址地址地址地址地址地址地址地址地址地址地址地址";
    lbl.numberOfLines = 0;
    lbl.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:lbl];

    x +=w;
    w = 0.5;
    UIView * lineView =[[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lineView.backgroundColor =[UIColor groupTableViewBackgroundColor];
    [self.contentView addSubview:lineView];

    w= 30;
    h = 30;
    x = Main_Screen_Width - 20-w;
    y  = 8;
    img = [[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    
    img.image = [UIImage imageNamed:@"btn_tel"];
    
    [self.contentView addSubview:img];

    x = Main_Screen_Width - 69.5;
    y  = 60 - 20;
    w= 69.5;
    h = 20;
    lbl  =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.text= @"拨打电话";
    lbl.font = [UIFont systemFontOfSize:12];
    lbl.textAlignment = NSTextAlignmentCenter;
    lbl.textColor = [UIColor orangeColor];
    [self.contentView addSubview:lbl];
    
    _phoneBtn = [[UIButton alloc]initWithFrame:CGRectMake(Main_Screen_Width - 70, 0, 70, 60)];
    [self.contentView addSubview:_phoneBtn];

    
    
    
    
    
}
-(void)prepareUI2{
    
    for (UIView * view in self.contentView.subviews) {
        [view removeFromSuperview];
        
    }
    CGFloat x = 10;
    CGFloat y= 12.5;
    CGFloat w = 20;
    CGFloat h = 20;
    UIImageView * img = [[UIImageView alloc]initWithFrame:CGRectMake(x, y, w-5, h-5)];
    img.image =[UIImage imageNamed:@"icon_introduce"];
    [self.contentView addSubview:img];
    
    x +=w + 10;
    y = 0;
    w = Main_Screen_Width - x;
    h = 40;
   UILabel* lbl  =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.text= @"机构介绍";
    lbl.font = [UIFont systemFontOfSize:15];
    lbl.textColor = [UIColor grayColor];
    [self.contentView addSubview:lbl];

    x = 10;
    y+=h;
    w = Main_Screen_Width - 20;
    h = MCAdaptiveH(750, 320, Main_Screen_Width);
    
    UIImageView * imgView = [[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    imgView.image =[UIImage imageNamed:@"bg_def_390"];
    [self.contentView addSubview:imgView];

    y+=h + 10;
    h = 40;
    lbl  =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.text= @"机构介绍机构介绍机构介绍机构介绍机构介绍机构介绍机构介绍机构介绍机构介绍机构介";
    lbl.font = [UIFont systemFontOfSize:14];
    lbl.numberOfLines = 0;
    lbl.textColor = [UIColor darkTextColor];
    [self.contentView addSubview:lbl];
    

    
    
    
    
}
-(void)prepareUI3{
    
    for (UIView * view in self.contentView.subviews) {
        [view removeFromSuperview];
    }
    
    CGFloat x = 5;
    CGFloat selfViewh = MCAdaptiveH(750, 283, Main_Screen_Width);
    CGFloat y = 10;
    CGFloat h = selfViewh - 20;
    CGFloat imgw = MCAdaptiveW(300, 240, h);
    UIImageView  * imgView = [[UIImageView alloc]initWithFrame:CGRectMake(x, y, imgw, h)];
    imgView.image = [UIImage imageNamed:@"def_organ-class"];
    [self.contentView addSubview:imgView];
    CGFloat lw = [MCIucencyView heightforString:@"一对一" andHeight:20 fontSize:14];
    UIImageView * bgImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 10, lw + 10, 20)];
    bgImg.image = [UIImage imageNamed:@"pic_class-bg"];
    [imgView addSubview:bgImg];
    UILabel * lbl = [[UILabel alloc]initWithFrame:CGRectMake(5, 0, lw, 20)];
    lbl.textColor = [UIColor darkTextColor];
    lbl.font = [UIFont systemFontOfSize:14];
    lbl.text = @"一对一";
    [bgImg addSubview:lbl];
    x =  imgView.mj_x + imgView.mj_w + 5;
    CGFloat  w = Main_Screen_Width - x - 5;
    
    h = 40;
    y += 3;
    
    UILabel * titleLbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    titleLbl.text = @"艺术培训机构艺术培训机构艺术培训机构艺术培训机构艺术培训机构";
    titleLbl.textColor = [UIColor darkTextColor];
    titleLbl.font = [UIFont systemFontOfSize:15];
    titleLbl.numberOfLines = 0;
    [self.contentView addSubview:titleLbl];
    y+=h + 3;
    h = 20;
    w = w/2;
    HCSStarRatingView* starRatingView  = [[HCSStarRatingView alloc] initWithFrame:CGRectMake(x, y, w, h)];
    starRatingView.maximumValue = 5;
    starRatingView.minimumValue = 0;
    starRatingView.value = 4.5f;
    starRatingView.tintColor = [UIColor redColor];
    starRatingView.enabled = NO;
    [self.contentView addSubview:starRatingView];

    x +=w + 10;
    w = Main_Screen_Width - x - 10;
    UILabel * countLbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    countLbl.textColor = [UIColor lightGrayColor];
    countLbl.font =[UIFont systemFontOfSize:13];
    countLbl.text =@"66条评论";
    [self.contentView addSubview:countLbl];

    x = titleLbl.mj_x;
    y += h;
    w= Main_Screen_Width - 10 - x;
    UILabel * namelbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    namelbl.text = @"michan";
    namelbl.textColor = [UIColor grayColor];
    namelbl.font =[UIFont systemFontOfSize:14];
    [self.contentView addSubview:namelbl];

    y = imgView.mj_y + imgView.mj_h - 20;
    UILabel * Pricelbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    Pricelbl.text = @"￥233.00";
    Pricelbl.textColor = [UIColor redColor];
    Pricelbl.font =[UIFont systemFontOfSize:16];
    [self.contentView addSubview:Pricelbl];
    
    
}
-(void)prepareUI4{
    
    for (UIView * view in self.contentView.subviews) {
        [view removeFromSuperview];
    }
    
    CGFloat x = 5;
    CGFloat selfViewh = MCAdaptiveH(750, 283, Main_Screen_Width);
    CGFloat y = 10;
    CGFloat h = selfViewh - 20;
    CGFloat imgw = MCAdaptiveW(300, 240, h);
    UIImageView  * imgView = [[UIImageView alloc]initWithFrame:CGRectMake(x, y, imgw, h)];
    imgView.image = [UIImage imageNamed:@"def_organ-class"];
    [self.contentView addSubview:imgView];
    CGFloat lw = [MCIucencyView heightforString:@"一对一" andHeight:20 fontSize:14];
    UIImageView * bgImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 10, lw + 10, 20)];
    bgImg.image = [UIImage imageNamed:@"pic_class-bg"];
    [imgView addSubview:bgImg];
    UILabel * lbl = [[UILabel alloc]initWithFrame:CGRectMake(5, 0, lw, 20)];
    lbl.textColor = [UIColor darkTextColor];
    lbl.font = [UIFont systemFontOfSize:14];
    lbl.text = @"一对一";
    [bgImg addSubview:lbl];
    x =  imgView.mj_x + imgView.mj_w + 5;
    CGFloat  w = Main_Screen_Width - x - 5;
    
    h = 40;
    y += 3;
    
    UILabel * titleLbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    titleLbl.text = @"艺术培训机构艺术培训机构艺术培训机构艺术培训机构艺术培训机构";
    titleLbl.textColor = [UIColor darkTextColor];
    titleLbl.font = [UIFont systemFontOfSize:15];
    titleLbl.numberOfLines = 0;
    [self.contentView addSubview:titleLbl];
    y+=h + 3;
    h = 20;
UILabel * orLbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    orLbl.textColor = [UIColor lightGrayColor];
orLbl.text = @"不知名机构";
    orLbl.font =[UIFont systemFontOfSize:14];
    [self.contentView addSubview:orLbl];

    
    
    x = titleLbl.mj_x;
    y += h;
    w= Main_Screen_Width - 10 - x;
    UILabel * namelbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    namelbl.text = @"michan";
    namelbl.textColor = [UIColor grayColor];
    namelbl.font =[UIFont systemFontOfSize:14];
    [self.contentView addSubview:namelbl];
    
    
    
    y = imgView.mj_y + imgView.mj_h - 20;
    w= titleLbl.mj_w;
    UILabel * Pricelbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    Pricelbl.text = @"剩余课时:17";
    Pricelbl.textAlignment = NSTextAlignmentRight;
    Pricelbl.textColor = [UIColor redColor];
    Pricelbl.font =[UIFont systemFontOfSize:16];
    [self.contentView addSubview:Pricelbl];
    
    
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
