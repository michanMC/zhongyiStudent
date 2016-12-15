//
//  OrganTableViewCell.h
//  ZYStudent
//
//  Created by MC on 2016/12/14.
//  Copyright © 2016年 MC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrganTableViewCell : UITableViewCell


-(void)prepareUI1;
@property(nonatomic,strong)UIButton*headerBtn;
-(void)prepareUI2;


@property(nonatomic,strong)UIButton*OKBtn;
@property(nonatomic,strong)UIButton*cancelBtn;

-(void)prepareUI3;
-(void)prepareUI4;


@end
