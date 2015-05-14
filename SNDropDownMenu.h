//
//  SNDropDownMenu.h
//  SNWF
//
//  Created by MJ on 15/4/23.
//  Copyright (c) 2015年 TJ. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^CompleteHandlerBlock) (NSInteger selectIndex,NSString *selectTitle);
/**
 *  顶部弹出下拉菜单
 */
@interface SNDropDownMenu : UIView
{
    CompleteHandlerBlock myCompleteHandler;
}
+ (SNDropDownMenu *)shareInstance;
/**
 *  顶部弹出下拉菜单
 *
 *  @param baseView        父视图
 *  @param titleArray      按钮的标题数组
 *  @param completeHandler 回调
 */
+ (void)showInView:(UIView *)baseView andButtonTitle:(NSArray *)titleArray completeHandlerBlock:(CompleteHandlerBlock)completeHandler ;
/**
 *  移除view
 */
+ (void)removeView;




@end
