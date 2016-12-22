//
//  LeaveJLTableViewCell.m
//  ZYStudent
//
//  Created by MC on 2016/12/22.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "LeaveJLTableViewCell.h"

@implementation LeaveJLTableViewCell


-(void)prepareUI{
    
    
    for (UIView *view in self.contentView.subviews) {
        [view removeFromSuperview];
    }
    
    UIView * bgview =[[UIView alloc]initWithFrame:CGRectMake(10, 0, Main_Screen_Width - 20, 44*2)];
    ViewBorderRadius(bgview, 3, 0.5, [UIColor groupTableViewBackgroundColor]);
    [self.contentView addSubview:bgview];
    bgview.backgroundColor =[UIColor whiteColor];
    self.contentView.backgroundColor = AppBgCOLOR
    ;
    
    CGFloat x = 10;
    CGFloat y = 7;
    CGFloat w = 30;
    CGFloat h = w;
    
    UIImageView * headImg = [[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    headImg.image =[UIImage imageNamed:@"def_head48"];
    ViewRadius(headImg, w/2);
    [bgview addSubview:headImg];
    
    
    x+=w + 10;
    y = 0;
    w = bgview.mj_w - x - 10;
    h = 44;
    UILabel * nameLbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    nameLbl.text = @"michan";
    nameLbl.font =[UIFont systemFontOfSize:15];
    [bgview addSubview:nameLbl];
    
    w = 70;
    x = bgview.mj_w - 10 -w;
    h = 44;
    y = 0;
    UILabel * sateLbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    sateLbl.text = @"待确认";
    sateLbl.font =[UIFont systemFontOfSize:14];
    sateLbl.textAlignment = NSTextAlignmentRight;
    [bgview addSubview:sateLbl];

    x = 10;
    w= bgview.mj_w -20;
    h = 44;
    y = 44;
    UILabel * timeLbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    timeLbl.textColor = [UIColor grayColor];
    timeLbl.font =[UIFont systemFontOfSize:14];
    timeLbl.text = @"请假时间:2016-02-02";
    [bgview addSubview:timeLbl];

    

    x = 10;
    w= bgview.mj_w -20;
    h = 0.5;
    y = 44;
    UIView * lineview =[[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lineview.backgroundColor =[UIColor groupTableViewBackgroundColor];
    
    [bgview addSubview:lineview];

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
