//
//  ComposeTweetVC.h
//  twitter
//
//  Created by Gregory McTaggart on 10/20/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+Utilities.h"
#import "TwitterClient.h"
#import "Tweet.h"

@interface ComposeTweetVC : UIViewController <UITextViewDelegate>

- (id)initWithTweet:(Tweet *)tweet;

@end
