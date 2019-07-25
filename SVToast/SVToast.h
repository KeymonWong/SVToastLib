//
//  SVToast.h
//  Pods-SVToastLib_Example
//
//  Created by keymon on 2019/7/23.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface SVToast : NSObject

/** 接口请求时用，水平排列，菊花 + 文本，不会自动消失 */
+ (void)showLoading:(NSString *)loading;

/** 成功提示时用，水平排列，成功图片 + 文本，1.5s自动消失 */
+ (void)showSuccess:(NSString *)success;

/** 错误提示时用，水平排列，错误图片 + 文本，1.5s自动消失 */
+ (void)showError:(NSString *)error;

/** 警告提示时用，水平排列，警告图片 + 文本，2s自动消失，不带mask */
+ (void)showWarning:(NSString *)warning;

/** 成功提示时用，水平排列，成功图片 + 文本，带消失的回调，1.5s自动消失 */
+ (void)showSuccess:(NSString *)success dismiss:(nullable dispatch_block_t)dismiss;

/** 错误提示时用，水平排列，错误图片 + 文本，带消失的回调，1.5s自动消失 */
+ (void)showError:(NSString *)error dismiss:(nullable dispatch_block_t)dismiss;

/** 警告提示时用，水平排列，警告图片 + 文本，带消失的回调，2s自动消失，不带mask */
+ (void)showWarning:(NSString *)warning dismiss:(nullable dispatch_block_t)dismiss;


/*** 下述消失的方法和上面的 +showLoading: 成对使用 ***/

/** 消失 */
+ (void)dismiss;

/** 延时几秒之后消失 */
+ (void)dismissAfterDelay:(CGFloat)delay;

/** 延时几秒之后消失，带回调 */
+ (void)dismissAfterDelay:(CGFloat)delay completion:(nullable dispatch_block_t)completion;

@end

NS_ASSUME_NONNULL_END
