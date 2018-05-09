//
//  UIEasyTableViewController.h
//  EasyBaseVC
//
//  Created by Easer on 2018/5/2.
//  Copyright © 2018年 EasyGoing. All rights reserved.
//

#import "UIEasyViewController.h"

typedef NS_ENUM(NSInteger, UIEasyTableCellAnimationType) {
    UIEasyTableCellAnimationTypeNone,//默认从0开始
    UIEasyTableCellAnimationTypeInsertion,
};

@interface UIEasyTableViewController : UIEasyViewController

@property (nonatomic, copy) NSString * reuseIdentifier;

@property (nonatomic, copy) NSMutableArray * dataSource_MutableArr;
@property (nonatomic, copy) NSMutableDictionary * dataSource_MutableDic;

@property (nonatomic, strong) id tempCell;
@property (nonatomic, assign) UIEasyTableCellAnimationType cellAnimationType;
@property (nonatomic, assign) UITableViewStyle tableViewStyle;

-(void)setTopView:(UIView *)topView;
-(void)setBottomView:(UIView *)bottomView;
-(UIView *)topView;
-(UIView *)bottomView;
-(UITableView *)tableView;
@end
