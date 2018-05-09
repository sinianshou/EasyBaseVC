//
//  UIEasyCollectionViewFlowLayout.m
//  EasyBaseVC
//
//  Created by Easer on 2018/5/3.
//  Copyright © 2018年 EasyGoing. All rights reserved.
//

#import "UIEasyCollectionViewFlowLayout.h"

@implementation UIEasyCollectionViewFlowLayout
-(id)init
{
    self = [super init];
    if (self)
    {
        CGFloat leadSpacing = 10.0f;
        CGFloat minLineSpacing = 10.0f;
        CGFloat defaultColums = 4.0f;
        // 设置每个单元格的大小
        CGFloat screenWid = [UIScreen mainScreen].bounds.size.width;
        CGFloat itemWid = (screenWid - leadSpacing*2 -minLineSpacing*(defaultColums-1))/defaultColums;
        self.itemSize = CGSizeMake(itemWid,itemWid);
        // 设置该控件的滚动方向
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
        // 设置各分区上、下、左、右保留的空白区的大小
//        self.sectionInset = UIEdgeInsetsMake(0.0f, leadSpacing, 0.0f, leadSpacing);
        // 设置各单元格之间最小的行间距
        self.minimumLineSpacing = minLineSpacing;
        self.minimumInteritemSpacing = minLineSpacing;
    }
    return self;
}
// 该方法的返回值决定当UICollectionView的bounds改变时，是否需要重新布局
//- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)oldBounds
//{
//    // 返回YES表示需要重新布局
//    return YES;
//}
@end
