
//
//  gradeViewTableViewCell.m
//  ZYStudent
//
//  Created by MC on 2016/12/15.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "gradeViewTableViewCell.h"

@implementation gradeViewTableViewCell
-(void)prepareUI{
    
    for (UIView* obj in self.contentView.subviews)
        [obj removeFromSuperview];
    
    CGFloat x = 10;
    CGFloat y = 10;
    CGFloat w =Main_Screen_Width - 20;
    CGFloat h =200;
    NSString * str = @"广州紫鲸互联网科技有限公司（Guangzhou Zijing Internet Technology Co.,Ltd）前身是深圳粉果科技，注册资金为1000万。总部在广州，佛山设立分公司，同时在深圳设立办事处。紫鲸互联以“为新经济体护航“为企业使命，致力于APP定制开发业务与APP运营推广全案服务。";
  h =  [MCToolsManage heightforString:str andWidth:w fontSize:14];
    UILabel * lbl =[[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    lbl.text = str;
    lbl.numberOfLines =0;
    lbl.font =[UIFont systemFontOfSize:14];
    [self.contentView addSubview:lbl];
    
    y+=h + 10;
    h = MCAdaptiveH(750, 420, Main_Screen_Width);
    
    UIImageView * img =[[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    img.image =[UIImage imageNamed:@"bg_def_424"];
    
    [self.contentView addSubview:img];
    
    
    
    
    
    
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
