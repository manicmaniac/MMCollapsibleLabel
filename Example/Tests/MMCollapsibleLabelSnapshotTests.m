//
//  MMCollapsibleLabelSnapshotTests.m
//  MMCollapsibleLabel
//
//  Created by Ryosuke Ito on 11/9/16.
//  Copyright © 2016 Ryosuke Ito. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <FBSnapshotTestCase/FBSnapshotTestCase.h>
#import <MMCollapsibleLabel/MMCollapsibleLabel.h>

#ifndef NSFoundationVersionNumber_iOS_9_x_Max
#define NSFoundationVersionNumber_iOS_9_x_Max 1299
#endif

@interface MMCollapsibleLabelSnapshotTests : FBSnapshotTestCase

@end

@implementation MMCollapsibleLabelSnapshotTests {
@private
    MMCollapsibleLabel *_collapsibleLabel;
    NSString *_text;
}

- (void)setUp {
    [super setUp];
    NSBundle *bundle = [NSBundle bundleForClass:[self classForCoder]];
    NSURL *URL = [bundle URLForResource:@"Fixtures/lipsum" withExtension:@"txt"];
    NSError *error = nil;
    _text = [NSString stringWithContentsOfURL:URL encoding:NSUTF8StringEncoding error:&error];
    XCTAssertNil(error);
    CGRect frame = CGRectMake(0, 0, 320, 200);
    _collapsibleLabel = [[MMCollapsibleLabel alloc] initWithFrame:frame];
    _collapsibleLabel.text = _text;
    self.recordMode = NO;
}

- (void)testWithLoremIpsumWithCollapsed {
    [_collapsibleLabel setCollapsed:YES animated:false];
    CGFloat tolerance = 0;
    if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_9_x_Max) {
        tolerance = 0.0126;
    }
    FBSnapshotVerifyViewWithOptions(_collapsibleLabel, nil, FBSnapshotTestCaseDefaultSuffixes(), tolerance);
}

- (void)testWithLoremIpsumWithNotCollapsed {
    [_collapsibleLabel setCollapsed:NO animated:false];
    CGFloat tolerance = 0;
    if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_9_x_Max) {
        tolerance = 0.0877;
    }
    FBSnapshotVerifyViewWithOptions(_collapsibleLabel, nil, FBSnapshotTestCaseDefaultSuffixes(), tolerance);
}

@end
