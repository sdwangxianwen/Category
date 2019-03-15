//
//  UIView+cornerRadious.m
//  FYCategory
//
//  Created by wang on 2019/3/15.
//  Copyright © 2019 wang. All rights reserved.
//

#import "UIView+cornerRadious.h"
#import <objc/runtime.h>

static const void *kborderLayerKey = &kborderLayerKey;

@implementation UIView (cornerRadious)

- (void)setCustomRectCorner:(UIRectCorner)corners radius:(CGFloat)radius{
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect: self.bounds
                                                   byRoundingCorners: corners
                                                         cornerRadii: CGSizeMake(radius, radius)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}
- (void)sn_ClipToCircle:(CGRect)frame borderColor:(UIColor *)borderColor borderWidth:(CGFloat)width{
    // 加入环形mask
    CGPathRef path = CGPathCreateWithEllipseInRect(frame, NULL);
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = frame;
    maskLayer.path = path;
    self.layer.mask = maskLayer;
    
    CAShapeLayer *borderLayer = [[CAShapeLayer alloc] init];
    borderLayer.path = path;
    
    CGPathRelease(path);
    
    borderLayer.strokeColor = borderColor.CGColor;
    borderLayer.fillColor = [UIColor clearColor].CGColor;
    borderLayer.frame = frame;
    borderLayer.lineWidth = width*2;
    
    if (!!self.borderLayer) {
        [self.borderLayer removeFromSuperlayer];
    }
    
    [self.layer addSublayer:borderLayer];
    self.borderLayer = borderLayer;
}

- (void)setBorderLayer:(CALayer *)borderLayer{
    objc_setAssociatedObject(self, kborderLayerKey, borderLayer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CAShapeLayer *)borderLayer{
    return objc_getAssociatedObject(self, kborderLayerKey);
}
@end
