//
//  FriendlistTableViewCell.m
//  ZYStudent
//
//  Created by MC on 2016/12/14.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "FriendlistTableViewCell.h"

@implementation FriendlistTableViewCell
-(void)prepareUI{
    
    for (UIView * view in self.contentView.subviews) {
        [view removeFromSuperview];
    }
    CGFloat x = 10;
    CGFloat y = 5;
    CGFloat w = 45;
    CGFloat h =w;
    UIImageView  * headerimgview = [[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    headerimgview.image = [UIImage imageNamed:@"def_head112"];
    ViewRadius(headerimgview, w/2);
    [self.contentView addSubview:headerimgview];
    
    
    x += w + 10;
    w = Main_Screen_Width - x ;
    h = 55;
    y = 0;
    
    UILabel * nameLbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    nameLbl.text = @"michan";
    nameLbl.font = [UIFont systemFontOfSize:16];
    [self.contentView addSubview:nameLbl];

    
    
    
}
-(void)prepareUI2{
    
    for (UIView * view in self.contentView.subviews) {
        [view removeFromSuperview];
    }
    CGFloat x = 10;
    CGFloat y = 5;
    CGFloat w = 45;
    CGFloat h =w;
    UIImageView  * headerimgview = [[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    headerimgview.image = [UIImage imageNamed:@"def_head112"];
    ViewRadius(headerimgview, w/2);
    [self.contentView addSubview:headerimgview];
    
    
    x += w + 10;
    w = Main_Screen_Width - x ;
    h = 20;
    y = 5;
    
    UILabel * nameLbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    nameLbl.text = @"michan";
    nameLbl.font = [UIFont systemFontOfSize:16];
    [self.contentView addSubview:nameLbl];
    y +=h +5;
    w = Main_Screen_Width - x - 70;
    UILabel * Lbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    Lbl.text = @"我是我是我是我是我是";
    Lbl.textColor = [UIColor lightGrayColor];
    Lbl.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:Lbl];

   
    x = Main_Screen_Width - 15 - 60;
    h = 30;
    w = 60;
    y = (55 - h)/2;
    _okBtn = [[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
    [self.contentView addSubview:_okBtn];

    
    
    
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
