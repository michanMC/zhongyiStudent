//
//  MCTableSelectView.m
//  ZYStudent
//
//  Created by MC on 2016/12/18.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "MCTableSelectView.h"


@interface MCTableSelectView ()<UITableViewDelegate,UITableViewDataSource>{
    MCIucencyView *_bgView;
    UITableView * _tableView;
    
    
}

@end


@implementation MCTableSelectView
-(instancetype)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    if (self) {
        _bgView = [[MCIucencyView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, frame.size.height)];
        [_bgView setBgViewColor:[UIColor blackColor]];
        [_bgView setBgViewAlpha:.5];
        [self addSubview:_bgView];
        
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, frame.size.height) style:UITableViewStyleGrouped];
        _tableView.delegate =self;
        _tableView.dataSource = self;
        [_bgView addSubview:_tableView];
        _tableView.backgroundColor =[UIColor clearColor];
        _tableView.bounces = NO;
        UITapGestureRecognizer * tap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(actionCB)];
        [_tableView addGestureRecognizer:tap];
        
        
        
    }
    return self;
    
}
-(void)setDataArray:(NSMutableArray *)dataArray
{
    
    _dataArray= dataArray;
    [_tableView reloadData];
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.001;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString * cellid = @"UITableViewCell";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    if (_dataArray.count > indexPath.row) {
        cell.textLabel.text = _dataArray[indexPath.row];
        cell.textLabel.font = [UIFont systemFontOfSize:14];
    }
    
    return cell;
    

    
    
    return [[UITableViewCell alloc]init];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [self actionCB];
    
}
-(void)actionCB{
    
    if (_deldagate) {
        [_deldagate MCTableSelecthidden];
    }
    
    
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
