//
//  SelectSonTableViewCell.m
//  ZYStudent
//
//  Created by MC on 2016/12/15.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "SelectSonTableViewCell.h"

@implementation SelectSonTableViewCell
-(void)prepareUI{
    
    for (UIView * view in self.contentView.subviews) {
        [view removeFromSuperview];
    }
    
    CGFloat x = 10;
    CGFloat y = 8;
    CGFloat w = 44;
    CGFloat h =w;
    
    
    UIImageView * headimgview = [[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    headimgview.image =[UIImage imageNamed:@"def_head112"];
    ViewRadius(headimgview, w/2);
    [self.contentView addSubview:headimgview];
    
    x +=w + 10;
    y = 0;
    h = 60;
    NSString * str =@"michan";
  w=  [MCToolsManage heightforString:str andHeight:60 fontSize:15];
    UILabel * namelbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    namelbl.text =str;
    namelbl.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:namelbl];
    x +=w + 5;
    w= 20;
    h =w;
    y = (60 - w)/2;
    UIImageView *seximg = [[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    seximg.image =[UIImage imageNamed:@"icon_male"];
    [self.contentView addSubview:seximg];

    x = Main_Screen_Width - 10 - w;
    
   _selectimg = [[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    _selectimg.image =[UIImage imageNamed:@"btn_click"];
    [self.contentView addSubview:_selectimg];
    

    
    
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
