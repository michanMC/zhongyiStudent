//
//  CourseDetailsTableViewCell.m
//  MCZhongYi
//
//  Created by MC on 2016/12/8.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "CourseDetailsTableViewCell.h"

@implementation CourseDetailsTableViewCell
-(void)prepareUI6{
    for (UIView * view in self.contentView.subviews) {
        [view removeFromSuperview];
    }
    self.contentView.backgroundColor = RGBCOLOR(250, 247, 247);
    UIView * bgView = [[UIView alloc]initWithFrame:CGRectMake(10, 0, Main_Screen_Width - 20, 100)];
    bgView.backgroundColor = [UIColor whiteColor];
    
    [self.contentView addSubview:bgView];
    
    CGFloat x = 0 ;
    CGFloat y = 10;
    CGFloat h = 20;
    CGFloat w = bgView.mj_w;
    
    
    UILabel * titleLbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    titleLbl.textColor = [UIColor darkTextColor];
    titleLbl.font =[UIFont systemFontOfSize:16];
    titleLbl.textAlignment = NSTextAlignmentCenter;
    titleLbl.text = @"主讲老师";
    
    [bgView addSubview:titleLbl];

    y+=h + 30;
    w = 112/2;
    h = w;
    x = (bgView.mj_w - w)/2;
    _headerBtn = [[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
    ViewRadius(_headerBtn, h/2);
    [_headerBtn setImage:[UIImage imageNamed:@"def_head112"] forState:0];
    [bgView addSubview:_headerBtn];

    
    y +=h +5;
    x = 0;
    w = bgView.mj_w;
    h = 20;
    UILabel * namelbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    namelbl.text = @"michan";
    namelbl.textAlignment = NSTextAlignmentCenter;
    namelbl.font =[UIFont systemFontOfSize:16];
    [bgView addSubview:namelbl];

    y += h + 10;
    w = 80;
    h = 20;
    x = bgView.mj_w / 2 - w  - 3;
    UILabel * lbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.text = @"好老师";
    lbl.textColor = AppMCNATitleCOLOR;
    UIColor * cc =AppMCNATitleCOLOR;
    ViewBorderRadius(lbl, h/2, 1, cc);
    lbl.textAlignment = NSTextAlignmentCenter;
    lbl.font =[UIFont systemFontOfSize:14];
    [bgView addSubview:lbl];
    x = bgView.mj_w / 2   + 3;
    lbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.text = @"6年教龄";
    lbl.textColor = AppMCNATitleCOLOR;
    ViewBorderRadius(lbl, h/2, 1, cc);
    lbl.textAlignment = NSTextAlignmentCenter;
    lbl.font =[UIFont systemFontOfSize:14];
    [bgView addSubview:lbl];
    

    y+=h + 15;
    
    x= 0;
    w= bgView.mj_w;
    h = 20;
     titleLbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    titleLbl.text = @"不知名机构";
    titleLbl.textColor = [UIColor lightGrayColor];
    titleLbl.textAlignment = NSTextAlignmentCenter;
    titleLbl.font =[UIFont systemFontOfSize:13];
    [bgView addSubview:titleLbl];
    
    h = 10+20+30+112/2+5+20+10+20+15+20+20;
    
    bgView.frame = CGRectMake(10, 0, Main_Screen_Width - 20, h);
    
    
    
}

-(void)prepareUI{
    
    for (UIView * view in self.contentView.subviews) {
        [view removeFromSuperview];
    }
    self.contentView.backgroundColor = RGBCOLOR(250, 247, 247);

    CGFloat imgh = MCAdaptiveH(650, 290, Main_Screen_Width - 40);
    NSString * str = @"课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程";
    CGFloat lh = [MCToolsManage heightforString:str andWidth:Main_Screen_Width - 40 fontSize:14];
CGFloat viewh =  10 + 15 + 2 + 20 + lh + 10 + imgh + 10;
    UIView * bgView = [[UIView alloc]initWithFrame:CGRectMake(10, 0, Main_Screen_Width - 20, viewh)];
    bgView.backgroundColor = [UIColor whiteColor];
    
    [self.contentView addSubview:bgView];
    

    
    CGFloat w= [MCToolsManage heightforString:@"课程介绍" andHeight:15 fontSize:15];
    CGFloat y = 10;
    CGFloat x = (bgView.mj_w - w )/2;
    CGFloat h = 15;
    UILabel * lbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.text = @"课程介绍";
    lbl.font = [UIFont systemFontOfSize:15];
    lbl.textColor = [UIColor darkTextColor];
    [bgView addSubview:lbl];
    y+=h+1;
    x += 3;
    w -= 6;
    h = 1;
    
    UIView * lineView = [[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lineView.backgroundColor = AppMCNACOLOR;
    [bgView addSubview:lineView];

    y +=h + 20;
    
    x = 10;
    w = bgView.mj_w - 20;
    lbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, lh)];
    lbl.text = str;
    lbl.font = [UIFont systemFontOfSize:14];
    lbl.textColor = [UIColor grayColor];
    lbl.numberOfLines = 0;
    [bgView addSubview:lbl];
    
    y += lh+10;
    UIImageView * imgview = [[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, imgh)];
    imgview.image = [UIImage imageNamed:@"bg_def_240"];
    [bgView addSubview:imgview];
    
    
}
-(void)prepareUI2{
    
    for (UIView * view in self.contentView.subviews) {
        [view removeFromSuperview];
    }
    self.contentView.backgroundColor = RGBCOLOR(250, 247, 247);
    
  CGFloat viewh=  10 + 15 +2 + 10 + 40 + 20 + 30 + 10 + 30 + 10 +30 + 10 + 25 + 10;
    UIView * bgView = [[UIView alloc]initWithFrame:CGRectMake(10, 0, Main_Screen_Width - 20, viewh)];
    bgView.backgroundColor = [UIColor whiteColor];
    
    [self.contentView addSubview:bgView];
    CGFloat w= [MCToolsManage heightforString:@"课时安排" andHeight:15 fontSize:15];
    CGFloat y = 10;
    CGFloat x = (bgView.mj_w - w )/2;
    CGFloat h = 15;
    UILabel * lbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.text = @"课时安排";
    lbl.font = [UIFont systemFontOfSize:15];
    lbl.textColor = [UIColor darkTextColor];
    [bgView addSubview:lbl];
    y+=h+1;
    x += 3;
    w -= 6;
    h = 1;
    
    UIView * lineView = [[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lineView.backgroundColor = AppMCNACOLOR;
    [bgView addSubview:lineView];

    y +=h + 10;
    x = 10;
    h = 40;
    w = bgView.mj_w - 20;
    lbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.text = @"3月17日12:00开课，12月31日13：00结课，上共289节。每天上课时间12：00-13：00";
    
    lbl.font = [UIFont systemFontOfSize:14];
    lbl.textColor = [UIColor grayColor];
    lbl.numberOfLines = 0;
    [bgView addSubview:lbl];

    
    
    y +=h + 20;
    x = 30;
    w = 30;
    h =30;
    UILabel * numlbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    numlbl.text = @"1";
    numlbl.backgroundColor  = AppMCNACOLOR;
    numlbl.textColor = AppMCNATitleCOLOR;
    numlbl.textAlignment = NSTextAlignmentCenter;
    numlbl.font = [UIFont systemFontOfSize:15];
    ViewRadius(numlbl, w/2);
    [bgView addSubview:numlbl];

    x += w + 10;
    w = bgView.mj_w - x - 10;
    UILabel * timeLbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    timeLbl.textColor = [UIColor grayColor];
    timeLbl.font = [UIFont systemFontOfSize:14];
    timeLbl.text = @"9月7日 12:00-13:00";
    [bgView addSubview:timeLbl];
    
    
    y +=h + 10;
    x = 30;
    w = 30;
    h =30;
    numlbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    numlbl.text = @"2";
    numlbl.textAlignment = NSTextAlignmentCenter;

    numlbl.backgroundColor  = AppMCNACOLOR;
    numlbl.textColor = AppMCNATitleCOLOR;
    numlbl.font = [UIFont systemFontOfSize:15];
    ViewRadius(numlbl, w/2);
    [bgView addSubview:numlbl];
    x += w + 10;
    w = bgView.mj_w - x - 10;
    timeLbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    timeLbl.textColor = [UIColor grayColor];
    timeLbl.font = [UIFont systemFontOfSize:14];
    timeLbl.text = @"9月7日 12:00-13:00";
    [bgView addSubview:timeLbl];
    

    y +=h + 10;
    x = 30;
    w = 30;
    h =30;
    numlbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    numlbl.text = @"3";
    numlbl.textAlignment = NSTextAlignmentCenter;

    numlbl.backgroundColor  = AppMCNACOLOR;
    numlbl.textColor = AppMCNATitleCOLOR;
    numlbl.font = [UIFont systemFontOfSize:16];
    
    ViewRadius(numlbl, w/2);
    [bgView addSubview:numlbl];
    x += w + 10;
    w = bgView.mj_w - x - 10;
    timeLbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    timeLbl.textColor = [UIColor grayColor];
    timeLbl.font = [UIFont systemFontOfSize:14];
    timeLbl.text = @"9月7日 12:00-13:00";
    [bgView addSubview:timeLbl];

    y += h + 10;
    h = 25;
    w= [MCToolsManage heightforString:@"查看全部课时" andHeight:25 fontSize:14]+ 15;
    x = (Main_Screen_Width - w)/2;

    _moreBtn = [[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
    [_moreBtn setTitle:@"查看全部课时" forState:0];
    [_moreBtn setTitleColor:[UIColor lightGrayColor] forState:0];
    _moreBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [bgView addSubview:_moreBtn];

    ViewBorderRadius(_moreBtn, 3, 1, [UIColor lightGrayColor]);
    
    
    
    
    
}
-(void)prepareUI4{
    for (UIView * view in self.contentView.subviews) {
        [view removeFromSuperview];
    }
    self.contentView.backgroundColor = RGBCOLOR(250, 247, 247);
    CGFloat viewh = 10+15+2;
    UIView * bgView = [[UIView alloc]initWithFrame:CGRectMake(10, 0, Main_Screen_Width - 20, viewh)];
    bgView.backgroundColor = [UIColor whiteColor];
    
    [self.contentView addSubview:bgView];
    
    
    CGFloat w= [MCToolsManage heightforString:@"用户评价" andHeight:15 fontSize:16];
    CGFloat y = 10;
    CGFloat x = (bgView.mj_w - w )/2;
    CGFloat h = 15;
    UILabel * lbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.text = @"用户评价";
    lbl.font = [UIFont systemFontOfSize:16];
    lbl.textColor = [UIColor darkTextColor];
    [bgView addSubview:lbl];
    y+=h+1;
    x += 3;
    w -= 6;
    h = 1;
    
    UIView * lineView = [[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lineView.backgroundColor = AppMCNACOLOR;
    [bgView addSubview:lineView];

    
}
-(void)prepareUI3{
    
    for (UIView * view in self.contentView.subviews) {
        [view removeFromSuperview];
    }
    self.contentView.backgroundColor = RGBCOLOR(250, 247, 247);
    
    
    NSString * str = @"课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程课程";
    CGFloat lh = [MCToolsManage heightforString:str andWidth:Main_Screen_Width - 40 fontSize:14];
    CGFloat viewh =  10+30+10 + lh + 10+20 + 5;
   
    UIView * bgView = [[UIView alloc]initWithFrame:CGRectMake(10, 0, Main_Screen_Width - 20, viewh)];
    bgView.backgroundColor = [UIColor whiteColor];
    
    [self.contentView addSubview:bgView];

    CGFloat y = 10;
    CGFloat x = 10;
    CGFloat w = 30;
    CGFloat h = w;
    UIButton * _headerBtn = [[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
    [_headerBtn setImage:[UIImage imageNamed:@"def_head-48"] forState:0];
    ViewRadius(_headerBtn, w/2);
    [bgView addSubview:_headerBtn];
    x +=w + 5;
    w = Main_Screen_Width/2 - x;
    UILabel * nameLbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    nameLbl.text = @"michan";
    nameLbl.textColor = [UIColor grayColor];
    nameLbl.font = [UIFont systemFontOfSize:15];
    [bgView addSubview:nameLbl];
    
    x = bgView.mj_w -bgView.mj_w / 3;
    y += 7.5;
    h = 15;
    w =bgView.mj_w / 3;
    HCSStarRatingView*_starRatingView  = [[HCSStarRatingView alloc] initWithFrame:CGRectMake(x, y, w, h)];
    _starRatingView.maximumValue = 5;
    _starRatingView.minimumValue = 0;
    _starRatingView.value = 3;
    _starRatingView.tintColor = [UIColor redColor];
    _starRatingView.enabled = NO;
    [self.contentView addSubview:_starRatingView];
    
    
    
    
    
    
    y += h + 10;
    w = bgView.mj_w - 20;
    x = 10;
    h = lh;
    UILabel * strlbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    strlbl.textColor = [UIColor grayColor];
    strlbl.font = [UIFont systemFontOfSize:14];
    strlbl.numberOfLines = 0;
    strlbl.text =str;
    [bgView addSubview:strlbl];

    y += h + 10;
    
    x = bgView.mj_w/2;
    h = 20;
    w = bgView.mj_w/2 - 10;
    UILabel * timeLbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    timeLbl.text = @"2016-09-01 16:00";
    timeLbl.textColor = [UIColor lightGrayColor];
    timeLbl.font = [UIFont systemFontOfSize:13];
    timeLbl.textAlignment = NSTextAlignmentRight;
    [bgView addSubview:timeLbl];
    y += h + 4.5 + 5;
    x = 10;
    w = bgView.mj_w - 20;
    h = 0.5;
    UIView * lineView = [[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lineView.backgroundColor =[UIColor groupTableViewBackgroundColor];
    [bgView addSubview:lineView];
    
    
}
-(void)prepareUI5{
    
    for (UIView * view in self.contentView.subviews) {
        [view removeFromSuperview];
    }
    self.contentView.backgroundColor = RGBCOLOR(250, 247, 247);
    
    
    CGFloat viewh = 50;
    
    UIView * bgView = [[UIView alloc]initWithFrame:CGRectMake(10, 0, Main_Screen_Width - 20, viewh)];
    bgView.backgroundColor = [UIColor whiteColor];
    
    [self.contentView addSubview:bgView];
    
  CGFloat  y =  10;
   CGFloat h = 25;
  CGFloat  w= [MCToolsManage heightforString:@"更多评论" andHeight:25 fontSize:14]+ 15;
   CGFloat x = (Main_Screen_Width - w)/2;
    
    _more2Btn = [[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
    [_more2Btn setTitle:@"更多评论" forState:0];
    [_more2Btn setTitleColor:[UIColor lightGrayColor] forState:0];
    _more2Btn.titleLabel.font = [UIFont systemFontOfSize:14];
    [bgView addSubview:_more2Btn];
    
    ViewBorderRadius(_more2Btn, 3, 1, [UIColor lightGrayColor]);

    
    

    
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
