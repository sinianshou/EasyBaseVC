;//
//  UIEasyTableViewController.m
//  EasyBaseVC
//
//  Created by Easer on 2018/5/2.
//  Copyright © 2018年 EasyGoing. All rights reserved.
//

#import "UIEasyTableViewController.h"

#import "EasyConstant.h"
#import "UIEasyTableView.h"
#import "UIEasyTableViewCell.h"

@interface UIEasyTableViewController ()<UITableViewDelegate, UITableViewDataSource>{
    NSMutableArray * _dataSource_MutableArr;
    NSMutableDictionary * _dataSource_MutableDic;
}

@property (nonatomic, strong) UIView *topView;
@property (nonatomic, strong) UIEasyTableView *tableView;
//@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *bottomView;
@end

@implementation UIEasyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置topview frame
    if (self.topView) {
        if (![self.view.subviews containsObject:self.topView]) {
            [self.view addSubview:self.topView];
        }
        [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.topView.mas_bottom);
        }];
        CGFloat topHeight = CGRectGetHeight(self.topView.bounds)?:44.0;
        [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.width.equalTo(self.view);
            make.height.mas_equalTo(topHeight);
        }];
    }else{
        [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view);
        }];
    }
    //设置bottomView frame
    if (self.bottomView) {
        if (![self.view.subviews containsObject:self.bottomView]) {
            [self.view addSubview:self.bottomView];
        }
        [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self.bottomView.mas_top);
        }];
        CGFloat bottomHeight = CGRectGetHeight(self.bottomView.bounds)?:44.0;
        [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.width.equalTo(self.view);
            make.height.mas_equalTo(bottomHeight);
        }];
    }else{
        [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.view);
        }];
    }
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.width.equalTo(self.view);
        make.height.mas_greaterThanOrEqualTo(0.1);
    }];
    
    self.tableView.estimatedSectionHeaderHeight = 10;
    self.tableView.estimatedSectionFooterHeight = 10;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view delegate

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (self.cellAnimationType) {
        case UIEasyTableCellAnimationTypeNone:
            break;
        case UIEasyTableCellAnimationTypeInsertion:
            [self AnimationOfInsertingCell:cell forRowAtIndexPath:indexPath intoTableView:tableView];
            break;
    }
}
//@required
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UIEasyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.reuseIdentifier];
    if (cell == nil) {
        cell = [[UIEasyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:self.reuseIdentifier];
    }
    //配置 cell
    return cell;
}
- (CGFloat)tableView:(UITableView* )tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0)
        return CGFLOAT_MIN;
    return 15;
}

- (CGFloat)tableView:(UITableView* )tableView heightForFooterInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}

#pragma mark - Table view cell animations
- (void)AnimationOfInsertingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath intoTableView:(UITableView *)tableView{
    switch (indexPath.row%2) {
        case 0://设置Cell的动画效果为3D效果
            cell.layer.transform = CATransform3DMakeTranslation(cell.bounds.size.width, 0, 0);
            break;
        case 1:
            cell.layer.transform = CATransform3DMakeTranslation(-cell.bounds.size.width, 0, 0);
            break;
    }
    [UIView animateWithDuration:0.3 animations:^{
        cell.layer.transform = CATransform3DIdentity;
    }];
}
#pragma mark ---- Setter
//-(void)setDataSource_MutableArr:(NSMutableArray *)dataSource_MutableArr{
//    if ([dataSource_MutableArr isKindOfClass:[NSArray class]]) {
//        dataSource_MutableArr = [dataSource_MutableArr mutableCopy];
//    }
//
//    _dataSource_MutableArr = dataSource_MutableArr;
//}
//-(void)setDataSource_MutableDic:(NSMutableDictionary *)dataSource_MutableDic{
//    if ([dataSource_MutableDic isKindOfClass:[NSDictionary class]]) {
//        dataSource_MutableDic = [dataSource_MutableDic mutableCopy];
//    }
//    _dataSource_MutableDic = dataSource_MutableDic;
//}

#pragma mark ---- Getter
-(NSString *)reuseIdentifier{
    if (_reuseIdentifier == nil) {
        _reuseIdentifier = @"UIEasyTableViewCell";
    }
    return _reuseIdentifier;
}
-(NSMutableArray *)dataSource_MutableArr{
    if (!_dataSource_MutableArr) {
        _dataSource_MutableArr = [NSMutableArray array];
    }
    return _dataSource_MutableArr;
}
-(NSMutableDictionary *)dataSource_MutableDic{
    if (!_dataSource_MutableDic) {
        _dataSource_MutableDic = [NSMutableDictionary dictionary];
    }
    return _dataSource_MutableDic;
}
-(UIEasyTableView *)tableView{
    if (!_tableView) {
        self.tableViewStyle = UITableViewStyleGrouped;
        UIEasyTableView *temp = [[UIEasyTableView alloc] initWithFrame:CGRectZero style:self.tableViewStyle];
        _tableView = temp;
        self.automaticallyAdjustsScrollViewInsets = NO; //Easy_待fix：添加版本判断
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
    }
    if (![self.view.subviews containsObject:_tableView]) {
        [self.view addSubview:_tableView];
    }
    return _tableView;
}


@end
