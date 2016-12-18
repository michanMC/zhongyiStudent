//
//  PayViewTableViewCell.h
//  ZYStudent
//
//  Created by MC on 2016/12/17.
//  Copyright © 2016年 MC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PayViewTableViewCell : UITableViewCell

@property(nonatomic,strong)UILabel * titleLbl;
@property(nonatomic,strong)UIImageView * imgview;
@property(nonatomic,strong)UIImageView * selectimg;

-(void)prepareUI;

@end
