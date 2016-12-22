//
//  OrderViewTableViewCell.h
//  ZYStudent
//
//  Created by MC on 2016/12/20.
//  Copyright © 2016年 MC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderViewTableViewCell : UITableViewCell

@property(nonatomic,assign)NSInteger stateIndex;//1待付款  2已支付 3待评论 4已完成 5取消
-(void)prepareUI;
@property(nonatomic,strong)UIButton*stateBtn;


@end
