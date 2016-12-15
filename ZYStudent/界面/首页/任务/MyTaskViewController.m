//
//  MyTaskViewController.m
//  ZYStudent
//
//  Created by MC on 2016/12/15.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "MyTaskViewController.h"
#import "MyTaskViewCollectionViewCell.h"
#import "MyTaskHeaderCollectionViewCell.h"
#import "gradeViewController.h"

@interface MyTaskViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    UICollectionView *newCollectionView;
    UICollectionViewFlowLayout *flowLayout;
//    NSMutableArray *_dataArray;
 
    
    
}

@end

@implementation MyTaskViewController
-(void)actionr{
    
    gradeViewController *ctl =[[gradeViewController alloc]init];
    [self pushNewViewController:ctl];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"任务中心";
    [self prepareUI];
    self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc]initWithTitle:@"等级说明" style:UIBarButtonItemStylePlain target:self action:@selector(actionr)];
    // Do any additional setup after loading the view.
}
-(void)prepareUI{
    flowLayout = [[UICollectionViewFlowLayout alloc]init];
    
//    _dataArray = [NSMutableArray array];
    flowLayout.minimumInteritemSpacing = 8;
    flowLayout.minimumLineSpacing = 8;
    
    
    flowLayout.sectionInset = UIEdgeInsetsMake(8, 8, 8, 8);
    
    newCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, Main_Screen_Width, Main_Screen_Height - 64) collectionViewLayout:flowLayout];
    newCollectionView.delegate = self;
    newCollectionView.dataSource = self;
    newCollectionView.alwaysBounceVertical = YES;
    [newCollectionView registerClass:[MyTaskViewCollectionViewCell class] forCellWithReuseIdentifier:@"MyTaskViewCollectionViewCell"];
    [newCollectionView registerClass:[MyTaskHeaderCollectionViewCell class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView"];
    

    newCollectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:newCollectionView];

}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    //collectionView有多少的section
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 9;
}


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //item
    
    CGFloat h = MCAdaptiveH(750, 270, Main_Screen_Width);
    
    
    return CGSizeMake((Main_Screen_Width -24) / 2, h);
}
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader])
    {
        MyTaskHeaderCollectionViewCell *headView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"headerView" forIndexPath:indexPath];
        
        
        if (!headView){
            headView = [[MyTaskHeaderCollectionViewCell alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, 200)];
        }
        headView.backgroundColor = [UIColor whiteColor];
        [headView prepareUI];
        
                        return headView;
        }
    return [[UICollectionReusableView alloc]init];

}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
           return CGSizeMake(Main_Screen_Width, 200);
    
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MyTaskViewCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MyTaskViewCollectionViewCell" forIndexPath:indexPath];
    if (!cell)
    {
        cell = [[MyTaskViewCollectionViewCell alloc]init];
    }
    
    [cell prepareUI];
//    ViewRadius(cell.contentView, 3);
    return cell;
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
