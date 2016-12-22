//
//  LeaveTypeTableViewCell.h
//  MCZhongYi
//
//  Created by MC on 2016/12/11.
//  Copyright © 2016年 MC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeaveTypeTableViewCell : UITableViewCell

@property(nonatomic,strong)UILabel * titelLbl;
@property(nonatomic,strong)UIImageView * seleimg;

-(void)prepareUI;

@end
