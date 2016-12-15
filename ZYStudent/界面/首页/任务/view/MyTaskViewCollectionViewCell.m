//
//  MyTaskViewCollectionViewCell.m
//  ZYStudent
//
//  Created by MC on 2016/12/15.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "MyTaskViewCollectionViewCell.h"

@implementation MyTaskViewCollectionViewCell
-(void)prepareUI{
    
    for (UIView* obj in self.contentView.subviews)
        [obj removeFromSuperview];
    UIColor *cc = kUIColorFromRGB(0xf6ae22);
    CGRect  frame = self.contentView.frame;
    self.contentView.backgroundColor = [UIColor whiteColor];
    
   MCIucencyView  * bgView = [[MCIucencyView alloc]initWithFrame:frame];
    
    [bgView setBgViewColor:cc];
    [bgView setBgViewAlpha:0.09];
    [self.contentView addSubview:bgView];
    ViewBorderRadius(bgView, 5, 1.5, cc);
    
    CGFloat x = 5;
    CGFloat y = 10;
    CGFloat w= frame.size.width - 2*x;
    CGFloat h =20;
    
    UILabel * titleLbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    titleLbl.text =@"拥抱孩子10分钟";
    titleLbl.font =[UIFont systemFontOfSize:15];
    titleLbl.textAlignment = NSTextAlignmentCenter;
    [bgView addSubview:titleLbl];

    h = 30;
    w = frame.size.width - 10;
    x = 5;
    y = frame.size.height - 5 - h;
    
     _btn= [[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
    [_btn setTitle:@"领取" forState:0];
    [_btn setTitleColor:[UIColor whiteColor] forState:0];
    _btn.backgroundColor =cc;
    _btn.titleLabel.font =[UIFont systemFontOfSize:14];
    [bgView addSubview:_btn];
    ViewRadius(_btn, 3);
    
    h = frame.size.height - 10 - 20 - 5 - 30;

    w = 42;
    y =( h-34)/2 - 10 + 30;
    h = 34;
    x = (bgView.mj_w - w)/2;
    
    UIImageView * imgview =[[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    
    imgview.image =[UIImage imageNamed:@"pic_plant_active"];
    [bgView addSubview:imgview];
    y += h;
    h = 10;
    w = bgView.mj_w;
    x = 0;
    UILabel *lbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.text =@"20成长";
    lbl.textColor =[UIColor lightGrayColor];
    lbl.font =[UIFont systemFontOfSize:10];
    lbl.textAlignment = NSTextAlignmentCenter;
    [bgView addSubview:lbl];

    
    
    
    
    
    
    
    
    
    
}

@end
