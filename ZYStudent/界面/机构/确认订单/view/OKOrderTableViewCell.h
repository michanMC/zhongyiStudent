//
//  OKOrderTableViewCell.h
//  ZYStudent
//
//  Created by MC on 2016/12/15.
//  Copyright © 2016年 MC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OKOrderTableViewCell : UITableViewCell


-(void)prepareUI1;
-(void)prepareUI2;



@property(nonatomic,strong)UITextField * phoneText;
-(void)prepareUI3;



@property(nonatomic,strong)UIImageView * headImgview;
@property(nonatomic,strong)UILabel * nameLbl;

-(void)prepareUI4;


@end
