//
//  ViewController.m
//  EasyBaseVC
//
//  Created by Easer on 2018/5/2.
//  Copyright © 2018年 EasyGoing. All rights reserved.
//

#import "ViewController.h"
#import "EasyBase.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *bn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    bn.backgroundColor = Easy_RandomColor;
    [self.view addSubview:bn];
    [bn addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)test{
    UIEasyCollectionViewController *vc = [[UIEasyCollectionViewController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
