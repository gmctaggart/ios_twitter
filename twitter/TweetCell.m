//
//  TweetCell.m
//  twitter
//
//  Created by Timothy Lee on 8/6/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "TweetCell.h"

@interface TweetCell ()

@property (nonatomic, weak) IBOutlet UIImageView *imageView;
@property (nonatomic, weak) IBOutlet UILabel *usernameLabel;
@property (nonatomic, weak) IBOutlet UILabel *timestampLabel;
@property (nonatomic, weak) IBOutlet UILabel *tweetLabel;

@end

@implementation TweetCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

//- (void)setSelected:(BOOL)selected animated:(BOOL)animated
//{
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}

-(void)setCellWithTweet:(Tweet *)tweet withImageLoadedBlock:(void (^)(void))successFunction
{
    if (_tweet == nil)
    {
        [self.imageView setImageWithURL:[NSURL URLWithString:tweet.user.profilePicURL]
                              completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
                                  successFunction();
                              }];
    }
    
    _tweet = tweet;

    // make the tweet label multi-line
    self.tweetLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.tweetLabel.numberOfLines = 0;

    self.tweetLabel.text = tweet.text;
    self.timestampLabel.text = [tweet timestamp:YES];
    self.usernameLabel.text = tweet.user.name;
}


@end
