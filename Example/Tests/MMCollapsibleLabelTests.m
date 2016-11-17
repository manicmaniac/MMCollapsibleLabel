//
//  MMCollapsibleLabelTests.m
//  MMCollapsibleLabel
//
//  Created by Ryosuke Ito on 10/28/16.
//  Copyright © 2016 Ryosuke Ito. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <UIKit/UIKit.h>
#import <MMCollapsibleLabel/MMCollapsibleLabel.h>

@interface MMCollapsibleLabelTests : XCTestCase

@end

@implementation MMCollapsibleLabelTests {
@private
    MMCollapsibleLabel *_label;
    UIColor *_defaultTintColor;
}

- (void)setUp {
    [super setUp];
    _label = [[MMCollapsibleLabel alloc] init];
    _defaultTintColor = [UIColor colorWithRed:0.0 green:122.0 / 255.0 blue: 255.0 / 255.0 alpha:1.0];
}

#pragma mark -

- (void)testText {
    XCTAssertEqual(_label.text.length, 0);
    _label.text = @"foo";
    XCTAssertEqual(_label.text, @"foo");
}

- (void)testFont {
    XCTAssertEqualObjects(_label.font, [UIFont systemFontOfSize: 17.0]);
    UIFont *font = [UIFont systemFontOfSize:10.0];
    _label.font = font;
    XCTAssertEqual(_label.font, font);
}

- (void)testTextColor {
    UIColor *textColor = [UIColor blueColor];
    _label.textColor = textColor;
    XCTAssertEqual(_label.textColor, textColor);
}

- (void)testShadowColor {
    UIColor *shadowColor = [UIColor blueColor];
    _label.shadowColor = shadowColor;
    XCTAssertEqual(_label.shadowColor, shadowColor);
}

- (void)testShadowOffset {
    XCTAssert(CGSizeEqualToSize(_label.shadowOffset, CGSizeMake(0, -1)));
    CGSize shadowOffset = CGSizeMake(20, 20);
    _label.shadowOffset = shadowOffset;
    XCTAssert(CGSizeEqualToSize(_label.shadowOffset, shadowOffset));
}

- (void)testTextAlignment {
    _label.textAlignment = NSTextAlignmentRight;
    XCTAssertEqual(_label.textAlignment, NSTextAlignmentRight);
}

- (void)testLineBreakMode {
    XCTAssertEqual(_label.lineBreakMode, NSLineBreakByTruncatingTail);
    _label.lineBreakMode = NSLineBreakByCharWrapping;
    XCTAssertEqual(_label.lineBreakMode, NSLineBreakByCharWrapping);
}

- (void)testAttributedText {
    NSAttributedString *attributedText = [[NSAttributedString alloc] initWithString:@"foo"];
    _label.attributedText = attributedText;
    XCTAssertEqualObjects(_label.attributedText, attributedText);
}

- (void)testHighlightedTextColor {
    XCTAssertNil(_label.highlightedTextColor);
    UIColor *highlightedTextColor = [UIColor blueColor];
    _label.highlightedTextColor = highlightedTextColor;
    XCTAssertEqual(_label.highlightedTextColor, highlightedTextColor);
}

- (void)testHighlighted {
    XCTAssertFalse(_label.isHighlighted);
    _label.highlighted = YES;
    XCTAssertTrue(_label.isHighlighted);
}

- (void)testIsEnabled {
    XCTAssertTrue(_label.isEnabled);
    _label.enabled = NO;
    XCTAssertFalse(_label.isEnabled);
}

- (void)testNumberOfLines {
    XCTAssertEqual(_label.numberOfLines, 1);
    _label.numberOfLines = 10;
    XCTAssertEqual(_label.numberOfLines, 10);
}

- (void)testAdjustsFontSizeToFitWidth {
    XCTAssertFalse(_label.adjustsFontSizeToFitWidth);
    _label.adjustsFontSizeToFitWidth = YES;
    XCTAssertTrue(_label.adjustsFontSizeToFitWidth);
}

- (void)testBaselineAdjustment {
    XCTAssertEqual(_label.baselineAdjustment, UIBaselineAdjustmentAlignBaselines);
    _label.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
    XCTAssertEqual(_label.baselineAdjustment, UIBaselineAdjustmentAlignCenters);
}

- (void)testMinimumScaleFactor {
    XCTAssertEqual(_label.minimumScaleFactor, 0.0);
    _label.minimumScaleFactor = 0.8;
    XCTAssertEqualWithAccuracy(_label.minimumScaleFactor, 0.8, 0.0001);
}

- (void)testAllowsDefaultTighteningForTruncation {
    if (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_8_4) {
        XCTAssertFalse(_label.allowsDefaultTighteningForTruncation);
        _label.allowsDefaultTighteningForTruncation = YES;
        XCTAssertTrue(_label.allowsDefaultTighteningForTruncation);
    }
}

- (void)testButtonContentEdgeInsets {
    XCTAssert(UIEdgeInsetsEqualToEdgeInsets(_label.buttonContentEdgeInsets, UIEdgeInsetsMake(0, 0, 0, 0)));
    UIEdgeInsets edgeInsets = UIEdgeInsetsMake(3, 3, 3, 3);
    _label.buttonContentEdgeInsets = edgeInsets;
    XCTAssert(UIEdgeInsetsEqualToEdgeInsets(_label.buttonContentEdgeInsets, edgeInsets));
}

- (void)testButtonTitleEdgeInsets {
    XCTAssert(UIEdgeInsetsEqualToEdgeInsets(_label.buttonTitleEdgeInsets, UIEdgeInsetsMake(0, 0, 0, 0)));
    UIEdgeInsets edgeInsets = UIEdgeInsetsMake(3, 3, 3, 3);
    _label.buttonTitleEdgeInsets = edgeInsets;
    XCTAssert(UIEdgeInsetsEqualToEdgeInsets(_label.buttonTitleEdgeInsets, edgeInsets));
}

- (void)testReversesButtonTitleShadowWhenHighlighted {
    XCTAssertFalse(_label.reversesButtonTitleShadowWhenHighlighted);
    _label.reversesButtonTitleShadowWhenHighlighted = YES;
    XCTAssertTrue(_label.reversesButtonTitleShadowWhenHighlighted);
}

- (void)testShowsTouchWhenHighlighted {
    XCTAssertFalse(_label.showsTouchWhenHighlighted);
    _label.showsTouchWhenHighlighted = YES;
    XCTAssertTrue(_label.showsTouchWhenHighlighted);
}

- (void)testTintColor {
    XCTAssertEqualObjects(_label.tintColor, _defaultTintColor);
    UIColor *tintColor = [UIColor blueColor];
    _label.tintColor = tintColor;
    XCTAssertEqual(_label.tintColor, tintColor);
}

- (void)testButtonType {
    XCTAssertEqual(_label.buttonType, UIButtonTypeSystem);
}

- (void)testCurrentButtonTitle {
    XCTAssertEqualObjects(_label.currentButtonTitle, @"Hide");
    _label.collapsed = YES;
    [_label setNeedsLayout];
    [_label layoutIfNeeded];
    XCTAssertEqualObjects(_label.currentButtonTitle, @"Show");
}

- (void)testCurrentButtonTitleColor {
    XCTAssertEqualObjects(_label.currentButtonTitleColor, _defaultTintColor);
}

- (void)testCurrentButtonTitleShadowColor {
    XCTAssertNil(_label.currentButtonTitleShadowColor);
}

- (void)testCurrentButtonBackgroundImage {
    XCTAssertNil(_label.currentButtonBackgroundImage);
}

- (void)testButtonTitleLabel {
    UIButton *button = nil;
    UIView *containerView = (UIView *)_label.subviews.firstObject;
    for (UIView *subview in containerView.subviews) {
        for (UIView *subviewSubview in subview.subviews) {
            if ([subviewSubview isKindOfClass:[UIButton class]]) {
                button = (UIButton *)subviewSubview;
                goto test;
            }
        }
    }
test:
    XCTAssertEqual(_label.buttonTitleLabel, button.titleLabel);
}

- (void)testButtonTitleForState {
    XCTAssertEqualObjects([_label buttonTitleForState:UIControlStateNormal], @"Hide");
    _label.collapsed = YES;
    [_label setNeedsLayout];
    [_label layoutIfNeeded];
    XCTAssertEqualObjects([_label buttonTitleForState:UIControlStateNormal], @"Show");
}

- (void)testButtonTitleColorForState {
    XCTAssertEqualObjects([_label buttonTitleColorForState:UIControlStateNormal], _defaultTintColor);
}

- (void)testButtonTitleShadowColorForState {
    XCTAssertNil([_label buttonTitleShadowColorForState:UIControlStateNormal]);
}

- (void)testButtonBackgroundImageForState {
    XCTAssertNil([_label buttonBackgroundImageForState:UIControlStateNormal]);
}

- (void)testCollapsed {
    XCTAssertFalse(_label.isCollapsed);
    _label.collapsed = YES;
    XCTAssertTrue(_label.isCollapsed);
}

- (void)testShowButtonTitle {
    XCTAssertEqualObjects(_label.showButtonTitle, @"Show");
    _label.showButtonTitle = @"Foo";
    XCTAssertEqualObjects(_label.showButtonTitle, @"Foo");
}

- (void)testHideButtonTitle {
    XCTAssertEqualObjects(_label.hideButtonTitle, @"Hide");
    _label.hideButtonTitle = @"Bar";
    XCTAssertEqualObjects(_label.hideButtonTitle, @"Bar");
}

- (void)testAnimationDuration {
    XCTAssertEqualWithAccuracy(_label.animationDuration, 0.25, 0.000001);
    _label.animationDuration = 1.0;
    XCTAssertEqualWithAccuracy(_label.animationDuration, 1.0, 0.000001);
}

#pragma mark -

- (void)testKeyValueObserving {
    MMCollapsibleLabel *label = [[MMCollapsibleLabel alloc] init];
    NSMutableDictionary<NSString *,NSNumber *> *calledCounts = [NSMutableDictionary dictionaryWithObject:@0 forKey:@"testKeyValueObserving"];
    [label addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew context:(__bridge void * _Nullable)(calledCounts)];
    label.text = @"foo";
    XCTAssertEqualObjects(calledCounts[@"testKeyValueObserving"], @1);
    [label removeObserver:self forKeyPath:@"text"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    NSMutableDictionary *calledCounts = (__bridge NSMutableDictionary<NSString *,NSNumber *> *)context;
    if ([calledCounts.allKeys containsObject:@"testKeyValueObserving"]) {
        NSNumber *calledCount = calledCounts[@"testKeyValueObserving"];
        calledCounts[@"testKeyValueObserving"] = @(calledCount.integerValue + 1);
    }
}

@end
