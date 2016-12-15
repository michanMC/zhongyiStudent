//
//  ComViewTableViewCell.h
//  MCZhongYi
//
//  Created by MC on 2016/12/7.
//  Copyright © 2016年 MC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ComViewTableViewCell : UITableViewCell



@property(nonatomic,strong)UIButton * headerBtn;
@property(nonatomic,strong)UILabel * nameLbl;
@property(nonatomic,strong)HCSStarRatingView *starRatingView;
-(void)prepareUI;

@end
