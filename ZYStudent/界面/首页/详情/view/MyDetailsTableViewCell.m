//
//  MyDetailsTableViewCell.m
//  ZYStudent
//
//  Created by MC on 2016/12/14.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "MyDetailsTableViewCell.h"

@implementation MyDetailsTableViewCell
-(void)prepareUI1{
    
    
    for (UIView *view in self.contentView.subviews) {
        [view removeFromSuperview];
    }
    CGFloat x = 15;
    CGFloat w = 44;
    CGFloat h = w;
    CGFloat y = 8;
    _headerBtn = [[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
    [_headerBtn setImage:[UIImage imageNamed:@"def_head112"] forState:0];
    ViewRadius(_headerBtn, h/2);
    [self.contentView addSubview:_headerBtn];

    x +=w + 10;
    h = 60;
    w = Main_Screen_Width - x - 150;
    y = 0;
    UILabel * nameLbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    nameLbl.textColor = [UIColor darkTextColor];
    nameLbl.text = @"michan";
    nameLbl.font = [UIFont systemFontOfSize:16];
    [self.contentView addSubview:nameLbl];

    x = Main_Screen_Width-10 - 140;
    w = 140;
    
    UILabel * timeLbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    timeLbl.textColor = [UIColor lightGrayColor];
    timeLbl.text = @"2016-09-09 13:00";
    timeLbl.font = [UIFont systemFontOfSize:13];
    timeLbl.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:timeLbl];
    

    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(15, 59.5, Main_Screen_Width -10 - 15, 0.5)];
    lineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    [self.contentView addSubview:lineView];

    
    
}
-(void)prepareUI2{
    
    CGFloat x = 15;
    CGFloat y = 8;
    CGFloat w = 20;
    CGFloat h = 20;
    UIImageView * imgview =[[ UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    imgview.image = [UIImage imageNamed:@"icon_date"];
    [self.contentView addSubview:imgview];
    
    x +=w + 10;
    w = Main_Screen_Width - x - 10;
    UILabel * timeLbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    timeLbl.textColor = [UIColor grayColor];
    timeLbl.font = [UIFont systemFontOfSize:14];
    timeLbl.text = @"行程时间: 2016-09-09 12:00";
    
    [self.contentView addSubview:timeLbl];

    
    y+= h + 8;
    w= 20;
    h = 20;
    x = 15;
    imgview =[[ UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    imgview.image = [UIImage imageNamed:@"icon_notice3"];
    [self.contentView addSubview:imgview];
    
    x +=w + 10;
    w = Main_Screen_Width - x - 10;

    w = Main_Screen_Width - x - 10;
    timeLbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    timeLbl.textColor = [UIColor grayColor];
    timeLbl.font = [UIFont systemFontOfSize:14];
    timeLbl.text = @"提醒时间: 2016-09-09 12:00";
    
    [self.contentView addSubview:timeLbl];

    
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(15, 24  + 40 -0.5, Main_Screen_Width -10 - 15, 0.5)];
    lineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    [self.contentView addSubview:lineView];
 
    
    
    
}
-(void)prepareUI3{
    
    
    CGFloat x = 15;
    CGFloat y = 8;
    CGFloat w = Main_Screen_Width -x - 10;
    CGFloat h = 20;

    NSString * str = @"今天今天今天今天今天今天今天今天今天今天今天今天今天今天今天今天今天今天今天";
    h = [MCToolsManage heightforString:str andWidth:w fontSize:14];
    
    UILabel * titleLbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    titleLbl.text = str;
    titleLbl.textColor = [UIColor grayColor];
    titleLbl.font = [UIFont systemFontOfSize:14];
    titleLbl.numberOfLines = 0;
    [self.contentView addSubview:titleLbl ];
    
    y+=h+8;
    CGFloat offx = 5;
    NSInteger count = 9;
    w = (titleLbl.mj_w - 10)/3;
    h = w;
    x = titleLbl.mj_x;
    
    for (NSInteger i = 0; i <count; i++) {
        UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
        [btn setImage:[UIImage imageNamed:@"def_organ-class"] forState:0];
        [self.contentView addSubview:btn];
        
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
