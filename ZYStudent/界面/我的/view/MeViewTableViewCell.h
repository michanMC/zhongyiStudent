//
//  MeViewTableViewCell.h
//  ZYStudent
//
//  Created by MC on 2016/12/19.
//  Copyright © 2016年 MC. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol MeViewTableDelegate <NSObject>

-(void)selectBtn:(UIButton*)btn;

@end




@interface MeViewTableViewCell : UITableViewCell

@property(nonatomic,weak)id<MeViewTableDelegate>delegate;
@property(nonatomic,assign)NSInteger  index;

@property(nonatomic,strong)NSArray * titleArray;
@property(nonatomic,strong)NSArray * imgArray;
-(void)prepareUI;
@end
