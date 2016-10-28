//
//  MMCollapsibleLabel.m
//  Pods
//
//  Created by Ryosuke Ito on 10/28/16.
//
//

#import "MMCollapsibleLabel.h"

@interface MMCollapsibleLabel ()

@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *buttonContainerZeroHightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *labelBottomMarginConstraint;

@end

@implementation MMCollapsibleLabel {
@private
    UILabel *_truncatedLabel;
    UILabel *_untruncatedLabel;
}

#pragma mark - @property

- (NSString *)text {
    return _label.text;
}

- (void)setText:(NSString *)text {
    if (_label.text != text) {
        _label.text = text;
        [self setNeedsUpdateConstraints];
    } else {
        _label.text = text;
    }
}

- (UIFont *)font {
    return _label.font;
}

- (void)setFont:(UIFont *)font {
    _label.font = font;
}

- (UIColor *)textColor {
    return _label.textColor;
}

- (void)setTextColor:(UIColor *)textColor {
    _label.textColor = textColor;
}

- (UIColor *)shadowColor {
    return _label.shadowColor;
}

- (void)setShadowColor:(UIColor *)shadowColor {
    _label.shadowColor = shadowColor;
}

- (CGSize)shadowOffset {
    return _label.shadowOffset;
}

- (void)setShadowOffset:(CGSize)shadowOffset {
    _label.shadowOffset = shadowOffset;
}

- (NSTextAlignment)textAlignment {
    return _label.textAlignment;
}

- (void)setTextAlignment:(NSTextAlignment)textAlignment {
    _label.textAlignment = textAlignment;
}

- (NSLineBreakMode)lineBreakMode {
    return _label.lineBreakMode;
}

- (void)setLineBreakMode:(NSLineBreakMode)lineBreakMode {
    _label.lineBreakMode = lineBreakMode;
}

- (NSAttributedString *)attributedText {
    return _label.attributedText;
}

- (void)setAttributedText:(NSAttributedString *)attributedText {
    _label.attributedText = attributedText;
}

- (UIColor *)highlightedTextColor {
    return _label.highlightedTextColor;
}

- (void)setHighlightedTextColor:(UIColor *)highlightedTextColor {
    _label.highlightedTextColor = highlightedTextColor;
}

- (BOOL)isHighlighted {
    return _label.isHighlighted;
}

- (void)setHighlighted:(BOOL)highlighted {
    _label.highlighted = highlighted;
}

- (BOOL)isEnabled {
    return _label.isEnabled;
}

- (void)setEnabled:(BOOL)enabled {
    _label.enabled = enabled;
}

- (void)setNumberOfLines:(NSInteger)numberOfLines {
    if (_numberOfLines != numberOfLines) {
        _numberOfLines = numberOfLines;
        [self setNeedsUpdateConstraints];
        [self setNeedsLayout];
    } else {
        _numberOfLines = numberOfLines;
    }
}

- (BOOL)adjustsFontSizeToFitWidth {
    return _label.adjustsFontSizeToFitWidth;
}

- (void)setAdjustsFontSizeToFitWidth:(BOOL)adjustsFontSizeToFitWidth {
    _label.adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth;
}

- (UIBaselineAdjustment)baselineAdjustment {
    return _label.baselineAdjustment;
}

- (void)setBaselineAdjustment:(UIBaselineAdjustment)baselineAdjustment {
    _label.baselineAdjustment = baselineAdjustment;
}

- (CGFloat)minimumScaleFactor {
    return _label.minimumScaleFactor;
}

- (void)setMinimumScaleFactor:(CGFloat)minimumScaleFactor {
    _label.minimumScaleFactor = minimumScaleFactor;
}

- (BOOL)allowsDefaultTighteningForTruncation {
    return _label.allowsDefaultTighteningForTruncation;
}

- (void)setAllowsDefaultTighteningForTruncation:(BOOL)allowsDefaultTighteningForTruncation {
    _label.allowsDefaultTighteningForTruncation = allowsDefaultTighteningForTruncation;
}

- (UIEdgeInsets)buttonTitleEdgeInsets {
    return _button.titleEdgeInsets;
}

- (void)setButtonTitleEdgeInsets:(UIEdgeInsets)buttonTitleEdgeInsets {
    _button.titleEdgeInsets = buttonTitleEdgeInsets;
}

- (BOOL)reversesButtonTitleShadowWhenHighlighted {
    return _button.reversesTitleShadowWhenHighlighted;
}

- (void)setReversesButtonTitleShadowWhenHighlighted:(BOOL)reversesButtonTitleShadowWhenHighlighted {
    _button.reversesTitleShadowWhenHighlighted = reversesButtonTitleShadowWhenHighlighted;
}

- (BOOL)showsTouchWhenHighlighted {
    return _button.showsTouchWhenHighlighted;
}

- (void)setShowsTouchWhenHighlighted:(BOOL)showsTouchWhenHighlighted {
    _button.showsTouchWhenHighlighted = showsTouchWhenHighlighted;
}

- (UIColor *)tintColor {
    return _button.tintColor;
}

- (void)setTintColor:(UIColor *)tintColor {
    _button.tintColor = tintColor;
}

- (UIButtonType)buttonType {
    return _button.buttonType;
}

- (NSString *)currentButtonTitle {
    return _button.currentTitle;
}

- (UIColor *)currentButtonTitleColor {
    return _button.currentTitleColor;
}

- (UIColor *)currentButtonTitleShadowColor {
    return _button.currentTitleShadowColor;
}

- (UIImage *)currentButtonBackgroundImage {
    return _button.currentBackgroundImage;
}

- (UILabel *)buttonTitleLabel {
    return _button.titleLabel;
}

- (void)setCollapsed:(BOOL)collapsed {
    [self setCollapsed:collapsed animated:NO];
}

- (void)setShowButtonTitle:(NSString *)showButtonTitle {
    _showButtonTitle = showButtonTitle;
    if (_collapsed) {
        [_button setTitle:showButtonTitle forState:UIControlStateNormal];
    }
}

- (void)setHideButtonTitle:(NSString *)hideButtonTitle {
    _hideButtonTitle = hideButtonTitle;
    if (!_collapsed) {
        [_button setTitle:hideButtonTitle forState:UIControlStateNormal];
    }
}

#pragma mark - @public

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self configureSubviews];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self configureSubviews];
    }
    return self;
}

- (void)layoutSubviews {
    [self updateSubviews];
    [super layoutSubviews];
}

- (NSString *)buttonTitleForState:(UIControlState)state {
    return [_button titleForState:state];
}

- (UIColor *)buttonTitleColorForState:(UIControlState)state {
    return [_button titleColorForState:state];
}

- (UIColor *)buttonTitleShadowColorForState:(UIControlState)state {
    return [_button titleShadowColorForState:state];
}

- (UIImage *)buttonBackgroundImageForState:(UIControlState)state {
    return [_button backgroundImageForState:state];
}

- (void)updateConstraints {
    if ([self labelIsTruncated]) {
        _buttonContainerZeroHightConstraint.active = NO;
        _button.hidden = NO;
    } else {
        _buttonContainerZeroHightConstraint.active = YES;
        _button.hidden = YES;
    }
    [super updateConstraints];
}

- (void)setCollapsed:(BOOL)collapsed animated:(BOOL)animated {
    if (_collapsed != collapsed) {
        _collapsed = collapsed;
        if (animated) {
            __block NSLayoutConstraint *labelBottomMarginConstraint = _labelBottomMarginConstraint;
            labelBottomMarginConstraint.active = NO;
            [self updateSubviews];
            [self layoutIfNeeded];
            [UIView animateWithDuration:_animationDuration
                             animations:^{
                                 labelBottomMarginConstraint.active = YES;
                                 [self setNeedsLayout];
                                 [self layoutIfNeeded];
                             }];
        } else {
            [self setNeedsLayout];
        }
    }
}

#pragma mark - @private

- (IBAction)buttonDidPush:(UIButton *)sender {
    [self setCollapsed:!_collapsed animated:YES];
}

- (void)configureSubviews {
    UIView *contentView = [self loadViewFromBundle];
    contentView.frame = self.bounds;
    contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self addSubview:contentView];
    _contentView = contentView;
    _numberOfLines = 1;
    _showButtonTitle = @"Show";
    _hideButtonTitle = @"Hide";
    _animationDuration = 0.25;
    _truncatedLabel = [[UILabel alloc] init];
    _untruncatedLabel = [[UILabel alloc] init];
}

- (void)updateSubviews {
    if (_collapsed) {
        _label.numberOfLines = _numberOfLines;
        [_button setTitle:_showButtonTitle forState:UIControlStateNormal];
    } else {
        _label.numberOfLines = 0;
        [_button setTitle:_hideButtonTitle forState:UIControlStateNormal];
    }
}

- (UIView *)loadViewFromBundle {
    NSBundle *podBundle = [NSBundle bundleForClass:[self classForCoder]];
    NSURL *URL = [podBundle URLForResource:@"MMCollapsibleLabel" withExtension:@"bundle"];
    NSBundle *bundle = [NSBundle bundleWithURL:URL];
    return (UIView *)[[bundle loadNibNamed:@"MMCollapsibleLabel" owner:self options:nil] firstObject];
}

- (BOOL)labelIsTruncated {
    [self copyPropertyValuesFromLabel:_label toLabel:_truncatedLabel];
    _truncatedLabel.numberOfLines = _numberOfLines;
    [self copyPropertyValuesFromLabel:_label toLabel:_untruncatedLabel];
    _untruncatedLabel.numberOfLines = 0;
    CGSize referenceSize = CGSizeMake(_label.bounds.size.width, CGFLOAT_MAX);
    CGSize truncatedLabelSize = [_truncatedLabel sizeThatFits:referenceSize];
    CGSize untruncatedLabelSize = [_untruncatedLabel sizeThatFits:referenceSize];
    return truncatedLabelSize.height < untruncatedLabelSize.height;
}

- (void)copyPropertyValuesFromLabel:(UILabel *)fromLabel toLabel:(UILabel *)toLabel {
    // copy all property values related to truncation.
    toLabel.text = fromLabel.text;
    toLabel.font = fromLabel.font;
    toLabel.shadowColor = fromLabel.shadowColor;
    toLabel.shadowOffset = fromLabel.shadowOffset;
    toLabel.textAlignment = fromLabel.textAlignment;
    toLabel.lineBreakMode = fromLabel.lineBreakMode;
    toLabel.attributedText = fromLabel.attributedText;
    toLabel.enabled = fromLabel.isEnabled;
    toLabel.adjustsFontSizeToFitWidth = fromLabel.adjustsFontSizeToFitWidth;
    toLabel.baselineAdjustment = fromLabel.baselineAdjustment;
    toLabel.minimumScaleFactor = fromLabel.minimumScaleFactor;
    if (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_8_4) {
        toLabel.allowsDefaultTighteningForTruncation = fromLabel.allowsDefaultTighteningForTruncation;
    }
}

@end
