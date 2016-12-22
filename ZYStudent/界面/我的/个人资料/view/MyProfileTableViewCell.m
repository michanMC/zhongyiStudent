//
//  MyProfileTableViewCell.m
//  MCZhongYi
//
//  Created by MC on 2016/12/6.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "MyProfileTableViewCell.h"

@implementation MyProfileTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)prepareUI1{
    for (UIView * view in self.contentView.subviews) {
        [view removeFromSuperview];
    }
    
    CGFloat x  = 10;
    CGFloat y = 0;
    CGFloat w = Main_Screen_Width /2;
    CGFloat h = 56;
    _titleLbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    _titleLbl.font = [UIFont systemFontOfSize:15];
    _titleLbl.textColor = [UIColor darkTextColor];
    _titleLbl.text = @"头像";
    [self.contentView addSubview:_titleLbl];
    
    y =5;
    w = h - 10;
    h = w;
    x = Main_Screen_Width - 30 - h;
    _headerImgview = [[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    ViewRadius(_headerImgview, w/2);
    _headerImgview.image = [UIImage imageNamed:@"def_head48"];
    [self.contentView addSubview:_headerImgview];

    
    
    
    
}
-(void)prepareUI2{
    for (UIView * view in self.contentView.subviews) {
        [view removeFromSuperview];
    }
    
    CGFloat x  = 10;
    CGFloat y = 0;
    CGFloat w = Main_Screen_Width /2;
    CGFloat h = 44;
    _titleLbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    _titleLbl.font = [UIFont systemFontOfSize:15];
    _titleLbl.textColor = [UIColor darkTextColor];
    _titleLbl.text = @"姓名";
    [self.contentView addSubview:_titleLbl];

    w = Main_Screen_Width - x - 30;
    _titleSubLbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    _titleSubLbl.font = [UIFont systemFontOfSize:15];
    _titleSubLbl.textColor = [UIColor grayColor];
    _titleSubLbl.text = @"michan";
    _titleSubLbl.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:_titleSubLbl];

    
    
    
    
}
-(void)prepareUI3{
    for (UIView * view in self.contentView.subviews) {
        [view removeFromSuperview];
    }
    
    CGFloat x  = 10;
    CGFloat y = 0;
    CGFloat w = Main_Screen_Width /2;
    CGFloat h = 44;
    _titleLbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    _titleLbl.font = [UIFont systemFontOfSize:15];
    _titleLbl.textColor = [UIColor darkTextColor];
    _titleLbl.text = @"";
    [self.contentView addSubview:_titleLbl];
    
    w = Main_Screen_Width/3;
    x = Main_Screen_Width - 30 - w;
    y = 12;
    h = 20;
    _starRatingView  = [[HCSStarRatingView alloc] initWithFrame:CGRectMake(x, y, w, h)];
    _starRatingView.maximumValue = 5;
    _starRatingView.minimumValue = 0;
    _starRatingView.value = 3;
    _starRatingView.tintColor = [UIColor redColor];
    _starRatingView.enabled = NO;
    [self.contentView addSubview:_starRatingView];

    
    
    
}
-(void)prepareUI4{
    for (UIView * view in self.contentView.subviews) {
        [view removeFromSuperview];
    }
    
    CGFloat x  = 10;
    CGFloat y = 0;
    CGFloat w = Main_Screen_Width /2;
    CGFloat h = 44;
    _titleLbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    _titleLbl.font = [UIFont systemFontOfSize:15];
    _titleLbl.textColor = [UIColor darkTextColor];
    _titleLbl.text = @"";
    [self.contentView addSubview:_titleLbl];
    
    w = 70;
    h = 20;
    y = 12;
    x = Main_Screen_Width - 30 - w;
    UILabel * lbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.text = @"好老师";
    lbl.font = [UIFont systemFontOfSize:13];
    lbl.textColor = kUIColorFromRGB(0xc94019);
    lbl.textAlignment = NSTextAlignmentCenter;
    ViewBorderRadius(lbl, 10, 1, kUIColorFromRGB(0xc94019));
    [self.contentView addSubview:lbl];

    
//    for (NSString * str in _identifArray) {
//        
//    }
    
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
