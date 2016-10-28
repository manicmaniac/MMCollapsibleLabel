//
//  MMViewController.m
//  MMCollapsibleLabel
//
//  Created by Ryosuke Ito on 10/28/2016.
//  Copyright (c) 2016 Ryosuke Ito. All rights reserved.
//

#import "MMViewController.h"
#import <MMCollapsibleLabel/MMCollapsibleLabel.h>

@interface MMViewController ()

@property (weak, nonatomic) IBOutlet MMCollapsibleLabel *label;
@property (weak, nonatomic) IBOutlet UILabel *numberOfLinesLabel;

@end

@implementation MMViewController

- (IBAction)textFieldDidChangeValue:(UITextField *)sender {
    _label.text = sender.text;
}
- (IBAction)stepperDidChangeValue:(UIStepper *)sender {
    _label.numberOfLines = (NSInteger)sender.value;
    _numberOfLinesLabel.text = [NSString stringWithFormat:@"%d", (int)sender.value];
}

@end
