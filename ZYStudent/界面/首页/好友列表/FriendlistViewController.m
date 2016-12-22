//
//  FriendlistViewController.m
//  ZYStudent
//
//  Created by MC on 2016/12/14.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "FriendlistViewController.h"
#import "FriendlistTableViewCell.h"
#import "MCCapacityView.h"
#import "MyQRcodeViewController.h"
#import "NewFriViewController.h"
#import "FriStateViewController.h"
@interface FriendlistViewController ()<UITableViewDelegate,UITableViewDataSource,MCCapacityViewDelegate>
{
    UITableView*_tableView;
    NSMutableArray *_data_Array;
    NSMutableArray *_nameKeyArray;

    MCCapacityView * _CapacityView;
    BOOL _isShowCapacity;

    
}

@end

@implementation FriendlistViewController
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self MCCapacityViewhidden];
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"好友列表";
    _data_Array = [NSMutableArray array];

    [self prepareUI];
    // Do any additional setup after loading the view.
}
-(void)prepareUI{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_menu"] style:UIBarButtonItemStylePlain target:self action:@selector(actionMenu)];
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, Main_Screen_Width, Main_Screen_Height - 64) style:UITableViewStyleGrouped];
    _tableView.delegate =self;
    _tableView.dataSource = self;
    _tableView.sectionIndexBackgroundColor=[UIColor clearColor];
    _tableView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:_tableView];

    NSArray * array = @[@"a",@"b",@"c",@"d",@"e",@"f",@"g"];

    NSMutableArray * arrayKey = [NSMutableArray array];

    for (NSString *str in array) {
        NSString * nameKey = [self firstCharactor:str];
        [arrayKey addObject:nameKey];
    }
    
    _data_Array = [self grouping:(NSMutableArray*)array NamekeyArray:arrayKey];

    [_tableView reloadData];
    [self prepareHeaderView];
    
    
    
    
}
-(void)prepareHeaderView{
    
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, 60)];
    
    _tableView.tableHeaderView = view;
    
    CGFloat x = 10;
    CGFloat y = 10;
    CGFloat w = 40;
    CGFloat h = w;
    UIImageView * imgview =[[UIImageView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    imgview.image =[UIImage imageNamed:@"def_user_120"];
    [view addSubview:imgview];
    
    
    x += w + 10;
    w = Main_Screen_Width - x ;
    h = 60;
    y = 0;
    
    UILabel * nameLbl = [[UILabel alloc]initWithFrame:CGRectMake(x, y, w, h)];
    nameLbl.text = @"新的朋友";
    nameLbl.font = [UIFont systemFontOfSize:16];
    [view addSubview:nameLbl];
    
    UIView * hongview = [[UIView alloc]initWithFrame:CGRectMake(x - 12.5, imgview.mj_y - 2.5, 5, 5)];
    hongview.backgroundColor = [UIColor redColor];
    ViewRadius(hongview, 5/2);
    [view addSubview:hongview];
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, 60)];
    [btn addTarget:self action:@selector(actionAddfri) forControlEvents:1<<6];
    [view addSubview:btn];

    
}
-(void)actionAddfri{
    
    NewFriViewController * ctl = [[NewFriViewController alloc]init];
    [self pushNewViewController:ctl];
}
-(void)actionMenu{
    
    if (_isShowCapacity) {
        _isShowCapacity = NO;
        [_CapacityView removeFromSuperview];
        
    }
    else
    {
        _isShowCapacity = YES;
        
        NSArray * array = [NSArray array];
        array = @[@"添加好友",@"我的二维码"];
        
        
        _CapacityView = [[MCCapacityView alloc]initWithFrame:CGRectMake(0, 64, Main_Screen_Width, Main_Screen_Height - 64) TitleArray:array];
        _CapacityView.delegate = self;
        
        [_CapacityView showInWindow];
        
    }
    
    
}
-(void)MCCapacityViewselsctTitle:(NSString *)titleDic
{
    [self MCCapacityViewhidden];
    
    if ([titleDic isEqualToString:@"添加好友"]) {
        
        
    }
    if ([titleDic isEqualToString:@"我的二维码"]) {
        MyQRcodeViewController * ctl =[[MyQRcodeViewController alloc]init];
        [self pushNewViewController:ctl];
    }
}
-(void)MCCapacityViewhidden
{
    _isShowCapacity = NO;
    [_CapacityView removeFromSuperview];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return _data_Array.count;

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray * arr = _data_Array[section];
    
    return 1;//arr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return 55;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, 30)];
    view.backgroundColor = AppMCBgCOLOR;//[UIColor groupTableViewBackgroundColor];
    UILabel * lbl = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 40, 30)];
        lbl.text = _nameKeyArray[section];
    //判断是不是字母开头的
    BOOL isA = [self pipeizimu:lbl.text];
    if (!isA) {
        lbl.text = @"#";
    }
    
    lbl.font = [UIFont systemFontOfSize:14];
    [view addSubview:lbl];
    // lbl.backgroundColor = [UIColor blackColor];
    return view;
}
-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    BOOL isA = [self pipeizimu:_nameKeyArray[section]];
    if (isA) {
        return _nameKeyArray[section];
        
    }
    
    return @"#";
}
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return _nameKeyArray;
    //    return @[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z",@"#"];
}
-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    NSLog(@"%d--%@",index,title);
    return  [_nameKeyArray indexOfObject:title];
    
    
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    static NSString * cellid = @"FriendlistTableViewCell";
    
    FriendlistTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell =[[FriendlistTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    
    [cell prepareUI];
    return cell;
    

    return [[UITableViewCell alloc]init];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    FriStateViewController * ctl =[[FriStateViewController alloc]init];
    [self pushNewViewController:ctl];
    
}





-(NSMutableArray*)grouping:(NSMutableArray*)array NamekeyArray:(NSMutableArray*)nameKeyArray{
    NSMutableArray *groupingArray =[NSMutableArray array];
    //字母排序
    _nameKeyArray = (NSMutableArray*)[nameKeyArray sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [obj1 compare:obj2 options:NSNumericSearch];
    }];
    NSInteger count = _nameKeyArray.count;
    NSMutableArray * mcarray = [[NSMutableArray alloc]initWithArray:_nameKeyArray];
    BOOL ishas = NO;
    for (int i = 0; i < mcarray.count; i++) {
        NSString * keys = mcarray[i];
        BOOL is_A = [self pipeizimu:keys];
        if (!is_A) {
            [mcarray removeObject:keys];
            ishas = YES;
            i --;
            if (i < 0) {
                i  = -1;
            }
            count--;
        }
        if (i == mcarray.count - 1) {
            if (ishas)
                [mcarray addObject:@"#"];
            break;
        }
    }
    NSLog(@"%@",mcarray);
    
    
    _nameKeyArray= [[NSMutableArray alloc]initWithArray:mcarray];
    
    NSMutableDictionary * dicArray = [NSMutableDictionary dictionary];
    for (NSString * keyStr in _nameKeyArray) {//根据字母创建各个数组
        NSMutableArray * arrayData = [NSMutableArray array];
        //判断是不是字母开头的
        BOOL isA = [self pipeizimu:keyStr];
        
        if (isA)
            [dicArray setObject:arrayData forKey:keyStr];
        else
            [dicArray setObject:arrayData forKey:@"#"];
        
        
    }
    
    for (NSString * strkey in array) {//为各个数组加载对应的对象
        NSLog(@">>>%@",strkey);
        //判断是不是字母开头的
        BOOL isA = [self pipeizimu:strkey];
        if (isA)
            [[dicArray objectForKey:strkey] addObject:strkey];
        else
            [[dicArray objectForKey:@"#"] addObject:strkey];
        
        
    }
    BOOL isjia = NO;
    for (NSString * keyStr in _nameKeyArray) {//从字典里分离出
        
        BOOL isA = [self pipeizimu:keyStr];
        NSArray * arr = [NSArray array];
        if (isA)
            arr =[dicArray objectForKey:keyStr];
        else{
            
            arr =[dicArray objectForKey:@"#"];
            if (!isjia){
                [groupingArray addObject:arr];
                // [_nameKeyArray addObject:@"#"];
                
            }
            isjia = YES;
            continue;
        }
        //        if (isjia) {
        //            continue;
        //        }
        
        [groupingArray addObject:arr];
    }
    NSLog(@">>>>%@",groupingArray);
    
    
    
    return groupingArray;
}
#pragma mark 正则表达式
-(BOOL)pipeizimu:(NSString *)str
{
    
    NSCharacterSet *disallowedCharacters = [[NSCharacterSet
                                             characterSetWithCharactersInString:@"QWERTYUIOPLKJHGFDSAZXCVBNMqwertyuioplkjhgfdsazxcvbnm "] invertedSet];
    NSRange foundRange = [str rangeOfCharacterFromSet:disallowedCharacters];
    if (foundRange.location != NSNotFound) {
        return NO;
    }
    return YES;
    
}
//获取拼音首字母(传入汉字字符串, 返回大写拼音首字母)
- (NSString *)firstCharactor:(NSString *)aString
{
    //转成了可变字符串
    NSMutableString *str = [NSMutableString stringWithString:aString];
    //先转换为带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformMandarinLatin,NO);
    //再转换为不带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformStripDiacritics,NO);
    //转化为大写拼音
    NSString *pinYin = [str capitalizedString];
    if (!pinYin.length) {
        pinYin = @"#";
    }
    //获取并返回首字母
    return [pinYin substringToIndex:1];
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
