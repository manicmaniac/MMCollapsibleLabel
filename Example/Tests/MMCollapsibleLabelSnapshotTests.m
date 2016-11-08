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
    FBSnapshotVerifyView(_collapsibleLabel, nil);
}

- (void)testWithLoremIpsumWithNotCollapsed {
    [_collapsibleLabel setCollapsed:NO animated:false];
    FBSnapshotVerifyView(_collapsibleLabel, nil);
}

@end
