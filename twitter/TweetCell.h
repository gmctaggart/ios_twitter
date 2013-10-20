//
//  TweetCell.h
//  twitter
//
//  Created by Timothy Lee on 8/6/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import <SDWebImage/UIImageView+WebCache.h>
#import <UIKit/UIKit.h>
#import "Tweet.h"

@interface TweetCell : UITableViewCell

@property (nonatomic,strong) Tweet *tweet;

-(void)setCellWithTweetAndSuccessBlock:(Tweet *)tweet withImageLoadedBlock:(void (^)(void))successFunction;
//-(UIFont *)tweetFont;
//-(NSString *)tweetText;
-(CGFloat)tweetLabelHeight;

@end
