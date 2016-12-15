//
//  MyDynamicTableViewCell.m
//  ZYStudent
//
//  Created by MC on 2016/12/13.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "MyDynamicTableViewCell.h"

@implementation MyDynamicTableViewCell



-(void)prepareUI{
    
    for (UIView * view in self.contentView.subviews) {
        [view removeFromSuperview];
    }
    CGFloat x = 15;
    CGFloat y = 0;
    CGFloat w= 25;
    CGFloat h = w;
    UIImageView * img = [[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    img.image =[UIImage imageNamed:@"icon_date"];
    [self.contentView addSubview:img];
    
    x +=w + 7;
    w = 150;
    
    UILabel *timelbl =[[ UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    timelbl.textColor = [UIColor grayColor];
    timelbl.text = @"今天 10:10";
    timelbl.font = [UIFont systemFontOfSize:14];
    
    [self.contentView addSubview:timelbl];
    y+= h + 5;
    w = Main_Screen_Width - 10 - x;
    h = [MCToolsManage heightforString:@"下午下午下午下午下午下午下午下午下午下午下午下午下午下午下午下午下午下午下午下午下午下午下午下午下午下午下午下午下午下午下午下午下午" andWidth:w fontSize:15];
    
    UILabel * titleLbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    titleLbl.text = @"下午下午下午下午下午下午下午下午下午下午下午下午下午下午下午下午下午下午下午下午下午下午下午下午下午下午下午下午下午下午下午下午下午";
    titleLbl.textColor = [UIColor grayColor];
    titleLbl.font = [UIFont systemFontOfSize:15];
    titleLbl.numberOfLines = 0;
    [self.contentView addSubview:titleLbl];

    y += h + 8;
    h = MCAdaptiveH(750, 406, Main_Screen_Width);
    
    UIImageView * imgview = [[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    imgview.image =[UIImage imageNamed:@"def_organ-class"];
    [self.contentView addSubview:imgview];

   
    y = 24 + (5+titleLbl.mj_h+8+imgview.mj_h+56/2)/2;
    x = (15 + 25/2) - (5+titleLbl.mj_h+8+imgview.mj_h+56/2)/2;
    w = 5+titleLbl.mj_h+8+imgview.mj_h+56/2;
    h = 1;
    UIView * lineView = [[UIView alloc]initWithFrame:CGRectMake(x, y,w, h)];
    lineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.contentView addSubview:lineView];
    [MCToolsManage drawDashLine:lineView lineLength:1.5 lineSpacing:5 lineColor:[UIColor whiteColor]];
//           lineView.transform = CGAffineTransformRotate(lineView.transform, M_PI/2);
//    lineView.transform=CGAffineTransformMakeRotation(M_PI/2);
//    lineView.transform = CGAffineTransformTranslate(lineView.transform, x,y);
    CGAffineTransform  trans = CGAffineTransformMakeTranslation(0, 0);
    trans = CGAffineTransformRotate(trans,M_PI/2);
//    trans = CGAffineTransformTranslate(trans,-x, -y);
    lineView.transform = trans;

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
