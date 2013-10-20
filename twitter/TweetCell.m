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
        
//        self.tweetLabel.text = @"Multi-Line\nText";
//        self.tweetLabel.numberOfLines = 3;
//        self.tweetLabel.lineBreakMode = NSLineBreakByWordWrapping;
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(CGFloat) heightForLabel: (UILabel *) label
{
    UIFont *font = label.font;
    CGSize constraintSize = CGSizeMake(300, MAXFLOAT);
    CGSize labelSize = [label.text sizeWithFont:font constrainedToSize:constraintSize lineBreakMode:NSLineBreakByWordWrapping];
    CGFloat height = labelSize.height + 10;
    NSLog(@"height=%f", height);
    return height;
}

-(CGFloat)tweetLabelHeight
{
    return [self heightForLabel:self.tweetLabel];
}

-(void)setCellWithTweetAndSuccessBlock:(Tweet *)tweet withImageLoadedBlock:(void (^)(void))successFunction
{
    _tweet = tweet;

    self.tweetLabel.text = tweet.text;
    self.timestampLabel.text = tweet.timestamp;
    self.usernameLabel.text = tweet.user.name;
    
    // make the tweet label multi-line
    self.tweetLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.tweetLabel.numberOfLines = 0;
    
    CGFloat labelHeight = [self heightForLabel:self.tweetLabel];
    self.tweetLabel.frame = CGRectMake(0, 0, 300, labelHeight);

    
//    [self.imageView setImageWithURL:[NSURL URLWithString:tweet.user.profilePicURL]];
    
    [self.imageView setImageWithURL:[NSURL URLWithString:tweet.user.profilePicURL]
                          completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
                              successFunction();
                          }];
}


@end
