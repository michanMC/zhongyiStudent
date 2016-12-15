//
//  ComViewTableViewCell.m
//  MCZhongYi
//
//  Created by MC on 2016/12/7.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "ComViewTableViewCell.h"

@implementation ComViewTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)prepareUI{
    
    for (UIView * view in self.contentView.subviews) {
        [view removeFromSuperview];
    }
    CGFloat x = 10;
    CGFloat y = 10;
    CGFloat w = 30;
    CGFloat h = w;
    
    _headerBtn = [[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
    [_headerBtn setImage:[UIImage imageNamed:@"def_head-48"] forState:0];
    ViewRadius(_headerBtn, w/2);
    [self.contentView addSubview:_headerBtn];
    x += w + 3;
    w = Main_Screen_Width / 2 - x;
    _nameLbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    _nameLbl.text = @"michan";
    _nameLbl.textColor = [UIColor lightGrayColor];
    _nameLbl.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:_nameLbl];

    w = 100;
    x = Main_Screen_Width - 10 - w;
    _starRatingView  = [[HCSStarRatingView alloc] initWithFrame:CGRectMake(x, y, w, h)];
    _starRatingView.maximumValue = 5;
    _starRatingView.minimumValue = 0;
    _starRatingView.value = 3;
    _starRatingView.tintColor = [UIColor redColor];
    _starRatingView.enabled = NO;
    [self.contentView addSubview:_starRatingView];

    
    x = 10;
    y+= h +8;
    w = Main_Screen_Width - 2*x;
    NSString * str = @"海滩惊现大量生物诡异似“果冻”，令人吃惊！深海中还暗藏了多少神秘生物，我们不得而知。近日，美国加利福尼亚州的亨廷顿海滩突然出现了好多神秘海洋生物，大家觉得这是什么?";
  h =  [MCToolsManage heightforString:str andWidth:w fontSize:14];
    UILabel * lbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.text = str;
    lbl.textColor = [UIColor grayColor];
    lbl.font = [UIFont systemFontOfSize:14];
    lbl.numberOfLines = 0;
    [self.contentView addSubview:lbl];

    if (1) {
        y +=h + 5;
        h = 25;
        w = 60;
        x = 10;
        lbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
        lbl.text = @"好老师";
        lbl.textColor = [UIColor orangeColor];
        lbl.textAlignment = NSTextAlignmentCenter;
        lbl.font = [UIFont systemFontOfSize:14];
        ViewBorderRadius(lbl, h/2, 1, [UIColor orangeColor]);
        [self.contentView addSubview:lbl];
    }
    y +=h + 5;
    h = 20;
    w = Main_Screen_Width/2 - 10;
    x = Main_Screen_Width/2;
    
    lbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.text = @"今天12：00";
    lbl.textColor = [UIColor lightGrayColor];
    lbl.font = [UIFont systemFontOfSize:14];
    lbl.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:lbl];

    
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
