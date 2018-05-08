//
//  UIEasyCollectionViewController.h
//  EasyBaseVC
//
//  Created by Easer on 2018/5/3.
//  Copyright © 2018年 EasyGoing. All rights reserved.
//

#import "UIEasyViewController.h"

@interface UIEasyCollectionViewController : UIEasyViewController

@property (nonatomic, copy) NSString * reuseIdentifier;

@property (nonatomic, copy) NSMutableArray * dataSource_MutableArr;
@property (nonatomic, copy) NSMutableDictionary * dataSource_MutableDic;

-(void)setTopView:(UIView *)topView;
-(void)setBottomView:(UIView *)bottomView;
-(UIView *)topView;
-(UIView *)bottomView;
-(UICollectionView *)collectionView;
@end
