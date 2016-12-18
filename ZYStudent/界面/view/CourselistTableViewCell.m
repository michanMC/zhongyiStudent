//
//  CourselistTableViewCell.m
//  ZYStudent
//
//  Created by MC on 2016/12/15.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "CourselistTableViewCell.h"

@implementation CourselistTableViewCell


-(void)prepareUI{
    for (UIView * view in self.contentView.subviews) {
        [view removeFromSuperview];
    }
    CGFloat viewh = MCAdaptiveH(750, 280, Main_Screen_Width);
    
    CGFloat x = 10;
    CGFloat y = 10;
    CGFloat h = viewh - 2*x;
    CGFloat w = MCAdaptiveW(300, 240, h);
    UIImageView * imgview = [[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    imgview.image =[UIImage imageNamed:@"def_organ-class"];
    [self.contentView addSubview:imgview];
    UILabel * lbl;
    if (!_index) {
    
    CGFloat lw = [MCIucencyView heightforString:@"一对一" andHeight:20 fontSize:14];
    UIImageView * bgImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 10, lw + 10, 20)];
    bgImg.image = [UIImage imageNamed:@"pic_class-bg"];
    [imgview addSubview:bgImg];
     lbl= [[UILabel alloc]initWithFrame:CGRectMake(5, 0, lw, 20)];
    lbl.textColor = [UIColor darkTextColor];
    lbl.font = [UIFont systemFontOfSize:14];
    lbl.text = @"一对一";
    [bgImg addSubview:lbl];
    }
    
    
    
    x = imgview.mj_x +imgview.mj_w + 5;
    y = 8;
    w = Main_Screen_Width - x - 5;
    if (_index==1) {
        h =20;
    }else
    h = 40;
    
    lbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.textColor = [UIColor darkTextColor];
    lbl.font = [UIFont systemFontOfSize:15];
    lbl.text = @"激情激情激情激情激情激情激情激情激情激情激情激情激情激情激情激情激情激情激情激情";
    lbl.numberOfLines = 0;
    [self.contentView addSubview:lbl];

    y+=h + 3;
    h = 20;
    w = w/2;
    HCSStarRatingView* starRatingView  = [[HCSStarRatingView alloc] initWithFrame:CGRectMake(x, y, w, h)];
    starRatingView.maximumValue = 5;
    starRatingView.minimumValue = 0;
    starRatingView.value = 4.5f;
    starRatingView.tintColor = [UIColor redColor];
    starRatingView.enabled = NO;
    [self.contentView addSubview:starRatingView];
    
    x +=w + 10;
    w = Main_Screen_Width - x - 10;
    UILabel * countLbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    countLbl.textColor = [UIColor lightGrayColor];
    countLbl.font =[UIFont systemFontOfSize:13];
    countLbl.text =@"66条评论";
    [self.contentView addSubview:countLbl];

    if (_index == 0 ||_index  == 2) {
        if (_index == 0) {
            
    x = lbl.mj_x;
    y += h;
    w= Main_Screen_Width - 10 - x;
    UILabel * namelbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    namelbl.text = @"michan";
    namelbl.textColor = [UIColor grayColor];
    namelbl.font =[UIFont systemFontOfSize:14];
    [self.contentView addSubview:namelbl];
        }
        if (_index==2) {
            x = lbl.mj_x;

        }
    y = imgview.mj_y + imgview.mj_h - 20;
    UILabel * Pricelbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    Pricelbl.text = @"￥233.00";
    Pricelbl.textColor = [UIColor redColor];
    Pricelbl.font =[UIFont systemFontOfSize:16];
    [self.contentView addSubview:Pricelbl];
    }
    else if(_index ==1)
    {
        x = lbl.mj_x;
        h = 20;
        w = 20;
        y = imgview.mj_y + imgview.mj_h - 20;
        UIImageView * mapView = [[UIImageView alloc]initWithFrame:CGRectMake(x, y+2.5, w-6.5, h-5)];
        mapView.image = [UIImage imageNamed:@"icon_location2"];
        [self.contentView addSubview:mapView];
        
        x += w+3;
        w = Main_Screen_Width - x /2;
        
        UILabel * maplbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
        maplbl.textColor = [UIColor grayColor];
        maplbl.font = [UIFont systemFontOfSize:14];
        maplbl.text = @"广州.天河";
        [self.contentView addSubview:maplbl];
        
        x =Main_Screen_Width - w;
        h = 20;
        w-=10;
        maplbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
        maplbl.textColor = [UIColor grayColor];
        maplbl.font = [UIFont systemFontOfSize:14];
        maplbl.textAlignment = NSTextAlignmentRight;
        maplbl.text = @"233M";
        [self.contentView addSubview:maplbl];
        
        
        
        
        
    }
    
    
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
