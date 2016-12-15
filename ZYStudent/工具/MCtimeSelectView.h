//
//  MCtimeSelectView.h
//  MCZhongYi
//
//  Created by MC on 2016/12/6.
//  Copyright © 2016年 MC. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MCtimeSelectDelegate <NSObject>

//-(void)MCscreenselsctDic:(NSMutableDictionary*)selectDic;
-(void)MCtimeSelecthidden;

@end





@interface MCtimeSelectView : UIView

@property(nonatomic,weak)id<MCtimeSelectDelegate>deldagate;

@property(nonatomic,strong)NSMutableArray * yeararray;
@property(nonatomic,strong)NSMutableArray * montharray;
@property(nonatomic,strong)NSMutableArray * dayarray;




- (void)showInWindow;

@end
