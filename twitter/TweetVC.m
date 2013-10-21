//
//  TweetVC.m
//  twitter
//
//  Created by Gregory McTaggart on 10/20/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "TweetVC.h"

@interface TweetVC ()


@property (nonatomic, weak) IBOutlet UIImageView *imageView;
@property (nonatomic, weak) IBOutlet UILabel *usernameLabel;
@property (nonatomic, weak) IBOutlet UILabel *timestampLabel;
@property (nonatomic, weak) IBOutlet UILabel *tweetLabel;
@property (nonatomic, weak) IBOutlet UIButton *retweetButton;
@property (nonatomic, weak) IBOutlet UIButton *replyButton;
@property (nonatomic, weak) IBOutlet UIButton *favouriteButton;


- (IBAction)onRetweetButton:(id) sender;
- (IBAction)onReplyButton:(id) sender;
- (IBAction)onFavouriteButton:(id) sender;

@end

@implementation TweetVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tweetLabel.text = self.tweet.text;
    self.usernameLabel.text = self.tweet.user.name;
    self.timestampLabel.text = [self.tweet timestamp:NO];
    
    [self.imageView setImageWithURL:[NSURL URLWithString:self.tweet.user.profilePicURL]
                          completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
                              // update the image view
                              [self.imageView setNeedsDisplay];                              
                          }];
    
    [self.retweetButton addTarget:self action:@selector(onRetweetButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.replyButton addTarget:self action:@selector(onReplyButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.favouriteButton addTarget:self action:@selector(onFavouriteButton:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onRetweetButton:(id) sender
{
    
}

- (IBAction)onReplyButton:(id) sender
{
    
}

- (IBAction)onFavouriteButton:(id) sender
{
    
}


@end
