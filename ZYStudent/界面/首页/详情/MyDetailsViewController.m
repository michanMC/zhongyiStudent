//
//  MyDetailsViewController.m
//  ZYStudent
//
//  Created by MC on 2016/12/14.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "MyDetailsViewController.h"
#import "MyDetailsTableViewCell.h"
@interface MyDetailsViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    
    UITableView * _tableView;
    
    
    
}

@end

@implementation MyDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self prepareUI];
    // Do any additional setup after loading the view.
}
-(void)prepareUI{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, Main_Screen_Width, Main_Screen_Height - 64) style:UITableViewStyleGrouped];
    _tableView.delegate =self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = [UIColor whiteColor];
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (_indexCtl) {
        return 2;
    }
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.001;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        return 60;
    }
    
    
    if (_indexCtl) {//动态
        if (indexPath.row == 1) {
            CGFloat x = 15;
            CGFloat y = 8;
            CGFloat w = Main_Screen_Width -x - 10;
            CGFloat h = 20;
            
            NSString * str = @"今天今天今天今天今天今天今天今天今天今天今天今天今天今天今天今天今天今天今天";
            h = [MCToolsManage heightforString:str andWidth:w fontSize:14];
            
            w = (w - 10)/3;
            y =0;
            CGFloat ih = w;
            NSInteger count = 9;
            for (NSInteger i = 0; i < count; i++) {
                if ((i == 2||i == 5)&&count != 2&&count !=5) {
                    ih +=(w - 10)/3+5;
                    
                }
                else
                {
                }
                
            }
            
        return    y + h + 8 + ih + 25;
 
        }
    }
    
    
    if(indexPath.row == 1){
        return 24  + 40 -0.5;
    }
    if(indexPath.row == 2){
        
        CGFloat x = 15;
        CGFloat y = 8;
        CGFloat w = Main_Screen_Width -x - 10;
        CGFloat h = 20;
        
        NSString * str = @"今天今天今天今天今天今天今天今天今天今天今天今天今天今天今天今天今天今天今天";
        h = [MCToolsManage heightforString:str andWidth:w fontSize:14];
        
        w = (w - 10)/3;
        y =0;
       CGFloat ih = w;
        NSInteger count = 9;
        for (NSInteger i = 0; i < count; i++) {
            if ((i == 2||i == 5)&&count != 2&&count !=5) {
                ih +=(w - 10)/3+5;
                
            }
            else
            {
            }
            
        }
  
        
        
     return    y + h + 8 + ih + 25;
    }

    return 44;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString * cellid = @"MyDetailsTableViewCell";
    
    MyDetailsTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell =[[MyDetailsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    if (indexPath.row == 0) {
        [cell prepareUI1];
        return cell;
    }
    if (_indexCtl) {
        if (indexPath.row == 1) {
            [cell prepareUI3];
            return cell;
        }
    }
    
    
    
    if (indexPath.row == 1) {
        [cell prepareUI2];
        return cell;
    }
    if (indexPath.row == 2) {
        [cell prepareUI3];
        return cell;
    }


    

    
    return [[UITableViewCell alloc]init];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
