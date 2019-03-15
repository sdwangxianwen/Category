//
//  UIButton+imageTitle.h
//  FYCategory
//
//  Created by wang on 2019/3/15.
//  Copyright © 2019 wang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger,buttonEdgeInsetsStyle){
    buttonEdgeInsetsStyleTop,     //image在上，label 在下
    buttonEdgeInsetsStyleLeft,   //image在左，label在右
    buttonEdgeInsetsStyleBottom, //image在下，label 在上
    buttonEdgeInsetsStyleRight,  //image在右,label在左
};

@interface UIButton (imageTitle)

/**
 * 设置button的titleLabel和imageView的布局样式，及间距
 *
 * @params style titleLabel和imageView 的布局样式
 * @params space titleLabel和imageView 的间距
 *
 */
-(void)layoutButtonWithEdgeInsetsStyle:(buttonEdgeInsetsStyle)style imageTitleSpace:(CGFloat)space;

@end

NS_ASSUME_NONNULL_END
