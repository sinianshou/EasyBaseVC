//
//  UIEasyCollectionViewCell.h
//  EasyBaseVC
//
//  Created by Easer on 2018/5/3.
//  Copyright © 2018年 EasyGoing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIEasyCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) id model;
@property (nonatomic, strong) id userInfo;
@property (weak, nonatomic) UICollectionView *collectionView;

- (BOOL)refreshModel:(id)model withUserInfo:(id)userInfo;
- (void)clear;
@end
