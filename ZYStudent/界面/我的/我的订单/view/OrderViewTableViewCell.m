//
//  OrderViewTableViewCell.m
//  ZYStudent
//
//  Created by MC on 2016/12/20.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "OrderViewTableViewCell.h"

@implementation OrderViewTableViewCell
-(void)prepareUI{
    for (UIView *view in self.contentView.subviews) {
        [view removeFromSuperview];
    }
    
    CGFloat viewh = 44 * 2 + 1 + MCAdaptiveH(750, 240, Main_Screen_Width) + 20;

    CGFloat x = 10;
    CGFloat w= Main_Screen_Width - x - 70;
    CGFloat h = 44;
    CGFloat y = 0;
    UILabel *lbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.textColor = [UIColor lightGrayColor];
    lbl.font = [UIFont systemFontOfSize:14];
    lbl.adjustsFontSizeToFitWidth = YES;
    lbl.text = @"订单号:10000000";
    [self.contentView addSubview:lbl];
    
    x = Main_Screen_Width - 10 - 60;
    
    lbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, 60, 44)];
    lbl.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:lbl];
    NSString *stateStr = @"";
    if (_stateIndex == 1) {
        stateStr = @"待支付";
        lbl.textColor = AppMCNATitleCOLOR;
        
    }
    if (_stateIndex == 2) {
        stateStr = @"已支付";
        lbl.textColor = [UIColor grayColor];
        
    }
    if (_stateIndex == 3) {
        stateStr = @"待评论";
        lbl.textColor = AppMCNATitleCOLOR;
        
    }
    if (_stateIndex == 4) {
        stateStr = @"已完成";
        lbl.textColor = [UIColor grayColor];
        
    }
    if (_stateIndex == 5) {
        stateStr = @"已取消";
        lbl.textColor = [UIColor grayColor];
        
    }

    lbl.text =stateStr;

    y+=h;
    UIView * lineView =[[UIView alloc]initWithFrame:CGRectMake(0, y, Main_Screen_Width, 0.5)];
    lineView.backgroundColor =[UIColor groupTableViewBackgroundColor];
    [self.contentView addSubview:lineView];

    
    x = 10;
    y +=0.5 + 10;
    h = MCAdaptiveH(750, 240, Main_Screen_Width);
    w= MCAdaptiveW(300, 240, h);
    UIImageView * imgview =[[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    
    imgview.image =[UIImage imageNamed:@"def_bg2"];
    [self.contentView addSubview:imgview];

    x +=w+ 5;
    w = Main_Screen_Width - x - 5;
    h = 40;
    lbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.textColor = [UIColor darkTextColor];
    lbl.font = [UIFont systemFontOfSize:15];
    lbl.text = @"订单订单订单订单订单订单订单订单订单订单订单订单订单";
    lbl.numberOfLines = 0;
    
    [self.contentView addSubview:lbl];
    
    y +=h + 8;
    h = 20;
    lbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.textColor = [UIColor lightGrayColor];
    lbl.font = [UIFont systemFontOfSize:14];
    lbl.text = @"不知名机构";
    
    [self.contentView addSubview:lbl];

    y = imgview.mj_y + imgview.mj_h + 10;
    lineView =[[UIView alloc]initWithFrame:CGRectMake(0, y, Main_Screen_Width, 0.5)];
    lineView.backgroundColor =[UIColor groupTableViewBackgroundColor];
    [self.contentView addSubview:lineView];
    
    y+=0.5;
    x = 10;
    w = [MCToolsManage heightforString:@"订单金额:" andHeight:44 fontSize:15];
    h = 44;
    
    lbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.textColor = [UIColor darkTextColor];
    lbl.font = [UIFont systemFontOfSize:15];
    lbl.text = @"订单金额:";
    [self.contentView addSubview:lbl];

    x+=w+5;
    w = Main_Screen_Width - x - 170/2;
    lbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.textColor = [UIColor redColor];
    lbl.font = [UIFont systemFontOfSize:15];
    lbl.text = @"￥1231.00";
    [self.contentView addSubview:lbl];
    
    w= 70;
    h = 30;
    x = Main_Screen_Width - 10 - w;
    y += (44 - 30)/2;
    _stateBtn = [[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
    _stateBtn.hidden = YES;
    ViewRadius(_stateBtn, 3);
    _stateBtn.backgroundColor = AppMCNACOLOR;
    _stateBtn.titleLabel.font =[UIFont systemFontOfSize:14];
    UIColor * cc = AppMCNATitleCOLOR;
    [_stateBtn setTitleColor:cc forState:0];
    NSString * sss = @"";
    if (_stateIndex == 1) {
        _stateBtn.hidden = NO;
        sss = @"去支付";
        
    }
    if (_stateIndex == 3) {
        _stateBtn.hidden = NO;
        sss = @"去评价";
        
    }

    [_stateBtn setTitle:sss forState:0];

    
    [self.contentView addSubview:_stateBtn];

    

    
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
