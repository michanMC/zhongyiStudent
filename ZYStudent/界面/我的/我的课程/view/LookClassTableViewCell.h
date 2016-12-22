//
//  LookClassTableViewCell.h
//  MCZhongYi
//
//  Created by MC on 2016/12/9.
//  Copyright © 2016年 MC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LookClassTableViewCell : UITableViewCell

@property(nonatomic,strong)UILabel * titleLbl;

@property(nonatomic,strong)UIButton * tepyBtn;

-(void)prepareUI:(NSInteger)index; // 4 评价 5 查看评价

@end
