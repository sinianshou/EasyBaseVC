//
//  UIView+EasyExtension.h
//  EasyBaseVC
//
//  Created by Easer on 2018/5/2.
//  Copyright © 2018年 EasyGoing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (EasyExtension)

#pragma mark ---- activityIndicatorView
- (void)easy_showLoadingStateView;
- (void)easy_dismissLoadingStateView;

#pragma mark ---- add line
- (void)easy_addTopLineWithColor:(UIColor*)color;
- (void)easy_addBottomLineWithColor:(UIColor*)color;

#pragma mark ---- ObserveNotificationCenterForKeyboardChangeFrame
- (void)easy_ObserveNotificationCenterForKeyboardChangeFrameWithTargetView:(UIView*)targetView;
@end
