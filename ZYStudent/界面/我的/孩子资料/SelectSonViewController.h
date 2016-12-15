//
//  SelectSonViewController.h
//  ZYStudent
//
//  Created by MC on 2016/12/15.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "BaseViewController.h"


@protocol SelectSondelegare <NSObject>

-(void)selectSon;

@end



@interface SelectSonViewController : BaseViewController
@property(weak,nonatomic)id<SelectSondelegare>delegate;
@end
