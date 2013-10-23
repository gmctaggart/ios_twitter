//
//  TweetVC.h
//  twitter
//
//  Created by Gregory McTaggart on 10/20/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import <SDWebImage/UIImageView+WebCache.h>
#import <UIKit/UIKit.h>
#import "UIViewController+Utilities.h"
#import "Tweet.h"
#import "ComposeTweetVC.h"

@interface TweetVC : UIViewController

@property (nonatomic, weak) Tweet* tweet;

@end
