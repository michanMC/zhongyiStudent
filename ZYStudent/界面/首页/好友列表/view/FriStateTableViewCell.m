//
//  FriStateTableViewCell.m
//  ZYStudent
//
//  Created by MC on 2016/12/14.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "FriStateTableViewCell.h"

@implementation FriStateTableViewCell
-(void)prepareUI{
    for (UIView * view in self.contentView.subviews) {
        [view removeFromSuperview];
    }


    CGFloat x = 25;
    CGFloat y = (20-6)/2;
    CGFloat w = 6;
    CGFloat h= 6;
    UIView * hongview =[[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    hongview.backgroundColor =[UIColor redColor];
    [self.contentView addSubview:hongview];
    ViewRadius(hongview, h/2);
    x+=w + 5;
    w = Main_Screen_Width - 25 - x;
    h = 20;
    y = 0;
    
    UILabel *timeLbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    timeLbl.text = @"今天 12:00";
    timeLbl.textColor = [UIColor lightGrayColor];
    timeLbl.font =[UIFont systemFontOfSize:14];
    [self.contentView addSubview:timeLbl];

    y+=h + 7;
    NSString * str = @"下午下午下午下午下午下午下午下午下午下午下午下午下午下午下午下午";
   h = [MCToolsManage heightforString:str andWidth:w fontSize:14];
    
    UILabel * titleLbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    titleLbl.text = str;
    titleLbl.font =[UIFont systemFontOfSize:14];
    titleLbl.numberOfLines =0;
    [self.contentView addSubview:titleLbl];

    y+=h + 15;
    h = MCAdaptiveH(750, 280, Main_Screen_Width);
    
    UIImageView * imgview =[[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    imgview.image =[UIImage imageNamed:@"bg_def_424"];
    [self.contentView addSubview:imgview];

    y +=h + 14.5;
    UIView * lineView =[[UIView alloc]initWithFrame:CGRectMake(0,y, Main_Screen_Width, 0.5)];
    lineView.backgroundColor =[UIColor groupTableViewBackgroundColor];
    
    [self.contentView addSubview:lineView];

    
    
    
    
    
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
