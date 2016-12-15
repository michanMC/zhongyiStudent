//
//  MyTaskHeaderCollectionViewCell.m
//  ZYStudent
//
//  Created by MC on 2016/12/15.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "MyTaskHeaderCollectionViewCell.h"

@implementation MyTaskHeaderCollectionViewCell
-(void)prepareUI{
    
    for (UIView* obj in self.contentView.subviews)
        [obj removeFromSuperview];
    
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w =Main_Screen_Width;
    CGFloat h =200;
    
    
    
    UIImageView *bgimgview =[[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    
    bgimgview.image =[UIImage imageNamed:@"list_bg"];
    [self.contentView addSubview:bgimgview];
    
    
    w = 150;
    h = w;
    x = (Main_Screen_Width - w)/2;
    y = (200-w)/2;
    
    UIImageView *imgview =[[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    
    imgview.image =[UIImage imageNamed:@"pic_toybig-bg"];
    [bgimgview addSubview:imgview];

    
    w = 190/2;
    h = 230/2;
    x = (imgview.mj_w - w)/2;
    y = (imgview.mj_h-h)/2;
    
  UIImageView*  imgview2 =[[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    
    imgview2.image =[UIImage imageNamed:@"pic_toybig"];
    [imgview addSubview:imgview2];
    
    
    
    
    
    w =  [MCToolsManage heightforString:@"LV6" andHeight:20 fontSize:15] + 20+20;
    h = 20;
    y = 34;
    x = Main_Screen_Width -w+10;
    
    MCIucencyView * IucencyView = [[MCIucencyView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    [IucencyView setBgViewColor:[UIColor whiteColor ]];
    [IucencyView setBgViewAlpha:.8];
    ViewBorderRadius(IucencyView, h/2, 1, [UIColor groupTableViewBackgroundColor]);
    
    [bgimgview addSubview:IucencyView];
   UILabel* lbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, w-10, h)];
    lbl.text =@"LV6";
    lbl.textColor = AppMCNATitleCOLOR;
    lbl.font  =[UIFont systemFontOfSize:15];
    lbl.textAlignment = NSTextAlignmentCenter;
    [IucencyView addSubview:lbl];

    
    
    
    
    
    
}

@end
