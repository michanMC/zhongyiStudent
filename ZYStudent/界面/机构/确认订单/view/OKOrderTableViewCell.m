//
//  OKOrderTableViewCell.m
//  ZYStudent
//
//  Created by MC on 2016/12/15.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "OKOrderTableViewCell.h"

@implementation OKOrderTableViewCell
-(void)prepareUI1{
    
    for (UIView * view in self.contentView.subviews) {
        [view removeFromSuperview];
    }
    
    
    CGFloat viewh = MCAdaptiveH(750, 280, Main_Screen_Width);
    
    CGFloat x = 5;
    CGFloat y = 5;
    CGFloat h = viewh - 10;
    CGFloat w = MCAdaptiveW(300, 240, h);
    
    UIImageView * imgview =[[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    imgview.image =[UIImage imageNamed:@"bg_def_424"];
    
    [self.contentView addSubview:imgview];
    
    x +=w + 8;
    w = Main_Screen_Width - x - 10;
    h = 40;
    UILabel * titleLbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    titleLbl.font = [UIFont systemFontOfSize:15];
    titleLbl.numberOfLines =0;
    titleLbl.text = @"吉他吉他吉他吉他吉他吉他吉他吉他吉他吉他吉他吉他吉他吉他吉他吉他";
    [self.contentView addSubview:titleLbl];

    y+=h + 8;
    h = 20;
    
    UILabel * Lbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    Lbl.font = [UIFont systemFontOfSize:13];
    Lbl.textColor =[UIColor lightGrayColor];
    Lbl.text =@"不知名机构";
    
    [self.contentView addSubview:Lbl];

    
    
    
    
}
-(void)prepareUI2{
    
    for (UIView * view in self.contentView.subviews) {
        [view removeFromSuperview];
    }
    
    UIImageView * imgview =[[UIImageView alloc]initWithFrame:CGRectMake(20, 10, 30, 30)];
    imgview.image =[UIImage imageNamed:@"icon_sel-child"];
    [self.contentView addSubview:imgview];
    
    UILabel * lbl =[[UILabel alloc]initWithFrame:CGRectMake(60, 0, 100, 50)];
    lbl.text = @"请选择孩子";
    lbl.font = [UIFont systemFontOfSize:14];
    
    [self.contentView addSubview:lbl];

    
    
    
}
-(void)prepareUI4{
    
    for (UIView * view in self.contentView.subviews) {
        [view removeFromSuperview];
    }
    
    _headImgview =[[UIImageView alloc]initWithFrame:CGRectMake(20, 5, 40, 40)];
    _headImgview.image =[UIImage imageNamed:@"def_head112"];
    ViewRadius(_headImgview, 20);
    [self.contentView addSubview:_headImgview];
  CGFloat w=  [MCToolsManage heightforString:@"michan" andHeight:50 fontSize:14];
    _nameLbl =[[UILabel alloc]initWithFrame:CGRectMake(70, 0, w, 50)];
    _nameLbl.text = @"michan";
    _nameLbl.font = [UIFont systemFontOfSize:14];
    
    [self.contentView addSubview:_nameLbl];
    
    CGFloat x =70 + w + 5;
    
    UIImageView * imgview =[[UIImageView alloc]initWithFrame:CGRectMake(x, (50-20)/2, 20, 20)];
    imgview.image =[UIImage imageNamed:@"icon_male"];
    [self.contentView addSubview:imgview];
    
    
    
    x +=20 + 5;
    
    UILabel *numLbl =[[UILabel alloc]initWithFrame:CGRectMake(x, 0, 50, 50)];
    numLbl.text = @"13岁";
    numLbl.font = [UIFont systemFontOfSize:13];
    numLbl.textColor =[UIColor lightGrayColor];
    [self.contentView addSubview:numLbl];

    
    
    
    
}

-(void)prepareUI3{
    for (UIView * view in self.contentView.subviews) {
        [view removeFromSuperview];
    }
    CGFloat w = [MCToolsManage heightforString:@"联系方式" andHeight:44 fontSize:14];
    UILabel * lbl =[[UILabel alloc]initWithFrame:CGRectMake(10, 0, w, 44)];
    lbl.text = @"联系方式";
    lbl.font = [UIFont systemFontOfSize:14];
    
    [self.contentView addSubview:lbl];
    


    _phoneText = [[UITextField alloc]initWithFrame:CGRectMake(w + 10 + 10,0, Main_Screen_Width - (w + 10 + 10 + 10), 44)];
    
    _phoneText.font = [UIFont systemFontOfSize:14];
    _phoneText.placeholder = @"请输入手机号码";
    [self.contentView addSubview:_phoneText];

    
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
