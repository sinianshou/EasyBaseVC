//
//  UIEasyViewController.m
//  EasyBaseVC
//
//  Created by Easer on 2018/5/2.
//  Copyright © 2018年 EasyGoing. All rights reserved.
//

#import "UIEasyViewController.h"

#import "EasyConstant.h"

@interface UIEasyViewController ()

@end

@implementation UIEasyViewController

-(void)addNavigationBackButtonWithTitle:(NSString *)backTitle{
    if (self.navigationController) {
        if (backTitle == nil) {
            NSString * titleKey =Easy_BackBn_Title;
            backTitle = NSEasyBaseLocalizableString(titleKey);
        }
        UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:backTitle style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
        self.navigationItem.backBarButtonItem = item;
    }
}
-(void)backAction{
    
}

-(void)addNavigationSaveButton{
    if (self.navigationController) {
        NSString * titleKey =Easy_SaveBn_Title;
        NSString *title = NSEasyBaseLocalizableString(titleKey);
        UIBarButtonItem *item =[[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector(saveAction)];
        
        NSArray *arr = self.navigationItem.rightBarButtonItems;
        if (arr.count>0) {
            arr = [arr arrayByAddingObject:item];
        }else{
            arr = @[item];
        }
        self.navigationItem.rightBarButtonItems = arr;
    }
}
-(void)saveAction{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
