//
//  PubliShrouteViewController.m
//  ZYStudent
//
//  Created by MC on 2016/12/15.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "PubliShrouteViewController.h"
#import "MCtimeSelectView.h"
#import "UIPlaceHolderTextView.h"
#import "ZYQAssetPickerController.h"

@interface PubliShrouteViewController ()<MCtimeSelectDelegate,UIActionSheetDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,ZYQAssetPickerControllerDelegate>
{
    UILabel *_ShrouteTimeLbl;
    
    UILabel *_RemindTimeLbl;
    MCtimeSelectView *  SelectView;
    
    
    NSMutableArray * _imgArray;
    UIView * _bgView;

    UILabel * _imgCountLbl;


}

@end

@implementation PubliShrouteViewController
-(void)actionfb{
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"行程发布";
    [self prepareUI];
    self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc]initWithTitle:@"发布" style:UIBarButtonItemStylePlain target:self action:@selector(actionfb)];

    // Do any additional setup after loading the view.
}
-(void)prepareUI{
    
    CGFloat lw = [MCToolsManage heightforString:@"行程时间" andHeight:44 fontSize:14];
    
    CGFloat x = 15;
    CGFloat y = 74;
    CGFloat w = Main_Screen_Width - 2*x;
    CGFloat h = 44;
    UIView * view =[[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    view.backgroundColor =[UIColor whiteColor];
    ViewBorderRadius(view, 3, 1, [UIColor groupTableViewBackgroundColor]);
    [self.view addSubview:view];
    
    UILabel * lbl =[[UILabel alloc]initWithFrame:CGRectMake(10, 0, lw, 44)];
    lbl.text = @"行程时间";
    lbl.font =[UIFont systemFontOfSize:14];
    [view addSubview:lbl];
    
    _ShrouteTimeLbl = [[UILabel alloc]initWithFrame:CGRectMake(10+lw+10, 0, view.mj_w - 20-20 -10-lw , 44)];
    _ShrouteTimeLbl.text = @"请选择行程安排的时间";
    _ShrouteTimeLbl.font = [UIFont systemFontOfSize:14];
    _ShrouteTimeLbl.textColor = [UIColor lightGrayColor];
    [view addSubview:_ShrouteTimeLbl];

    
    UIImageView * imgview =[[UIImageView alloc]initWithFrame:CGRectMake(view.mj_w - 10 - 20, 12, 20, 20)];
    imgview.image =[UIImage imageNamed:@"btn_next-arrow"];
    [view addSubview:imgview];
    
    UIButton * btn1 =[[UIButton alloc]initWithFrame:CGRectMake(0, 0, view.mj_w, 44)];
    [btn1 addTarget:self action:@selector(actionshruo) forControlEvents:1<<6];
//    btn1.backgroundColor =[UIColor redColor];
    [view addSubview:btn1];

    
    

    
    
    
    
    
    y+=h + 10;
    view =[[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    view.backgroundColor =[UIColor whiteColor];
    ViewBorderRadius(view, 3, 1, [UIColor groupTableViewBackgroundColor]);
    [self.view addSubview:view];
    lbl =[[UILabel alloc]initWithFrame:CGRectMake(10, 0, lw, 44)];
    lbl.text = @"提醒时间";
    lbl.font =[UIFont systemFontOfSize:14];
    [view addSubview:lbl];
    
    _RemindTimeLbl = [[UILabel alloc]initWithFrame:CGRectMake(10+lw+10, 0, view.mj_w - 20-20 -10-lw , 44)];
    _RemindTimeLbl.text = @"请选择提醒的时间";
    _RemindTimeLbl.font = [UIFont systemFontOfSize:14];
    _RemindTimeLbl.textColor = [UIColor lightGrayColor];
    [view addSubview:_RemindTimeLbl];
    
    
    imgview =[[UIImageView alloc]initWithFrame:CGRectMake(view.mj_w - 10 - 20, 12, 20, 20)];
    imgview.image =[UIImage imageNamed:@"btn_next-arrow"];
    [view addSubview:imgview];
    
    UIButton * btn2 =[[UIButton alloc]initWithFrame:CGRectMake(0, 0, view.mj_w, 44)];
    [btn2 addTarget:self action:@selector(actionrem) forControlEvents:1<<6];
    
    [view addSubview:btn2];

    
    
    
    _imgArray = [NSMutableArray array];

    x= 15;
    y +=h + 10;
    w = Main_Screen_Width - 30;
    CGFloat imgw = w /5;
     h = 80 + imgw*2;

    _bgView = [[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    _bgView.backgroundColor = [UIColor whiteColor];
    ViewBorderRadius(_bgView, 5, 1, [UIColor groupTableViewBackgroundColor]);
    
    [self.view addSubview:_bgView];
    
    x=5;
    w = _bgView.mj_w -x - 5;
    y =5;
    h = 75;
    UIPlaceHolderTextView * TextView =[[UIPlaceHolderTextView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    TextView.placeholder = @"请输入课程总结，限100字";
    TextView.font = [UIFont systemFontOfSize:14];
    [_bgView addSubview:TextView];
    
    
    y +=h;
    x = 0;
    w = _bgView.mj_w/ 5;
    h = w;
    
    for (NSInteger i = 0; i < 9; i++) {
        UIView * view = [[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
        [_bgView addSubview:view];
        
        UIButton * imgviewBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 10, w - 20, h-20)];
        imgviewBtn.tag = i + 100;
        [imgviewBtn setImage:[UIImage imageNamed:@"list_add-pic"] forState:0];
        //def_pic88
        [imgviewBtn addTarget:self action:@selector(actionAddimg:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:imgviewBtn];
        UIButton * delebtn = [[UIButton alloc]initWithFrame:CGRectMake(w -20, 0, 20, 20)];
        [delebtn addTarget:self action:@selector(actiondeleimg:) forControlEvents:UIControlEventTouchUpInside];
        
        [delebtn setImage:[UIImage imageNamed:@"btn_wrong"] forState:0];
        [view addSubview:delebtn];
        delebtn.tag = 200+i;
        delebtn.hidden = YES;
        
        if (i != 0) {
            imgviewBtn.hidden = YES;
            
        }
        
        if (i == 4) {
            y +=h;
            x = 0;
        }
        else
            x += w;
        
        
    }
    
    
    _imgCountLbl = [[UILabel alloc]initWithFrame:CGRectMake(_bgView.mj_w - w -5, _bgView.mj_h - 20, w, 20)];
    _imgCountLbl.text = @"0/9张图片";
    _imgCountLbl.font = [UIFont systemFontOfSize:14];
    _imgCountLbl.textColor = [UIColor lightGrayColor];
    _imgCountLbl.textAlignment  = NSTextAlignmentRight;
    _imgCountLbl.adjustsFontSizeToFitWidth =YES;
    [_bgView addSubview:_imgCountLbl];

    
    
}
-(void)actionshruo{
    SelectView= [[MCtimeSelectView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, Main_Screen_Height)];
    SelectView.deldagate = self;
    [SelectView showInWindow];

    
}
-(void)actionrem{
    SelectView= [[MCtimeSelectView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, Main_Screen_Height)];
    SelectView.deldagate = self;
    [SelectView showInWindow];

    
}
-(void)MCtimeSelecthidden
{
    [SelectView removeFromSuperview];
    
}
#pragma mark-删除图片

-(void)actiondeleimg:(UIButton*)btn{
    
    NSInteger index = btn.tag - 200;
    
    if (index < _imgArray.count) {
        [_imgArray removeObjectAtIndex:index];
    }
    [self loadImgView:_imgArray];
    
    
}

#pragma mark-添加图片
-(void)actionAddimg:(UIButton*)btn{
    
    NSInteger index = btn.tag - 100;
    if (index<_imgArray.count) {
        return;
    }
    
    UIActionSheet *myActionSheet = [[UIActionSheet alloc]
                                    initWithTitle:nil
                                    delegate:self
                                    cancelButtonTitle:@"取消"
                                    destructiveButtonTitle:nil
                                    otherButtonTitles: @"从相册选择", @"拍照",nil];
    myActionSheet.tag = 4000;
    [myActionSheet showInView:self.view];
    
    
    
}
#pragma mark-选择从哪里拿照片
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if(buttonIndex==2) return;
    
    
    UIImagePickerControllerSourceType sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
    if(buttonIndex==1){//拍照
        sourceType=UIImagePickerControllerSourceTypeCamera;
        if (![UIImagePickerController isSourceTypeAvailable:sourceType]){
            kAlertMessage(@"检测到无效的摄像头设备");
            return ;
        }
        
        UIImagePickerController * picker = [[UIImagePickerController alloc]init];
        
        picker.delegate = self;
        picker.allowsEditing=YES;
        picker.sourceType=sourceType;
        picker.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        
        [self presentViewController:picker animated:YES completion:nil];
        
        
        
    }
    
    [self btnClick];
    
    
    
}
-(void)btnClick{
    
    NSInteger countnum =_imgArray.count;
    
    
    ZYQAssetPickerController *picker = [[ZYQAssetPickerController alloc] init];
    picker.maximumNumberOfSelection = 9 - countnum;
    picker.assetsFilter = [ALAssetsFilter allPhotos];
    picker.showEmptyGroups=NO;
    picker.delegate=self;
    picker.selectionFilter = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
        
        
        if ([[(ALAsset*)evaluatedObject valueForProperty:ALAssetPropertyType] isEqual:ALAssetTypeVideo]) {
            NSTimeInterval duration = [[(ALAsset*)evaluatedObject valueForProperty:ALAssetPropertyDuration] doubleValue];
            return duration >= (9 - countnum);
        } else {
            return YES;
        }
        
        
        
    }];
    
    [self presentViewController:picker animated:YES completion:NULL];
    
}
//图像选取器的委托方法，选完图片后回调该方法
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    UIImage *image=[info objectForKey:@"UIImagePickerControllerEditedImage"];
    
    //当图片不为空时显示图片并保存图片
    if (image != nil) {
        
        if (_imgArray.count<9) {
            [_imgArray addObject:image];
        }
        
        
    }
    [self loadImgView:_imgArray];
    
    
}

#pragma mark - ZYQAssetPickerController Delegate
-(void)assetPickerController:(ZYQAssetPickerController *)picker didFinishPickingAssets:(NSArray *)assets{
    
    NSLog(@"%ld",assets.count);
    
    for (ALAsset *asset in assets) {
        UIImage*  tempImg =[UIImage imageWithCGImage:asset.defaultRepresentation.fullScreenImage];
        if (_imgArray.count <9) {
            [_imgArray addObject:tempImg];
        }
    }
    
    [self loadImgView:_imgArray];
}


-(void)assetPickerControllerDidMaximum:(ZYQAssetPickerController *)picker{
    NSLog(@"到达上限");
}

#pragma mark-重新整理图片位置
-(void)loadImgView:(NSMutableArray*)imgarray{
    for (NSInteger i =0 ;i < 9; i++) {
        NSInteger imgindex = 100 + i;
        NSInteger deleindex = 200 + i;
        
        UIButton * imgBtn = [self.view viewWithTag:imgindex];
        UIButton * deleBtn = [self.view viewWithTag:deleindex];
        [imgBtn setImage:[UIImage imageNamed:@"list_add-pic"] forState:0];
        
        deleBtn.hidden = YES;
        imgBtn.hidden = YES;
        if (i == 0) {
            imgBtn.hidden = NO;
        }
        
    }
    
    
    
    for (NSInteger i =0 ;i < imgarray.count; i++) {
        UIImage * img =imgarray[i];
        NSInteger imgindex = 100 + i;
        NSInteger deleindex = 200 + i;
        
        UIButton * imgBtn = [self.view viewWithTag:imgindex];
        UIButton * deleBtn = [self.view viewWithTag:deleindex];
        [imgBtn setImage:img forState:0];
        deleBtn.hidden = NO;
        imgBtn.hidden = NO;
    }
    
    
    if (imgarray.count < 9) {
        NSInteger index = imgarray.count + 100;
        
        UIButton * imgBtn = [self.view viewWithTag:index];
        imgBtn.hidden = NO;
        
        
        
    }
    NSInteger count = _imgArray.count;
    NSString * countStr = [NSString stringWithFormat:@"%ld/9张图片",count];
    _imgCountLbl.text = countStr;//@"0/9张图片";
    
    
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
