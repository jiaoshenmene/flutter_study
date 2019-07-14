//
//  PlatformViewController.h
//  Runner
//
//  Created by 杜甲 on 2019/7/14.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PlatformViewControllerDelegate <NSObject>

- (void)didUpdateCounter:(int)counter;

@end

NS_ASSUME_NONNULL_BEGIN

@interface PlatformViewController : UIViewController
@property (strong, nonatomic) id<PlatformViewControllerDelegate> delegate;
@property int counter;
@end

NS_ASSUME_NONNULL_END
