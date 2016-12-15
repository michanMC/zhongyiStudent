//
//  ViewController.m
//  ZYStudent
//
//  Created by MC on 2016/12/12.
//  Copyright © 2016年 MC. All rights reserved.
//

#import "ViewController.h"
#import "LogInViewController.h"
#import "MainTableViewController.h"
@interface ViewController ()
{
    
    
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self prepareUI];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)prepareUI{
    
    
    MainTableViewController * root = [[MainTableViewController alloc]init];
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    appDelegate.window.rootViewController = root;

    
    
    
//    LogInViewController * root = [[LogInViewController alloc]init];
//    
//    MCNavViewController * nv = [[MCNavViewController alloc]initWithRootViewController:root];
//    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//    appDelegate.window.rootViewController = nv;
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
