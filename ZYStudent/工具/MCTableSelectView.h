//
//  MCTableSelectView.h
//  ZYStudent
//
//  Created by MC on 2016/12/18.
//  Copyright © 2016年 MC. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol MCTableSelectDelegate <NSObject>

//-(void)MCscreenselsctDic:(NSMutableDictionary*)selectDic;
-(void)MCTableSelecthidden;

@end


@interface MCTableSelectView : UIView
@property(nonatomic,weak)id<MCTableSelectDelegate>deldagate;

@property(nonatomic,strong)NSArray * dataArray;
- (void)showInWindow;



@end
