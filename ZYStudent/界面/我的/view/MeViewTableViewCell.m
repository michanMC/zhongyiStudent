//
//  MeViewTableViewCell.m
//  ZYStudent
//
//  Created by MC on 2016/12/19.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "MeViewTableViewCell.h"

@implementation MeViewTableViewCell


-(void)prepareUI{
    
    for (UIView *view in self.contentView.subviews) {
        [view removeFromSuperview];
    }
    
    CGFloat h = ( Main_Screen_Width - 1)/3;
    CGFloat w = h;
    CGFloat x = 0;
    CGFloat y = 0;
   
    
    for (NSInteger i = 0; i<3; i++) {
        
        UIView * view =[[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
        view.backgroundColor =[UIColor whiteColor];
        [self.contentView addSubview:view];
        
        UIImageView * imgview =[[UIImageView alloc]initWithFrame:CGRectMake((w - 60)/2, (w - 60)/2, 60, 60)];
        imgview.image = [UIImage imageNamed:_imgArray[i]];
        
        [view addSubview:imgview];
        UILabel * lbl =[[UILabel alloc]initWithFrame:CGRectMake(0, imgview.mj_y + imgview.mj_h + 10, w, 15)];
        lbl.text = _titleArray[i];
        lbl.font =[UIFont systemFontOfSize:14];
        lbl.textAlignment = NSTextAlignmentCenter;
        [view addSubview:lbl];

        UIButton * btn =[[UIButton alloc]initWithFrame:CGRectMake(0, 0, w, h)];
        [btn setTitle:_titleArray[i] forState:0];
        btn.titleLabel.hidden = YES;
        [btn setTitleColor:[UIColor clearColor] forState:0];
        [view addSubview:btn];
        btn.tag = i + _index;
        
        [btn addTarget:self action:@selector(actionBtn:) forControlEvents:1<<6];
        if (i <2) {
            UIView * lineview =[[UIView alloc]initWithFrame:CGRectMake(x+w, 0, 0.5, h)];
            lineview.backgroundColor =[UIColor lightGrayColor];
            [self.contentView addSubview:lineview];

        }
        
        x+=w+0.5;
    }
    
    
    
    
    
}
-(void)actionBtn:(UIButton*)btn{
    
    if (_delegate) {
        [_delegate selectBtn:btn];
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
