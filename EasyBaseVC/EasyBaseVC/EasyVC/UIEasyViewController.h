//
//  UIEasyViewController.h
//  EasyBaseVC
//
//  Created by Easer on 2018/5/2.
//  Copyright © 2018年 EasyGoing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIEasyViewController : UIViewController

@property (nonatomic, copy)  void (^finishBlock)(id result);

-(void)addNavigationBackButtonWithTitle:(NSString *)backTitle;
-(void)backAction;
-(void)addNavigationSaveButton;
-(void)saveAction;

@end
