//
//  UIEasyTableViewCell.h
//  EasyBaseVC
//
//  Created by Easer on 2018/5/2.
//  Copyright © 2018年 EasyGoing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIEasyTableViewCell : UITableViewCell
@property (nonatomic, copy) id model;
@property (nonatomic, copy) id userInfo;
- (BOOL)refreshModel:(id)model withUserInfo:(id)userInfo;
-(CGFloat)cellHeight;
@end
