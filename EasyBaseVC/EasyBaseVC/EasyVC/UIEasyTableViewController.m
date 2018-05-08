//
//  UIEasyTableViewController.m
//  EasyBaseVC
//
//  Created by Easer on 2018/5/2.
//  Copyright © 2018年 EasyGoing. All rights reserved.
//

#import "UIEasyTableViewController.h"

#import "EasyConstant.h"
@interface UIEasyTableViewController ()<UITableViewDelegate, UITableViewDataSource>{
    NSMutableArray * _dataSource_MutableArr;
    NSMutableDictionary * _dataSource_MutableDic;
}

@property (nonatomic, strong) UIView *topView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *bottomView;
@end

@implementation UIEasyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat topOffset = 0.00;
    CGFloat bottomOffset = 0.00;
    
    UINavigationController *navigationVC = self.navigationController;
    UITabBarController *tabbarVC = self.tabBarController;
    if (navigationVC != nil) {
        
        topOffset = CGRectGetMaxY(navigationVC.navigationBar.frame);
        topOffset = 64.0;
        if (tabbarVC == nil) {
            tabbarVC = navigationVC.tabBarController;
        }
    }
    if (tabbarVC != nil) {
        bottomOffset = CGRectGetHeight(tabbarVC.tabBar.frame);
    }
    
    CGRect safeAreaRect = CGRectMake(0.00, topOffset, self.view.frame.size.width, self.view.frame.size.height-topOffset - bottomOffset);
    self.tableView.frame = safeAreaRect;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //设置topview frame
    if (self.topView) {
        if (![self.view.subviews containsObject:self.topView]) {
            [self.view addSubview:self.topView];
        }
        self.topView.translatesAutoresizingMaskIntoConstraints = YES;
        self.tableView.translatesAutoresizingMaskIntoConstraints = YES;
        CGRect topViewRect = self.topView.bounds;
        CGRect tableViewRect = self.tableView.frame;
        self.topView.frame = CGRectMake(tableViewRect.origin.x, tableViewRect.origin.y, tableViewRect.size.width, topViewRect.size.height);
        self.tableView.frame = CGRectMake(tableViewRect.origin.x, self.topView.frame.origin.y + topViewRect.size.height, tableViewRect.size.width, tableViewRect.size.height - (self.topView.frame.origin.y + topViewRect.size.height));
    }
    //设置bottomView frame
    if (self.bottomView) {
        if (![self.view.subviews containsObject:self.bottomView]) {
            [self.view addSubview:self.bottomView];
        }
        self.bottomView.translatesAutoresizingMaskIntoConstraints = YES;
        self.tableView.translatesAutoresizingMaskIntoConstraints = YES;
        CGRect bottomViewRect = self.bottomView.bounds;
        CGRect tableViewRect = self.tableView.frame;
        self.bottomView.frame = CGRectMake(tableViewRect.origin.x, tableViewRect.origin.y + tableViewRect.size.height - bottomViewRect.size.height, tableViewRect.size.width, bottomViewRect.size.height);
        self.tableView.frame = CGRectMake(tableViewRect.origin.x, tableViewRect.origin.y, tableViewRect.size.width, tableViewRect.size.height - bottomViewRect.size.height);
    }
    
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
    switch (self.CellAnimationType) {
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.reuseIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:self.reuseIdentifier];
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
-(UITableView *)tableView{
    if (_tableView == nil) {
        UITableView *temp = [[UITableView alloc] initWithFrame:CGRectZero style:self.tableViewStyle];
        _tableView = temp;
        _tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, CGFLOAT_MIN)];
        [self.view addSubview:_tableView];
        self.automaticallyAdjustsScrollViewInsets = NO; //Easy_待fix：添加版本判断
        _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
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
