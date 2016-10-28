//
//  MMCollapsibleLabel.h
//  Pods
//
//  Created by Ryosuke Ito on 10/28/16.
//
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN;

IB_DESIGNABLE
@interface MMCollapsibleLabel : UIView

// UILabel emulating properties
@property (nullable, nonatomic) IBInspectable NSString *text;
@property (null_resettable, nonatomic) IBInspectable UIFont *font;
@property (null_resettable, nonatomic) IBInspectable UIColor *textColor;
@property (nullable, nonatomic) IBInspectable UIColor *shadowColor;
@property (nonatomic) IBInspectable CGSize shadowOffset;
@property (nonatomic) IBInspectable NSTextAlignment textAlignment;
@property (nonatomic) IBInspectable NSLineBreakMode lineBreakMode;
@property (nullable, nonatomic) IBInspectable NSAttributedString *attributedText;
@property (nullable, nonatomic) IBInspectable UIColor *highlightedTextColor;
@property (nonatomic, getter=isHighlighted) IBInspectable BOOL highlighted;
@property (nonatomic, getter=isEnabled) IBInspectable BOOL enabled;
@property (nonatomic) IBInspectable NSInteger numberOfLines;
@property (nonatomic) IBInspectable BOOL adjustsFontSizeToFitWidth;
@property (nonatomic) IBInspectable UIBaselineAdjustment baselineAdjustment;
@property (nonatomic) IBInspectable CGFloat minimumScaleFactor;
@property (nonatomic) IBInspectable BOOL allowsDefaultTighteningForTruncation NS_AVAILABLE_IOS(9_0);

// UIButton emulating properties
@property (nonatomic) IBInspectable UIEdgeInsets buttonContentEdgeInsets;
@property (nonatomic) IBInspectable UIEdgeInsets buttonTitleEdgeInsets;
@property (nonatomic) IBInspectable BOOL reversesButtonTitleShadowWhenHighlighted;
@property (nonatomic) IBInspectable BOOL showsTouchWhenHighlighted;
@property (null_resettable, nonatomic) IBInspectable UIColor *tintColor;
@property (nonatomic, readonly) UIButtonType buttonType;
@property (nullable, nonatomic, readonly) NSString *currentButtonTitle;
@property (nonatomic, readonly) UIColor *currentButtonTitleColor;
@property (nullable, nonatomic, readonly) UIColor *currentButtonTitleShadowColor;
@property (nullable, nonatomic, readonly) UIImage *currentButtonBackgroundImage;
@property (nullable, nonatomic, readonly) UILabel *buttonTitleLabel;

// UIButton emulating methods
- (nullable NSString *)buttonTitleForState:(UIControlState)state;
- (nullable UIColor *)buttonTitleColorForState:(UIControlState)state;
- (nullable UIColor *)buttonTitleShadowColorForState:(UIControlState)state;
- (nullable UIImage *)buttonBackgroundImageForState:(UIControlState)state;

// MMCollapsibleLabel specific properties
@property (nonatomic, getter=isCollapsed) IBInspectable BOOL collapsed;
@property (null_resettable, nonatomic) IBInspectable NSString *showButtonTitle;
@property (null_resettable, nonatomic) IBInspectable NSString *hideButtonTitle;
@property (nonatomic) IBInspectable CGFloat animationDuration;

// MMCollapsibleLabel specific methods
- (void)setCollapsed:(BOOL)collapsed animated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END;
