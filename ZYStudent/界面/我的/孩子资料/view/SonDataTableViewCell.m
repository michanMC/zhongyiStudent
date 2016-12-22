//
//  SonDataTableViewCell.m
//  ZYStudent
//
//  Created by MC on 2016/12/23.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "SonDataTableViewCell.h"

@implementation SonDataTableViewCell
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
    x +=w + 5;
    UILabel * numLbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, 70, h)];
    numLbl.textColor =[UIColor grayColor];
    numLbl.text = @"17岁";
    numLbl.font =[UIFont systemFontOfSize:14];
    
    [self.contentView addSubview:numLbl];

    
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
