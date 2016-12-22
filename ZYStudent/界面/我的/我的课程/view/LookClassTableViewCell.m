
//
//  LookClassTableViewCell.m
//  MCZhongYi
//
//  Created by MC on 2016/12/9.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "LookClassTableViewCell.h"

@implementation LookClassTableViewCell
-(void)prepareUI:(NSInteger)index{
    
    for (UIView * view in self.contentView.subviews) {
        [view removeFromSuperview];
    }
    
    CGFloat x = 10;
    CGFloat y = 0;
    CGFloat w =Main_Screen_Width - x ;
    CGFloat h = 44;
    _titleLbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    _titleLbl.text = @"2016-09-09 12:00 - 13:00";
    _titleLbl.textColor = [UIColor grayColor];
    _titleLbl.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:_titleLbl];
    
    NSString * btnStr = @"课程总结";
    CGFloat w1 = [MCToolsManage heightforString:btnStr andHeight:25 fontSize:15] + 10;
    CGFloat w2 = [MCToolsManage heightforString:@"去评论" andHeight:25 fontSize:15] + 10;
    
    if (index == 0) return;
    
    if (index == 1||index == 3||index == 5) {
        w = w1;
    }
    if (index == 2||index == 4) {
        w = w2;
    }
    x = Main_Screen_Width - 15 - w;
    y = (44- 25)/2;
    h = 25;
    UIColor * cc = AppMCNATitleCOLOR;
    _tepyBtn = [[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
    if (index == 1||index == 2) {
        _tepyBtn.backgroundColor = AppMCNACOLOR;
    }
    if (index == 1) {
        [_tepyBtn setTitle:@"课程总结" forState:0];
    }
    if (index == 2) {
        [_tepyBtn setTitle:@"去评论" forState:0];

    }
    if (index == 3) {
        [_tepyBtn setTitle:@"查看总结" forState:0];

    }
    if (index == 4) {
        [_tepyBtn setTitle:@"评价" forState:0];
        
    }
    if (index == 5) {
        [_tepyBtn setTitle:@"查看评价" forState:0];
        
    }


    [_tepyBtn setTitleColor:cc forState:0];
    _tepyBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:_tepyBtn];
    
    
    
    
    
    
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
