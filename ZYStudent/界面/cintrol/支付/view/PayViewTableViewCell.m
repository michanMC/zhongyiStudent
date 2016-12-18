//
//  PayViewTableViewCell.m
//  ZYStudent
//
//  Created by MC on 2016/12/17.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "PayViewTableViewCell.h"

@implementation PayViewTableViewCell
-(void)prepareUI{
    
    for (UIView * view in self.contentView.subviews) {
        [view removeFromSuperview];
    }
    CGFloat x = 10;
    CGFloat w = 34;
    CGFloat h = w;
    CGFloat y = 5;
    _imgview =[[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    [self.contentView addSubview:_imgview];
    x +=w + 10;
    y = 0;
    w= 150;
    h = 44;
    _titleLbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    _titleLbl.font =[UIFont systemFontOfSize:15];
    [self.contentView addSubview:_titleLbl];
    
    x = Main_Screen_Width - 10 -20;
    y = (44-20)/2;
    w = 20;
    h = w;
    _selectimg =[[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    _selectimg.image =[UIImage imageNamed:@"btn_click"];
    [self.contentView addSubview:_selectimg];

    
    
    
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
