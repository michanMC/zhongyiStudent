//
//  OrganTableViewCell.m
//  ZYStudent
//
//  Created by MC on 2016/12/14.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "OrganTableViewCell.h"

@implementation OrganTableViewCell


-(void)prepareUI1{
    
    for (UIView * view in self.contentView.subviews) {
        [view removeFromSuperview];
    }
    
    CGFloat h = 10 +95 + 40;
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = Main_Screen_Width;
    UIView * bgview = [[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    bgview.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:bgview];
    
    x = 15;
    w = 25;
    h = w;
    y = 20;
    UIImageView * imgview= [[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    imgview.image = [UIImage imageNamed:@"icon_notice2"];
    [bgview addSubview:imgview];
   

    y = 20 + w;
    CGFloat h2 =bgview.mj_h - y;
    y = y +h2/2;
    x  = (15 + 25/2)-y/2;
    h = 1;
    w =h2;

    UIView * lineView = [[UIView alloc]initWithFrame:CGRectMake(x, y,w, h)];
    lineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.contentView addSubview:lineView];
    [MCToolsManage drawDashLine:lineView lineLength:1.5 lineSpacing:5 lineColor:[UIColor whiteColor]];
    CGAffineTransform  trans = CGAffineTransformMakeTranslation(0, 0);
    trans = CGAffineTransformRotate(trans,M_PI/2);
    //    trans = CGAffineTransformTranslate(trans,-x, -y);
    lineView.transform = trans;
    
    
    
    x = 15 + 25 + 10;
    w = bgview.mj_w - x - 10;
    h =95;
    y = 10;
    UIView * lblView = [[UIView alloc]initWithFrame:CGRectMake(x, y,w, h)];
    ViewBorderRadius(lblView, 3, 1, [UIColor groupTableViewBackgroundColor]);
    [bgview addSubview:lblView];
    
    lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 40,lblView.mj_w, 0.5)];
    lineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [lblView addSubview:lineView];
    
    UILabel * lbl =[[ UILabel alloc]initWithFrame:CGRectMake(10, 0, lblView.mj_w - 20, 40)];
    lbl.textColor = [UIColor darkTextColor];
    lbl.font = [UIFont systemFontOfSize:16];
    lbl.numberOfLines = 0;
    lbl.text = @"还有两个小时就要上课了哦！";
    [lblView addSubview:lbl];

    y = 40.5 + 5;
    lbl =[[ UILabel alloc]initWithFrame:CGRectMake(10, y, lblView.mj_w - 20, 20)];
    lbl.textColor = [UIColor grayColor];
    lbl.font = [UIFont systemFontOfSize:15];
    lbl.text = @"课程名称:吉他入门课";
    [lblView addSubview:lbl];

    y+=20+5;
    
    lbl =[[ UILabel alloc]initWithFrame:CGRectMake(10, y, lblView.mj_w - 20, 20)];
    lbl.textColor = [UIColor grayColor];
    lbl.font = [UIFont systemFontOfSize:15];
    lbl.text = @"上课时间:12:00-13:00";
    [lblView addSubview:lbl];

    
    
}
-(void)prepareUI2{
    for (UIView * view in self.contentView.subviews) {
        [view removeFromSuperview];
    }

    UIView * bgview =[[UIView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, 100)];
    bgview.backgroundColor =[UIColor whiteColor];
    [self.contentView addSubview:bgview];
    
    
    CGFloat x = 15 + 25 +10;
    CGFloat y = 0;
    CGFloat w= Main_Screen_Width - x - 25 - 44 - 10;
    CGFloat h = 25;
    UILabel * timeLbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    timeLbl.text =@"今天 19:00";
    timeLbl.textColor = [UIColor grayColor];
    timeLbl.font = [UIFont systemFontOfSize:15];
    [bgview addSubview:timeLbl];
    
    y+=h;
    UILabel *nameLbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    nameLbl.text =@"michan老师 吉他入门课";
    nameLbl.textColor = [UIColor lightGrayColor];
    nameLbl.font = [UIFont systemFontOfSize:14];
    [bgview addSubview:nameLbl];
    x = Main_Screen_Width - 25 - 44;
    y = 3;
    w = 44;
    h = 44;
    _headerBtn = [[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
    [_headerBtn setImage:[UIImage imageNamed:@"def_head112"] forState:0];
    ViewRadius(_headerBtn, h/2);
    [bgview addSubview:_headerBtn];

    
    y =nameLbl.mj_y + 20 + 10;
    x = nameLbl.mj_x;
    
    w = Main_Screen_Width - x - 25;
    
    NSString * str = @"今天今天今天今天今天今天今天今天今天今天今天今天今天今天今天今天今天今天今天";
    h = [MCToolsManage heightforString:str andWidth:w fontSize:14];
    
    UILabel * titleLbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    titleLbl.textColor =[UIColor grayColor];
    titleLbl.font = [UIFont systemFontOfSize:14];
    titleLbl.numberOfLines = 0;
    titleLbl.text = str;
    [bgview addSubview:titleLbl];

    
    y +=h + 14;
    w = (titleLbl.mj_w - 10)/3;
    h = w;
    
    x = titleLbl.mj_x;
    CGFloat offx = 5;
    NSInteger count = 9;
    for (NSInteger i = 0; i <count; i++) {
//        UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
//        [btn setImage:[UIImage imageNamed:@"def_organ-class"] forState:0];
//        [bgview addSubview:btn];
        UIImageView * btnimg = [[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
        btnimg.image =[UIImage imageNamed:@"def_organ-class"];
        [bgview addSubview:btnimg];

        
        
        
        
        if ((i == 2||i == 5)&&count != 2 &&count !=5) {
            y +=w +offx;
            x = titleLbl.mj_x;
        }
        else
        {
            x +=w+offx;
        }

    }
    y+=w + 25;
    h = y;
    bgview.frame = CGRectMake(0, 0, Main_Screen_Width, h);
   
    x = 15;
    w = 25;
    h = w;
    y = 0;
    UIImageView * imgview= [[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    imgview.image = [UIImage imageNamed:@"icon_date"];
    [bgview addSubview:imgview];
    
    
    y =  w;
    CGFloat h2 =bgview.mj_h - y;
    y = y +h2/2;
    x  = (15 + 25/2)-h2/2;
    h = 1;
    w =h2;
    
    UIView * lineView = [[UIView alloc]initWithFrame:CGRectMake(x, y,w, h)];
    lineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.contentView addSubview:lineView];
    [MCToolsManage drawDashLine:lineView lineLength:1.5 lineSpacing:5 lineColor:[UIColor whiteColor]];
    CGAffineTransform  trans = CGAffineTransformMakeTranslation(0, 0);
    trans = CGAffineTransformRotate(trans,M_PI/2);
    //    trans = CGAffineTransformTranslate(trans,-x, -y);
    lineView.transform = trans;
    
    
    
}

-(void)prepareUI3{
    for (UIView * view in self.contentView.subviews) {
        [view removeFromSuperview];
    }

    CGFloat h = 25 + 5 +95 + 30;
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = Main_Screen_Width;
    UIView * bgview = [[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    bgview.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:bgview];
    
    x = 15;
    w = 25;
    h = w;
    y = 0;
    UIImageView * imgview= [[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    imgview.image = [UIImage imageNamed:@"icon_date"];
    [bgview addSubview:imgview];
    
    
    y =   w;
    CGFloat h2 =bgview.mj_h - y;
    y = y +h2/2;
    x  = (15 + 25/2)-h2/2;
    h = 1;
    w =h2;
    
    UIView * lineView = [[UIView alloc]initWithFrame:CGRectMake(x, y,w, h)];
    lineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [bgview addSubview:lineView];
    [MCToolsManage drawDashLine:lineView lineLength:1.5 lineSpacing:5 lineColor:[UIColor whiteColor]];
    CGAffineTransform  trans = CGAffineTransformMakeTranslation(0, 0);
    trans = CGAffineTransformRotate(trans,M_PI/2);
    //    trans = CGAffineTransformTranslate(trans,-x, -y);
    lineView.transform = trans;
    

    x = 15+25+10;
    y = 0;
    w = Main_Screen_Width - x - 25;
    h = 25;
    UILabel * timeLbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    timeLbl.text =@"2016-09-09 19:00";
    timeLbl.textColor = [UIColor grayColor];
    timeLbl.font = [UIFont systemFontOfSize:15];
    [bgview addSubview:timeLbl];
    
    y =25+5;
    h = 95;
    
    UIView * lblView = [[UIView alloc]initWithFrame:CGRectMake(x, y,w, h)];
    ViewBorderRadius(lblView, 3, 1, [UIColor groupTableViewBackgroundColor]);
    [bgview addSubview:lblView];
    
    lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 40,lblView.mj_w, 0.5)];
    lineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [lblView addSubview:lineView];
    
    UILabel * lbl =[[ UILabel alloc]initWithFrame:CGRectMake(10, 0, lblView.mj_w - 20, 40)];
    lbl.textColor = [UIColor darkTextColor];
    lbl.font = [UIFont systemFontOfSize:16];
    lbl.numberOfLines = 0;
    lbl.text = @"点名提示-吉他弹唱零基础速成班";
    [lblView addSubview:lbl];

    x = 10;
    y = 40.5 + 25/2 + 5;
    w = 30;
    h = 30;
    _headerBtn = [[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
    [_headerBtn setImage:[UIImage imageNamed:@"def_head112"] forState:0];
    [lblView addSubview:_headerBtn];

    x+=w + 6;
    w = lblView.mj_w - x - 10 - 100;
    UILabel * nameLbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    nameLbl.text  = @"michan老师";
    nameLbl.textColor = [UIColor darkTextColor];
    nameLbl.font = [UIFont systemFontOfSize:15];
    [lblView addSubview:nameLbl];
    
    w = 70;
    h  = 30;
    x = lblView.mj_w - 10 - w ;
    _OKBtn = [[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
    [_OKBtn setTitle:@"确定" forState:0];
    _OKBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    UIColor * cc = AppMCNATitleCOLOR;
    [_OKBtn setTitleColor:cc forState:0];
    ViewRadius(_OKBtn, 3);
    [lblView addSubview:_OKBtn];
    _OKBtn.backgroundColor = AppMCNACOLOR;
    x -= (5+w);
    
    _cancelBtn = [[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
    [_cancelBtn setTitle:@"待确定" forState:0];
    _cancelBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [_cancelBtn setTitleColor:[UIColor lightGrayColor] forState:0];
    [lblView addSubview:_cancelBtn];
    _cancelBtn.backgroundColor = [UIColor whiteColor];
    
}
-(void)prepareUI4{
    for (UIView * view in self.contentView.subviews) {
        [view removeFromSuperview];
    }

    CGFloat x = 15 + 25 +10;
    CGFloat y = 0;
    CGFloat w= Main_Screen_Width - x - 25 - 44 - 10;
    CGFloat h = 25;
    UILabel * timeLbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    timeLbl.text =@"今天 19:00";
    timeLbl.textColor = [UIColor grayColor];
    timeLbl.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:timeLbl];
    
    y+=h;
    UILabel *nameLbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    nameLbl.text =@"michan老师 吉他入门课";
    nameLbl.textColor = [UIColor lightGrayColor];
    nameLbl.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:nameLbl];
    x = Main_Screen_Width - 25 - 44;
    y = 3;
    w = 44;
    h = 44;
    _headerBtn = [[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
    [_headerBtn setImage:[UIImage imageNamed:@"def_head112"] forState:0];
    ViewRadius(_headerBtn, h/2);
    [self.contentView addSubview:_headerBtn];
    
    y =nameLbl.mj_y+nameLbl.mj_h + 10;
    x = nameLbl.mj_x;
    w = Main_Screen_Width -x - 25-10;
    NSString * str = @"今天今天今天今天今天今天今天今天今天今天今天今天今天今天今天今天今天今天今天";
   CGFloat lh = [MCToolsManage heightforString:str andWidth:w fontSize:14];

    h = 8 + 20+8+lh + 8;
    
    UIView * bgview =[[ UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    bgview.backgroundColor = [UIColor whiteColor];
    ViewBorderRadius(bgview, 3, 1, [UIColor groupTableViewBackgroundColor]);
    [self.contentView addSubview:bgview];
    
    x = 5;
    y = 8;
    h = 20;
    w = 100;
   HCSStarRatingView* _starRatingView  = [[HCSStarRatingView alloc] initWithFrame:CGRectMake(x, y, w, h)];
    _starRatingView.maximumValue = 5;
    _starRatingView.minimumValue = 0;
    _starRatingView.value = 3;
    _starRatingView.tintColor = [UIColor redColor];
    _starRatingView.enabled = NO;
    [bgview addSubview:_starRatingView];
    
    w = [MCToolsManage heightforString:@"表现好" andHeight:20 fontSize:14] + 16;
    x = bgview.mj_w - w - 5;
    h = 20;
    
    UILabel * tepLbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    tepLbl.text =@"表现好";
    tepLbl.textAlignment = NSTextAlignmentCenter;
    tepLbl.textColor = [UIColor orangeColor];
    ViewBorderRadius(tepLbl, h/2, 1, [UIColor orangeColor]);
    tepLbl.font = [UIFont systemFontOfSize:14];

    [bgview addSubview:tepLbl];

    y += h + 8;
    w = bgview.mj_w -10;
    x = 5;
    h = lh;
    UILabel * titleLbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    titleLbl.text =str;
    titleLbl.textColor = [UIColor grayColor];
    titleLbl.numberOfLines= 0;
    
    titleLbl.font = [UIFont systemFontOfSize:14];
    timeLbl.numberOfLines = 0;
    
    [bgview addSubview:titleLbl];
    

    
    
    
    x = 15;
    w = 25;
    h = w;
    y = 0;
    UIImageView * imgview= [[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    imgview.image = [UIImage imageNamed:@"icon_date"];
    [self.contentView addSubview:imgview];
    
    h = 25 + 20 + 10 + 8 + 20 + 8 + lh + 8 + 30;

    y =  w;
    CGFloat h2 =h - y;
    y = y +h2/2;
    x  = (15 + 25/2)-h2/2;
    h = 1;
    w =h2;
    
    UIView * lineView = [[UIView alloc]initWithFrame:CGRectMake(x, y,w, h)];
    lineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.contentView addSubview:lineView];
    [MCToolsManage drawDashLine:lineView lineLength:1.5 lineSpacing:5 lineColor:[UIColor whiteColor]];
    CGAffineTransform  trans = CGAffineTransformMakeTranslation(0, 0);
    trans = CGAffineTransformRotate(trans,M_PI/2);
    //    trans = CGAffineTransformTranslate(trans,-x, -y);
    lineView.transform = trans;

    
    
    
    

    
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
