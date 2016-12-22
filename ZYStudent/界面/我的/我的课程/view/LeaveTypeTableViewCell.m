//
//  LeaveTypeTableViewCell.m
//  MCZhongYi
//
//  Created by MC on 2016/12/11.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "LeaveTypeTableViewCell.h"

@implementation LeaveTypeTableViewCell
-(void)prepareUI{
    
    for (UIView * view in self.contentView.subviews) {
        [view removeFromSuperview];
    }
    CGFloat x = 10;
    CGFloat  y = 0;
    CGFloat w = Main_Screen_Width - x - 30-10;
    CGFloat h = 44;
    _titelLbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    _titelLbl.textColor = [UIColor darkTextColor];
    _titelLbl.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:_titelLbl];
    
    x = Main_Screen_Width - 10 - 20;
    y = 12;
    w = 20;
    h = 20;
    _seleimg =[[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    [self.contentView addSubview:_seleimg];

    
    
    
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
