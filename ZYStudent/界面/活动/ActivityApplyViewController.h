//
//  ActivityApplyViewController.h
//  ZYStudent
//
//  Created by MC on 2016/12/18.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "BaseViewController.h"
#import "ZJScrollPageViewDelegate.h"
#import "UIViewController+ZJScrollPageController.h"

@interface ActivityApplyViewController : BaseViewController<ZJScrollPageViewChildVcDelegate>

@property(nonatomic,assign)NSInteger stateindex;//1报名中  2已结束 4未开始 3进行中
@end
