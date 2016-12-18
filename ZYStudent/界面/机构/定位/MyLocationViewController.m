//
//  MyLocationViewController.m
//  ZYStudent
//
//  Created by MC on 2016/12/18.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "MyLocationViewController.h"

@interface MyLocationViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    
    
    UITableView *_tableView;
    
    
    NSArray *_data_Array;
    
}

@end

@implementation MyLocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"定位";
    _data_Array = @[@"a",@"b",@"c",@"d"];
    [self prepareUI];
    
    // Do any additional setup after loading the view.
}
-(void)prepareUI{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, Main_Screen_Width, Main_Screen_Height - 64) style:UITableViewStyleGrouped];
    _tableView.delegate =self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    [self prepareHeadView];
    
}
-(void)prepareHeadView{
    
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, 44)];
    _tableView.tableHeaderView = view;
    view.backgroundColor =[UIColor whiteColor];
    
    UILabel * lbl =[[UILabel alloc]initWithFrame:CGRectMake(10, 0, Main_Screen_Width - 10, 44)];
    lbl.text = @"当前定位城市:广州";
    lbl.font =[UIFont systemFontOfSize:14];
    [view addSubview:lbl];
    
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return _data_Array.count;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;//arr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 25;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return 44;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, 25)];
    view.backgroundColor = AppMCBgCOLOR;//[UIColor groupTableViewBackgroundColor];
    UILabel * lbl = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 40, 25)];
//    lbl.text = _nameKeyArray[section];
//    //判断是不是字母开头的
//    BOOL isA = [self pipeizimu:lbl.text];
//    if (!isA) {
//        lbl.text = @"#";
//    }
    
    lbl.text =_data_Array[section];
    lbl.font = [UIFont systemFontOfSize:14];
    [view addSubview:lbl];
    // lbl.backgroundColor = [UIColor blackColor];
    return view;
}
-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
//    BOOL isA = [self pipeizimu:_nameKeyArray[section]];
//    if (isA) {
//        return _nameKeyArray[section];
//        
//    }
    
//    return @"#";
    return _data_Array[section];
}
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
//    return _nameKeyArray;
    return _data_Array;

    //    return @[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z",@"#"];
}
-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    NSLog(@"%d--%@",index,title);
//    return  [_nameKeyArray indexOfObject:title];
    return  [_data_Array indexOfObject:title];

    
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    static NSString * cellid = @"UITableViewCell";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    
//    [cell prepareUI];
    cell.textLabel.text = @"广州";
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    return cell;
    
    
    return [[UITableViewCell alloc]init];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self toPopVC];
    
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
