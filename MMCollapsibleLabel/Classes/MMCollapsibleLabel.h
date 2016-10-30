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

/// ----------------------------------------------------------------------------
/// @name UILabel emulating properties
/// ----------------------------------------------------------------------------

/**
 * The text displayed by the label.
 */
@property (nullable, nonatomic) IBInspectable NSString *text;

/**
 * The font of the text.
 */
@property (null_resettable, nonatomic) IBInspectable UIFont *font;

/**
 * The color of the text.
 */
@property (null_resettable, nonatomic) IBInspectable UIColor *textColor;

/**
 * The shadow color of the text.
 */
@property (nullable, nonatomic) IBInspectable UIColor *shadowColor;

/**
 * The shadow offset (measured in points) for the text.
 */
@property (nonatomic) IBInspectable CGSize shadowOffset;

/**
 * The technique to use for aligning the text.
 */
@property (nonatomic) IBInspectable NSTextAlignment textAlignment;

/**
 * The technique to use for wrapping and truncating the label's text.
 */
@property (nonatomic) IBInspectable NSLineBreakMode lineBreakMode;

/**
 * The styled text displayed by the label.
 */
@property (nullable, nonatomic) IBInspectable NSAttributedString *attributedText;

/**
 * The highlight color applied to the label's text.
 */
@property (nullable, nonatomic) IBInspectable UIColor *highlightedTextColor;

/**
 * A Boolean value indicating whether the receiver should be drawn
 * with a highlight.
 */
@property (nonatomic, getter=isHighlighted) IBInspectable BOOL highlighted;

/**
 * The enabled state to use when drawing the label's text.
 */
@property (nonatomic, getter=isEnabled) IBInspectable BOOL enabled;

/**
 * The maximum number of lines to use for rendering text.
 */
@property (nonatomic) IBInspectable NSInteger numberOfLines;

/**
 * A Boolean value indicating whether the font size should be reduced
 * in order to fit the title string into the label’s bounding rectangle.
 */
@property (nonatomic) IBInspectable BOOL adjustsFontSizeToFitWidth;

/**
 * Controls how text baselines are adjusted
 * when text needs to shrink to fit in the label.
 */
@property (nonatomic) IBInspectable UIBaselineAdjustment baselineAdjustment;

/**
 * The minimum scale factor supported for the label’s text.
 */
@property (nonatomic) IBInspectable CGFloat minimumScaleFactor;

/**
 * A Boolean value indicating whether the label tightens text before truncating.
 */
@property (nonatomic) IBInspectable BOOL allowsDefaultTighteningForTruncation NS_AVAILABLE_IOS(9_0);

/// ----------------------------------------------------------------------------
/// @name UIButton emulating properties
/// ----------------------------------------------------------------------------

/**
 * The inset or outset margins for the rectangle
 * surrounding all of the button’s content.
 */
@property (nonatomic) IBInspectable UIEdgeInsets buttonContentEdgeInsets;

/**
 * The inset or outset margins for the rectangle around the button’s title text.
 */
@property (nonatomic) IBInspectable UIEdgeInsets buttonTitleEdgeInsets;

/**
 * A Boolean value that determines whether the title shadow changes
 * when the button is highlighted.
 */
@property (nonatomic) IBInspectable BOOL reversesButtonTitleShadowWhenHighlighted;

/**
 * A Boolean value that determines whether tapping the button causes it to glow.
 */
@property (nonatomic) IBInspectable BOOL showsTouchWhenHighlighted;

/**
 * The tint color to apply to the button title and image.
 */
@property (null_resettable, nonatomic) IBInspectable UIColor *tintColor;

/**
 * The button type. (read-only)
 */
@property (nonatomic, readonly) UIButtonType buttonType;

/**
 * The current title that is displayed on the button. (read-only)
 */
@property (nullable, nonatomic, readonly) NSString *currentButtonTitle;

/**
 * The color used to display the title. (read-only)
 */
@property (nonatomic, readonly) UIColor *currentButtonTitleColor;

/**
 * The color of the title’s shadow. (read-only)
 */
@property (nullable, nonatomic, readonly) UIColor *currentButtonTitleShadowColor;

/**
 * The current background image displayed on the button. (read-only)
 */
@property (nullable, nonatomic, readonly) UIImage *currentButtonBackgroundImage;

/**
 * A view that displays the value of the currentTitle property
 * for a button. (read-only)
 */
@property (nullable, nonatomic, readonly) UILabel *buttonTitleLabel;

/// ----------------------------------------------------------------------------
/// @name UIButton emulating methods
/// ----------------------------------------------------------------------------

/**
 * Returns the title associated with the specified state.
 *
 * @param state The state that uses the button title.
 *              The possible values are described in UIControlState.
 *
 * @return The button title for the specified state.
 *         If no title has been set for the specific state,
 *         this method returns the title associated with
 *         the UIControlStateNormal state.
 */
- (nullable NSString *)buttonTitleForState:(UIControlState)state;

/**
 * Returns the title color used for a state.
 *
 * @param state The state that uses the button title color.
 *              The possible values are described in UIControlState.
 *
 * @return The color of the title for the specified state.
 */
- (nullable UIColor *)buttonTitleColorForState:(UIControlState)state;

/**
 * Returns the shadow color of the title used for a state.
 *
 * @param state The state that uses the button title shadow color.
 *              The possible values are described in UIControlState.
 * @return The color of the button title’s shadow for the specified state.
 */
- (nullable UIColor *)buttonTitleShadowColorForState:(UIControlState)state;

/**
 * Returns the background image used for a button state.
 *
 * @param state The state that uses the button background image.
 *              Possible values are described in UIControlState.
 * @return The button background image used for the specified state.
 */
- (nullable UIImage *)buttonBackgroundImageForState:(UIControlState)state;

/// ----------------------------------------------------------------------------
/// @name MMCollapsibleLabel specific properties
/// ----------------------------------------------------------------------------

/**
 * A Boolean value indicating whether the label is collapsed.
 */
@property (nonatomic, getter=isCollapsed) IBInspectable BOOL collapsed;

/**
 * The title that is displayed on the show button.
 */
@property (null_resettable, nonatomic) IBInspectable NSString *showButtonTitle;

/**
 * The title that is displayed on the hide button.
 */
@property (null_resettable, nonatomic) IBInspectable NSString *hideButtonTitle;

/**
 * The amount of time for animation to open or close the label in seconds.
 */
@property (nonatomic) IBInspectable CGFloat animationDuration;

/// ----------------------------------------------------------------------------
/// @name MMCollapsibleLabel specific methods
/// ----------------------------------------------------------------------------

/**
 * Set the label to be collapsed or not, optionally with animation.
 *
 * @param collapsed YES to collapse the label; otherwise NO.
 * @param animated YES to animate the label like "accordion"; otherwise NO.
 */
- (void)setCollapsed:(BOOL)collapsed animated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END;
