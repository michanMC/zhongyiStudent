//
//  OrderDatasiltTableViewCell.m
//  ZYStudent
//
//  Created by MC on 2016/12/20.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "OrderDatasiltTableViewCell.h"

@implementation OrderDatasiltTableViewCell


-(void)prepareUI1{
    for (UIView * view in self.contentView.subviews) {
        [view removeFromSuperview];
    }
    
    _titleLbl = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, Main_Screen_Width - 10 - 80, 44)];
    _titleLbl.text =@"订单号:1213213213213213321";
    _titleLbl.font =[UIFont systemFontOfSize:14];
    _titleLbl.textColor =[UIColor lightGrayColor];
    [self.contentView addSubview:_titleLbl];
    
    _stateLbl =[[UILabel alloc]initWithFrame:CGRectMake(Main_Screen_Width - 10 - 80, 0,  80, 44)];
    _stateLbl.text =@"状态";
    _stateLbl.font =[UIFont systemFontOfSize:14];
    _stateLbl.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:_stateLbl];
    
    
    
    
}
-(void)prepareUI2{
    
    for (UIView * view in self.contentView.subviews) {
        [view removeFromSuperview];
    }
    CGFloat x = 10;
    CGFloat y = 10;
    CGFloat h = MCAdaptiveH(750, 240, Main_Screen_Width);
    CGFloat w = MCAdaptiveW(300, 240, h);
    UIImageView * imgview =[[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    
    imgview.image =[UIImage imageNamed:@"def_organ-class"];
    [self.contentView addSubview:imgview];
    
    x +=w + 10;
    w= Main_Screen_Width - x -10;
    h = 40;
    UILabel * lbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.text = @"课程课程课程课程课程课程课程课程课程课程课程课程课程课程";
    lbl.font =[UIFont systemFontOfSize:15];
    lbl.numberOfLines = 0;
    [self.contentView addSubview:lbl];

    
    y+=h + 5;
    h = 20;
    lbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.text = @"不知名机构";
    lbl.textColor = [UIColor lightGrayColor];
    lbl.font =[UIFont systemFontOfSize:14];
    [self.contentView addSubview:lbl];

    
    
    
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
