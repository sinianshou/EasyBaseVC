//
//  UIEasyTableView.h
//  EasyBaseVC
//
//  Created by Easer on 2018/5/9.
//  Copyright © 2018年 EasyGoing. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UIEasyTableView;
@class MJRefreshHeader;
@class MJRefreshFooter;

@protocol UIEasyTableViewRefreshDelegate<NSObject>
@optional
- (MJRefreshHeader*)refreshHeader;  
- (MJRefreshFooter*)refreshFooter;
/** 需要在data更新完成后调用tableView的finishUploadingDataAction方法 */
- (void)refreshDataWithTableView:(UIEasyTableView*)tableView;
/** 需要在data更新完成后调用tableView的finishUploadingDataAction方法 */
- (void)loadMoreDataWithTableView:(UIEasyTableView*)tableView;
@end

@interface UIEasyTableView : UITableView
@property (nonatomic, weak) id<UIEasyTableViewRefreshDelegate> refreshDelegate;
/*是否可以下拉刷新*/
@property (nonatomic, assign) BOOL isCouldRefresh;
/*是否可以上拉加载*/
@property (nonatomic, assign) BOOL isCouldLoadMore;
/*数据更新结束后需要调用该方法来收回刷新控件*/
- (void)finishUploadingData;
@end
