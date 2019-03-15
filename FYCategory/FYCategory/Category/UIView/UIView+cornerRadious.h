//
//  UIView+cornerRadious.h
//  FYCategory
//
//  Created by wang on 2019/3/15.
//  Copyright © 2019 wang. All rights reserved.
//切圆角

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (cornerRadious)

/**
 设置一个view的radius

 @param corners corner
 @param radius 角度
 */
- (void)setCustomRectCorner:(UIRectCorner)corners radius:(CGFloat)radius;

/*
 * 将会把一个view变成圆形，并将它描边, 因为没有使用view 的layer
 * 不要设置该view的layer 属性。
 */
- (void)sn_ClipToCircle:(CGRect)frame borderColor:(UIColor *)borderColor borderWidth:(CGFloat)width;

@property (nonatomic, strong, readonly)CAShapeLayer *borderLayer;

@end

NS_ASSUME_NONNULL_END
