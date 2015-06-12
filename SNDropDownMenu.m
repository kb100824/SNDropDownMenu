//
//  SNDropDownMenu.m
//  SNWF
//
//  Created by MJ on 15/4/23.
//  Copyright (c) 2015年 TJ. All rights reserved.
//
#define kColumnCount 4
#define kItemHeight 30
#define kMarginY  5
#define KTopMarginY 5
#define KMarginX 5
#import "SNDropDownMenu.h"

@implementation SNDropDownMenu
{
    CGFloat totalHeight;
    
}
+ (SNDropDownMenu *)shareInstance
{
    static SNDropDownMenu *dropDownInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        dropDownInstance = [[SNDropDownMenu alloc]init];
        
    });
    return dropDownInstance;
    
}
- (instancetype)init
{
    if (self = [super init])
    {
        CGRect frect = CGRectZero;
        frect.size.width = SCREEN_WIDTH;
        self.frame = frect;
        self.backgroundColor = [UIColor whiteColor];
        self.alpha = 1;
    }
    return self;
    
}

- (void)showInView:(UIView *)baseView andButtonTitle:(NSArray *)titleArray completeHandlerBlock:(CompleteHandlerBlock)completeHandler;
{
    
    myCompleteHandler = completeHandler;
    [baseView addSubview:self];
    [self createSubViews:titleArray];
    [UIView animateWithDuration:1.0f delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        
        CGRect frect = self.frame;
        frect.size.height = totalHeight;
        frect.origin.y = 0.0f;
        self.frame = frect;
        
    } completion:^(BOOL finished) {
        
        
    }];
    
}
- (void)buttonAction:(UIButton *)sender
{
    if (myCompleteHandler)
    {
        myCompleteHandler(sender.tag,sender.titleLabel.text);
    }
    [self dismissView];
}

- (void)createSubViews :(NSArray *)titleArray
{
    CGFloat width = (self.bounds.size.width - (kColumnCount-3)-30) / (CGFloat)kColumnCount;
    
    for (int i = 0; i < titleArray.count; i++)
    {
        
        CGRect frect = CGRectZero;
        frect.origin.x = (i % kColumnCount) * (width + KMarginX)+10;
        frect.origin.y = (i / kColumnCount) * (kItemHeight + kMarginY)+KTopMarginY;
        frect.size.width = width;
        frect.size.height = kItemHeight;
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        //[btn setBackgroundColor:UIColorFromRGB(0xe8f4ff)];
        [btn setBackgroundImage:[UIImage imageNamed:@"localCity-05"] forState:UIControlStateNormal];
        // btn.contentMode = UIViewContentModeScaleAspectFit;
        [btn setFrame:frect];
        [btn setTitle:[NSString stringWithFormat:@"%@",titleArray[i]] forState:UIControlStateNormal];
        [btn setTitleColor:UIColorFromRGB(0x333333) forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTag: i];
        [self addSubview:btn];
        
    }
    
    NSInteger rowCount = ceilf((CGFloat)titleArray.count / kColumnCount);
    totalHeight = rowCount * kItemHeight + (rowCount-1)*10 ;
    CGRect frect = self.frame;
    frect.size.height = totalHeight;
    self.frame = frect;
}
- (void)dismissView
{
    [UIView animateWithDuration:1.0f delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        [self removeFromSuperview];
    } completion:^(BOOL finished) {
        
        
    }];
    
}
+ (void)showInView:(UIView *)baseView andButtonTitle:(NSArray *)titleArray completeHandlerBlock:(CompleteHandlerBlock)completeHandler
{
    [[SNDropDownMenu shareInstance]showInView:baseView andButtonTitle:titleArray completeHandlerBlock:completeHandler];
}
+ (void)removeView
{
    [[SNDropDownMenu shareInstance] dismissView];
}
@end
