//
//  UIButton+imageTitle.m
//  FYCategory
//
//  Created by wang on 2019/3/15.
//  Copyright © 2019 wang. All rights reserved.
//

#import "UIButton+imageTitle.h"

@implementation UIButton (imageTitle)

-(void)layoutButtonWithEdgeInsetsStyle:(buttonEdgeInsetsStyle)style imageTitleSpace:(CGFloat)space {
    //1.得到imageView和titleLabel 的宽，高
    CGFloat imageWidth = self.imageView.frame.size.width;
    CGFloat imageHeight = self.imageView.frame.size.height;
    
    CGFloat labelWidth = 0.0;
    CGFloat labelHeight = 0.0;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
        //由于iOS8中titleLabel的size为0，用下面的这种设置
        labelWidth = self.titleLabel.intrinsicContentSize.width;
        labelHeight = self.titleLabel.intrinsicContentSize.height;
    }else {
        labelWidth = self.titleLabel.frame.size.width;
        labelHeight = self.titleLabel.frame.size.height;
    }
    
    //2.声明全局的imageEdgeInsets和labelEdgeINsets
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;
    
    //3.根据style和space 得到imageEdgeInsets和labelEdgeInsets的值
    switch (style) {
        case buttonEdgeInsetsStyleTop: {
            imageEdgeInsets = UIEdgeInsetsMake(-labelHeight-space/2.0, 0, 0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(-imageWidth *2,imageWidth,-imageHeight-space/2.0,0);
        }
            break;
        case buttonEdgeInsetsStyleLeft: {
            imageEdgeInsets = UIEdgeInsetsMake(0, -space/2.0, 0,space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0,space/2.0,0,-space/2.0);
        }
            break;
        case buttonEdgeInsetsStyleBottom: {
            imageEdgeInsets = UIEdgeInsetsMake(0,0, -labelHeight - space/2.0,-labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(-imageHeight -space/2.0,-imageWidth,0,0);
        }
            break;
            
        case buttonEdgeInsetsStyleRight: {
            imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth+space/2.0,0,-labelWidth-space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWidth-space/2.0,0,imageWidth+space/2.0);
        }
            break;
            
        default:
            break;
    }
    // 4.赋值
    self.titleEdgeInsets = labelEdgeInsets;
    self.imageEdgeInsets = imageEdgeInsets;
}

@end
