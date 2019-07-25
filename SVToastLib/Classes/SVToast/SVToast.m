//
//  SVToast.m
//  Pods-SVToastLib_Example
//
//  Created by keymon on 2019/7/23.
//

#import "SVToast.h"

#import "SVProgressHUD.h"

static CGFloat const kDuration = 1.5;
static CGFloat const kRadius = 8;

@implementation SVToast

+ (void)showLoading:(NSString *)loading {
    [SVProgressHUD resetToDefaultConfig];
    
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    [SVProgressHUD setDefaultDirection:SVProgressHUDLayoutDirectionHorizontal];
    [SVProgressHUD setCornerRadius:kRadius];
    [SVProgressHUD setForegroundColor:[UIColor whiteColor]];
    [SVProgressHUD setBackgroundColor:[UIColor colorWithRed:32/255.0 green:35/255.0 blue:33/255.0 alpha:1]];
    [SVProgressHUD setDefaultAnimationType:SVProgressHUDAnimationTypeNative];
    [SVProgressHUD setActivityIndicatorTransformScale:0.7];
    
    [SVProgressHUD showWithStatus:loading];
}

+ (void)showSuccess:(NSString *)success {
    [self showSuccess:success dismiss:nil];
}

+ (void)showError:(NSString *)error {
    [self showError:error dismiss:nil];
}

+ (void)showWarning:(NSString *)warning {
    [self showWarning:warning dismiss:nil];
}

+ (void)showSuccess:(NSString *)success dismiss:(dispatch_block_t)dismiss
{
    [SVProgressHUD resetToDefaultConfig];
    
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    [SVProgressHUD setDefaultDirection:SVProgressHUDLayoutDirectionHorizontal];
    [SVProgressHUD setCornerRadius:kRadius];
    [SVProgressHUD setForegroundColor:[UIColor whiteColor]];
    //    [SVProgressHUD setMinimumSize:CGSizeMake(realValue6H(220), realValue6H(220))];
    [SVProgressHUD setBackgroundColor:[UIColor colorWithRed:32/255.0 green:35/255.0 blue:33/255.0 alpha:1]];
    [SVProgressHUD setImageViewSize:CGSizeMake(25, 25)];
    [SVProgressHUD showImage:[UIImage imageNamed:@"toast_icon_success"] status:success];
    
    [SVProgressHUD dismissWithDelay:kDuration completion:^{
        if (dismiss) {
            dismiss();
        }
    }];
}

+ (void)showError:(NSString *)error dismiss:(dispatch_block_t)dismiss
{
    [SVProgressHUD resetToDefaultConfig];
    
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    [SVProgressHUD setDefaultDirection:SVProgressHUDLayoutDirectionHorizontal];
    [SVProgressHUD setCornerRadius:kRadius];
    [SVProgressHUD setForegroundColor:[UIColor whiteColor]];
    //    [SVProgressHUD setMinimumSize:CGSizeMake(realValue6H(220), realValue6H(220))];
    [SVProgressHUD setBackgroundColor:[UIColor colorWithRed:32/255.0 green:35/255.0 blue:33/255.0 alpha:1]];
    [SVProgressHUD setImageViewSize:CGSizeMake(25, 25)];
    [SVProgressHUD showImage:[UIImage imageNamed:@"toast_icon_error"] status:error];
    
    [SVProgressHUD dismissWithDelay:kDuration completion:^{
        if (dismiss) {
            dismiss();
        }
    }];
}

+ (void)showWarning:(NSString *)warning dismiss:(dispatch_block_t)dismiss
{
    [SVProgressHUD resetToDefaultConfig];
    
    //    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    [SVProgressHUD setDefaultDirection:SVProgressHUDLayoutDirectionHorizontal];
    [SVProgressHUD setCornerRadius:kRadius];
    [SVProgressHUD setForegroundColor:[UIColor whiteColor]];
    //    [SVProgressHUD setMinimumSize:CGSizeMake(realValue6H(220), realValue6H(220))];
    [SVProgressHUD setBackgroundColor:[UIColor colorWithRed:32/255.0 green:35/255.0 blue:33/255.0 alpha:1]];
    [SVProgressHUD setImageViewSize:CGSizeMake(25, 25)];
    [SVProgressHUD showImage:[UIImage imageNamed:@"toast_icon_info"] status:warning];
    
    [SVProgressHUD dismissWithDelay:2 completion:^{
        if (dismiss) {
            dismiss();
        }
    }];
}

+ (void)dismiss {
    [SVProgressHUD dismiss];
}

+ (void)dismissAfterDelay:(CGFloat)delay {
    [SVProgressHUD dismissWithDelay:delay];
}

+ (void)dismissAfterDelay:(CGFloat)delay completion:(dispatch_block_t)completion
{
    [SVProgressHUD dismissWithDelay:delay completion:^{
        if (completion) {
            completion();
        }
    }];
}

@end

