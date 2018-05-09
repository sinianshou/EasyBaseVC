//
//  UIEasyCollectionViewController.m
//  EasyBaseVC
//
//  Created by Easer on 2018/5/3.
//  Copyright © 2018年 EasyGoing. All rights reserved.
//

#import "UIEasyCollectionViewController.h"
#import "UIEasyCollectionViewFlowLayout.h"
#import "UIEasyCollectionViewCell.h"

@interface UIEasyCollectionViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>{
    NSMutableArray * _dataSource_MutableArr;
    NSMutableDictionary * _dataSource_MutableDic;
}

@property (nonatomic, weak) UIView *topView;
@property (nonatomic, weak) UICollectionView *collectionView;
@property (nonatomic, strong) UICollectionViewLayout *collectionViewLayout;
@property (nonatomic, assign) Class registerClass;
@property (nonatomic, weak) UIView *bottomView;

@end

@implementation UIEasyCollectionViewController
- (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout*)layout registerClass:(Class)class
{
    self = [super init];
    if (self) {
        _collectionViewLayout = layout;
        _registerClass = class;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.topView) {
        if (![self.view.subviews containsObject:self.topView]) {
            [self.view addSubview:self.topView];
        }
        CGFloat height = CGRectGetHeight(self.topView.bounds)?:44.0f;
        [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.mas_equalTo(0);
            make.width.equalTo(self.view);
            make.height.mas_equalTo(height);
        }];
        [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.topView.mas_bottom);
        }];
    }else{
        [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
        }];
    }
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.width.equalTo(self.view);
        make.height.mas_greaterThanOrEqualTo(1);
    }];
    if (self.bottomView) {
        if (![self.view.subviews containsObject:self.bottomView]) {
            [self.view addSubview:self.bottomView];
        }
        CGFloat height = CGRectGetHeight(self.bottomView.bounds)?:44.0f;
        [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.mas_equalTo(0);
            make.width.equalTo(self.view);
            make.height.mas_equalTo(height);
        }];
        [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self.collectionView.mas_top);
        }];
    }else{
        [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(0);
        }];
    }
    
    // Register cell classes
    [self.collectionView registerClass:self.registerClass forCellWithReuseIdentifier:self.reuseIdentifier];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 0;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:self.reuseIdentifier forIndexPath:indexPath];
    cell.backgroundColor = Easy_RandomColor;
    // Configure the cell
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
 // Uncomment this method to specify if the specified item should be highlighted during tracking
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
 return YES;
 }
 */

/*
 // Uncomment this method to specify if the specified item should be selected
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
 return YES;
 }
 */

/*
 // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
 return NO;
 }
 
 - (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
 return NO;
 }
 
 - (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
 
 }
 */
#pragma mark ---- Getter
-(NSString *)reuseIdentifier{
    if (_reuseIdentifier == nil) {
        _reuseIdentifier = @"UIEasyCollectionViewCell";
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
-(UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionView *temp = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 10, 10) collectionViewLayout:self.collectionViewLayout];
        _collectionView = temp;
        [self.view addSubview:_collectionView];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
    }
    return _collectionView;
}
-(UICollectionViewLayout *)collectionViewLayout{
    if (!_collectionViewLayout) {
        _collectionViewLayout = [[UIEasyCollectionViewFlowLayout alloc] init];
    }
    return _collectionViewLayout;
}
-(Class)registerClass{
    if (!_registerClass) {
        _registerClass = [UIEasyCollectionViewCell class];
    }
    return _registerClass;
}
@end
