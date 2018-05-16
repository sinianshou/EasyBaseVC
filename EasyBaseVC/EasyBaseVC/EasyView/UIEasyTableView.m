//
//  UIEasyTableView.m
//  EasyBaseVC
//
//  Created by Easer on 2018/5/9.
//  Copyright © 2018年 EasyGoing. All rights reserved.
//

#import "UIEasyTableView.h"
@interface UIEasyTableView ()<UIEasyTableViewRefreshDelegate>{
    /*是否可以下拉刷新*/
    BOOL _isCouldRefresh;
    /*是否可以上拉加载*/
    BOOL _isCouldLoadMore;
}

@end
@implementation UIEasyTableView
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        if (@available(iOS 11.0, *)) {
            self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
//        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.refreshDelegate = self;
    }
    return self;
}

#pragma mark ---- about refreshing 
- (void)refreshDataAction{
    if ([self.refreshDelegate respondsToSelector:@selector(refreshDataWithTableView:)]) {
        [self.refreshDelegate refreshDataWithTableView:self];
    }
}
- (void)loadMoreDataAction{
    if ([self.refreshDelegate respondsToSelector:@selector(loadMoreDataWithTableView:)]) {
        [self.refreshDelegate loadMoreDataWithTableView:self];
    }
}
- (void)finishUploadingData{
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        if (self.mj_header.isRefreshing) {
            [self.mj_header endRefreshing];
        }
        if (self.mj_footer.isRefreshing) {
            [self.mj_footer endRefreshing];
        }
    }];
}
#pragma mark ---- Setter
-(void)setIsCouldRefresh:(BOOL)isCouldRefresh{
    _isCouldRefresh = isCouldRefresh;
    if (_isCouldRefresh) {
        MJRefreshHeader *header = nil;
        id target = self;
        SEL action = @selector(refreshDataAction);
        if ([self.refreshDelegate respondsToSelector:@selector(refreshHeader)]) {
            header = [self.refreshDelegate refreshHeader];
            [header setRefreshingTarget:target refreshingAction:action];
        }
        if (!header || ![header isKindOfClass:[MJRefreshHeader class]]) {
            header = [MJRefreshNormalHeader headerWithRefreshingTarget:target refreshingAction:action];
            header.automaticallyChangeAlpha = YES;
        }
        self.mj_header = header;
    }else{
        self.mj_header = nil;
    }
}
-(void)setIsCouldLoadMore:(BOOL)isCouldLoadMore{
    _isCouldLoadMore = isCouldLoadMore;
    if (_isCouldLoadMore) {
        MJRefreshFooter *footer = nil;
        id target = self;
        SEL action = @selector(loadMoreDataAction);
        if ([self.refreshDelegate respondsToSelector:@selector(refreshFooter)]) {
            footer = [self.refreshDelegate refreshFooter];
            [footer setRefreshingTarget:target refreshingAction:action];
        }
        if (!footer || ![footer isKindOfClass:[MJRefreshFooter class]]) {
            footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:target refreshingAction:action];
            footer.automaticallyChangeAlpha = YES;
        }
        self.mj_footer = footer;
    }else{
        self.mj_footer = nil;
    };
}
#pragma mark ---- Getter
-(BOOL)isCouldRefresh{
    if (self.mj_header) {
        _isCouldRefresh = YES;
    }else{
        _isCouldRefresh = NO;
    }
    return _isCouldRefresh;
}
-(BOOL)isCouldLoadMore{
    if (self.mj_footer) {
        _isCouldLoadMore = YES;
    }else{
        _isCouldLoadMore = NO;
    }
    return _isCouldLoadMore;
}
#pragma mark - UIEasyTableViewRefreshDelegate
- (void)refreshDataWithTableView:(UIEasyTableView*)tableView{
    [tableView finishUploadingData];
}
- (void)loadMoreDataWithTableView:(UIEasyTableView*)tableView{
    [tableView finishUploadingData];
}
@end
