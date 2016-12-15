//
//  TeacherCardTableViewCell.m
//  ZYStudent
//
//  Created by MC on 2016/12/15.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "TeacherCardTableViewCell.h"

@implementation TeacherCardTableViewCell
-(void)prepareUI1{
    
    for (UIView * view in self.contentView.subviews) {
        [view removeFromSuperview];
    }
    CGFloat hx = 15;
    CGFloat hy = 8 + (15-6)/2;
    CGFloat hw = 6;
    CGFloat hh = 6;
    CGFloat offhh = (15-6) + 8 ;
    
    CGFloat x = 15 + hw + 5;
    CGFloat y = 8;
    CGFloat w = Main_Screen_Width - x - 5;
    CGFloat h = 15;
    CGFloat offh = 8 ;

    
    for (NSInteger i = 0; i < 5; i ++) {
        
        UIView * hongview = [[UIView alloc]initWithFrame:CGRectMake(hx, hy, hw, hh)];
        hongview.backgroundColor =[UIColor groupTableViewBackgroundColor];
        ViewRadius(hongview, hh/2);
        [self.contentView addSubview:hongview];
        
        UILabel * lbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
        lbl.textColor = [UIColor lightGrayColor];
        lbl.text = @"2009-09-02-2015-01-01 兼职";
        lbl.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:lbl];
        
        y+=h+offh;
        hy+=hh+offhh;
        
        
    }
    
    
    
    
    
    
    
    
    
    
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
