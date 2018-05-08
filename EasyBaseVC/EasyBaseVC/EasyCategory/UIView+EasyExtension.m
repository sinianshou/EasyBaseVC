//
//  UIView+EasyExtension.m
//  EasyBaseVC
//
//  Created by Easer on 2018/5/2.
//  Copyright © 2018年 EasyGoing. All rights reserved.
//

#import "UIView+EasyExtension.h"

#import "EasyConstant.h"
@implementation UIView (EasyExtension)

#pragma mark ---- activityIndicatorView
- (void)easy_showLoadingStateView{
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        UIActivityIndicatorView *activityIndicatorView = [self easy_LoadingStateView];
        [self layoutIfNeeded];
        [activityIndicatorView startAnimating];
    }];
}
- (void)easy_dismissLoadingStateView{
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        UIActivityIndicatorView *activityIndicatorView = [self easy_LoadingStateView];
        [activityIndicatorView stopAnimating];
    }];
}

static const char *easyActivityIndicatorViewListKey = "EasyMethodList";
- (UIActivityIndicatorView *)easy_LoadingStateView{
    UIActivityIndicatorView *activityIndicatorView = objc_getAssociatedObject(self, easyActivityIndicatorViewListKey);
    if (activityIndicatorView == nil) {
        [self easy_SetLoadingStateView];
        activityIndicatorView = objc_getAssociatedObject(self, easyActivityIndicatorViewListKey);
    }
    return activityIndicatorView;
}
- (void)easy_SetLoadingStateView{
    [self layoutIfNeeded];
    UIActivityIndicatorView *activityIndicatorView=[[UIActivityIndicatorView alloc]initWithFrame:self.bounds];
    UIActivityIndicatorViewStyle stype = UIActivityIndicatorViewStyleWhiteLarge;
    if (CGRectGetWidth(self.bounds)<=100 && CGRectGetWidth(self.bounds)<=100) {
        stype = UIActivityIndicatorViewStyleWhite;
    }
    [activityIndicatorView setActivityIndicatorViewStyle:stype];
    [activityIndicatorView setBackgroundColor:[UIColor colorWithWhite:0.5 alpha:0.8]];
    [self addSubview:activityIndicatorView];
    Easy_WeakSelf(weakSelf);
    [activityIndicatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf);
        make.width.equalTo(weakSelf);
        make.left.equalTo(weakSelf);
        make.height.equalTo(weakSelf);
    }];
    objc_setAssociatedObject(self, easyActivityIndicatorViewListKey, activityIndicatorView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}



#pragma mark ---- add line
- (void)easy_addTopLineWithColor:(UIColor*)color{
    UIView *line = [self easy_creatViewWithColor:color];
    [self addSubview:line];
    __weak __typeof(&*self)weakSelf = self;
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(weakSelf);
        make.height.mas_equalTo(1);
    }];
}
- (void)easy_addBottomLineWithColor:(UIColor*)color{
    UIView *line = [self easy_creatViewWithColor:color];
    [self addSubview:line];
    __weak __typeof(&*self)weakSelf = self;
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(weakSelf);
        make.height.mas_equalTo(1);
    }];
}
- (UIView*)easy_creatViewWithColor:(UIColor*)color{
    if (!color) {
        color = [UIColor lightGrayColor];
    }
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = color;
    return view;
}


#pragma mark ---- ObserveNotificationCenterForKeyboardChangeFrame
- (void)easy_ObserveNotificationCenterForKeyboardChangeFrameWithTargetView:(UIView*)targetView{
    if (!targetView) {
        NSLog(@"%s :\n targetView is %@ \n targetView.superview is %@", __func__, targetView, targetView.superview);
        return;
    }
    [self easy_SetKeyboardTargetView:targetView];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(easy_KeyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
}
- (void)easy_KeyboardWillChangeFrame:(NSNotification*)aNotification{
    CGRect keyBoardEndRect=[[[aNotification userInfo]objectForKey:UIKeyboardFrameEndUserInfoKey]CGRectValue];
    NSTimeInterval animalInterval=[[[aNotification userInfo]objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    NSValue *targetRectValue = [self easy_KeyboardTargetViewOriginalRectValue];
    if (!targetRectValue) {
        NSLog(@"targetRectValue is %@", targetRectValue);
        return;
    }
    
    if (CGRectIntersectsRect(targetRectValue.CGRectValue, keyBoardEndRect)) {
        //键盘与target相交
        CGFloat translation = CGRectGetMinY(keyBoardEndRect) - CGRectGetMaxY([self easy_KeyboardTargetViewOriginalRectValue].CGRectValue);
        [UIView animateWithDuration:animalInterval animations:^{
            self.transform = CGAffineTransformMakeTranslation(0, translation);
        }];
    }else if (!CGAffineTransformIsIdentity(self.transform)){
        //键盘与target不相交
        [UIView animateWithDuration:animalInterval animations:^{
            self.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            [self easy_SetKeyboardTargetViewOriginalRectValue:nil];
        }];
    }
}
static const char *easyKeyboardTargetViewKey = "EasyKTV";
- (UIView*)easy_KeyboardTargetView{
    UIView* view = objc_getAssociatedObject(self, easyKeyboardTargetViewKey);
    return view;
}
- (void)easy_SetKeyboardTargetView:(UIView*)view{
    objc_setAssociatedObject(self, easyKeyboardTargetViewKey, view, OBJC_ASSOCIATION_ASSIGN);
}
static const char *easyKeyboardTargetViewOriginalRect = "EasyKTVRect";
- (NSValue*)easy_KeyboardTargetViewOriginalRectValue{
    NSValue* rectValue = objc_getAssociatedObject(self, easyKeyboardTargetViewOriginalRect);
    if (!rectValue) {
        UIView* targetView = [self easy_KeyboardTargetView];
        if (targetView) {
            UIApplication *sharedApp = [UIApplication sharedApplication];
            CGRect targetRect = [targetView.superview convertRect:targetView.frame toView:sharedApp.keyWindow];
            NSValue *value = [NSValue valueWithCGRect:targetRect];
            [self easy_SetKeyboardTargetViewOriginalRectValue:value];
            rectValue = value;
        }
    }
    return rectValue;
}

- (void)easy_SetKeyboardTargetViewOriginalRectValue:(NSValue*)rectValue{
    objc_setAssociatedObject(self, easyKeyboardTargetViewOriginalRect, rectValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end
