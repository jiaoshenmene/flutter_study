//
//  PlatformViewController.m
//  Runner
//
//  Created by 杜甲 on 2019/7/14.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

#import "PlatformViewController.h"

@interface PlatformViewController ()
@property (weak, nonatomic) IBOutlet UILabel *incrementLabel;

@end

@implementation PlatformViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.counter++;
    [self setIncrementLabelText];
}
- (IBAction)switchToFlutterView:(id)sender {
    [self.delegate didUpdateCounter:self.counter];
    [self dismissViewControllerAnimated:NO completion:nil];
}
- (IBAction)handleIncrement:(id)sender {
    self.counter++;
    [self setIncrementLabelText];
}

- (void)setIncrementLabelText {
    NSString *text = [NSString stringWithFormat:@"Button tapped %d %@.",self.counter,(self.counter == 1) ? @"time" : @"times"];
    self.incrementLabel.text = text;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
