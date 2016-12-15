//
//  MCtimeSelectView.m
//  MCZhongYi
//
//  Created by MC on 2016/12/6.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "MCtimeSelectView.h"

@interface MCtimeSelectView ()<UIPickerViewDelegate,UIPickerViewDataSource>{
    MCIucencyView *_bgView;

//    UITableView * _yearTableView;
//    UITableView * _monthTableView;
//    UITableView * _dayTableView;
//
//    UITableView * _hourTableView;
//    UITableView * _minTableView;

    UILabel * _timeLbl;
    
    UIDatePicker * _yearDatePicker;
    UIDatePicker * _timeDatePicker;

    UIButton *_cancelBtn;
    UIButton *_OKBtn;

    
}
@property (nonatomic,assign) BOOL isLeapyear;//是否是闰年

@property (strong, nonatomic)  UIPickerView *datePickerView;

@property (nonatomic,strong) NSMutableArray *yearArray;

@property (nonatomic,strong) NSMutableArray *monthArray;

@property (nonatomic,strong) NSMutableArray *dayArray;

@end





@implementation MCtimeSelectView

-(instancetype)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    if (self) {
        _bgView = [[MCIucencyView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, frame.size.height)];
        [_bgView setBgViewColor:[UIColor blackColor]];
        [_bgView setBgViewAlpha:.5];
        [self addSubview:_bgView];

        CGFloat x = 30;
        CGFloat w = Main_Screen_Width - 60;
        CGFloat h = MCAdaptiveH(600, 596, w);
        CGFloat y = (Main_Screen_Height - h)/2;
        
        UIView * _wBgView = [[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
        
        _wBgView.backgroundColor = [UIColor whiteColor];
        [_bgView addSubview:_wBgView];
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(actionTap)];
        [_bgView addGestureRecognizer:tap];
        

        UIView * lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 40, w, 0.5)];
        lineView.backgroundColor = AppMCNACOLOR;
        [_wBgView addSubview:lineView];
        x = 5;
        y = 0;
        w = w - 2*x;
        h = 40;
        
        _timeLbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
        _timeLbl.textColor = [UIColor darkTextColor];
        _timeLbl.font = [UIFont systemFontOfSize:14];
        NSString * timeStr = [CommonUtil getDate:[NSDate date]];
        _timeLbl.text = timeStr;
        [_wBgView addSubview:_timeLbl];
        UITapGestureRecognizer * tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(actionTap2)];
        [_wBgView addGestureRecognizer:tap2];

        
        
        
        y +=h + 0.5 + 5;

        w = _wBgView.mj_w/3;
        h = 20;
        x = 0;
        UILabel * lbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
        lbl.text = @"年";
        lbl.textColor = [UIColor darkTextColor];
        lbl.font = [UIFont systemFontOfSize:14];
        lbl.textAlignment = NSTextAlignmentRight;
        [_wBgView addSubview:lbl];
        
        x += w;
        lbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
        lbl.text = @"月";
        lbl.textColor = [UIColor darkTextColor];
        lbl.font = [UIFont systemFontOfSize:14];
        lbl.textAlignment = NSTextAlignmentCenter;
        [_wBgView addSubview:lbl];
        
        
        x += w;
        lbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
        lbl.text = @"日";
        lbl.textColor = [UIColor darkTextColor];
        lbl.font = [UIFont systemFontOfSize:14];
//        lbl.textAlignment = NSTextAlignmentCenter;
        [_wBgView addSubview:lbl];
        //    初始化数据源
        self.yearArray = [NSMutableArray array];
        self.monthArray = [NSMutableArray array];
        self.dayArray = [NSMutableArray array];
        x = 0;
        w = _wBgView.mj_w;
        y = y +h + 5;
        h = 30*3+1;

        _yearDatePicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(x,y , w, h)];
        _yearDatePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh-CN"];
        // 设置时区
        [_yearDatePicker setTimeZone:[NSTimeZone localTimeZone]];
        // 设置当前显示时间
        [_yearDatePicker setDate:[NSDate date] animated:YES];
        // 设置显示最大时间（此处为当前时间）
        [_yearDatePicker setMaximumDate:[NSDate date]];
        // 设置UIDatePicker的显示模式
        _yearDatePicker.datePickerMode = UIDatePickerModeDate;//日期
        [_wBgView addSubview:_yearDatePicker];

        y += h + 10;
        _timeDatePicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(x,y , w, h)];
        _timeDatePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh-CN"];
        // 设置时区
        [_timeDatePicker setTimeZone:[NSTimeZone localTimeZone]];
        // 设置当前显示时间
        [_timeDatePicker setDate:[NSDate date] animated:YES];
        // 设置显示最大时间（此处为当前时间）
        [_timeDatePicker setMaximumDate:[NSDate date]];
        // 设置UIDatePicker的显示模式
        _timeDatePicker.datePickerMode = UIDatePickerModeTime;//日期
        [_wBgView addSubview:_timeDatePicker];

        
        y = _wBgView.mj_h - 40;
        w = _wBgView.mj_w/2;
        h = 40;
        x = 0;
        _cancelBtn = [[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
        _cancelBtn.backgroundColor = [UIColor lightGrayColor];
        [_cancelBtn setTitle:@"取消" forState:0];
        _cancelBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_cancelBtn setTitleColor:[UIColor grayColor] forState:0];
        [_cancelBtn addTarget:self action:@selector(actionCB) forControlEvents:UIControlEventTouchUpInside];
        [_wBgView addSubview:_cancelBtn];
        x +=w;
        _OKBtn = [[UIButton alloc]initWithFrame:CGRectMake(x, y, w, h)];
        _OKBtn.backgroundColor = AppMCNACOLOR;
        UIColor * tc = AppMCNATitleCOLOR;
        [_OKBtn setTitle:@"确定" forState:0];
        _OKBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_OKBtn setTitleColor:tc forState:0];
        [_wBgView addSubview:_OKBtn];
        [_OKBtn addTarget:self action:@selector(actionokB) forControlEvents:UIControlEventTouchUpInside];
        
        
    }
    return self;
    
}
-(void)actionCB{
    
    if (_deldagate) {
        [_deldagate MCtimeSelecthidden];
    }
    
    
}
-(void)actionokB{
    
    NSDate *date = _yearDatePicker.date;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd"];
     [dateFormatter stringFromDate:date];
    [self actionCB];
    
}

-(void)actionTap{
    [self actionCB];

}
-(void)actionTap2{
    
}



- (void)getDateDataSource{
    for (int i = 1970; i <= 9999; i++) {
        [self.yearArray addObject:[NSString stringWithFormat:@"%d",i]];
    }
    for (int i = 1; i<13; i++) {
        
        [self.monthArray addObject:[NSString stringWithFormat:@"%.2d",i]];
    }
    for (int i = 1; i<32; i++) {
        [self.dayArray addObject:[NSString stringWithFormat:@"%.2d",i]];
    }
}
#pragma mark --  UIPickerViewDataSource

/**
 *  返回有几个PickerView
 */
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    if (component == 0)
        
        return self.yearArray.count;
    
    else if (component ==1)
        
        return self.monthArray.count;
    
    else
        return self.dayArray.count;
    
}

#pragma mark --  UIPickerViewDelegate

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    if (component == 0) {
        if ((row+1970)%4==0) {
            self.isLeapyear = YES;
        }
        
        return [self.yearArray objectAtIndex:row];
        
    }
    else if (component == 1){
        if (self.isLeapyear) {
            if (row == 2) {
                
            }
        }
        
        return [self.monthArray objectAtIndex:row];
    }
    else if (component == 2)
        return [self.dayArray objectAtIndex:row];
    else
        return nil;
}




- (void)showInWindow{
    
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [app.window addSubview:self];
    
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
