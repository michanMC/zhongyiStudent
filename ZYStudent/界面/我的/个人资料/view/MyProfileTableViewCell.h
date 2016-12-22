//
//  MyProfileTableViewCell.h
//  MCZhongYi
//
//  Created by MC on 2016/12/6.
//  Copyright © 2016年 MC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyProfileTableViewCell : UITableViewCell
@property(nonatomic,strong)UILabel * titleLbl;
@property(nonatomic,strong)UILabel * titleSubLbl;

@property(nonatomic,strong)UIImageView * headerImgview;
-(void)prepareUI1;
-(void)prepareUI2;
@property(nonatomic,strong)HCSStarRatingView* starRatingView;


-(void)prepareUI3;

@property(nonatomic,strong)NSArray * identifArray;
-(void)prepareUI4;

@end
