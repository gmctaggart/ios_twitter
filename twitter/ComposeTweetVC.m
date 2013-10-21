//
//  ComposeTweetVC.m
//  twitter
//
//  Created by Gregory McTaggart on 10/20/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "ComposeTweetVC.h"

const int MAX_TWEET_CHARACTERS = 140;

@interface ComposeTweetVC ()

@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet UIButton *tweetButton;
@property (weak, nonatomic) IBOutlet UITextView *tweetText;
@property (weak, nonatomic) IBOutlet UILabel *characterCountLabel;

- (IBAction)onCancelButton:(id) sender;
- (IBAction)onTweetButton:(id) sender;

@end

@implementation ComposeTweetVC


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[self navigationController] setNavigationBarHidden:YES animated:animated];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.cancelButton addTarget:self action:@selector(onCancelButton:) forControlEvents:UIControlEventTouchUpInside];
    
    self.tweetText.delegate = self;
    self.tweetText.text = @"";
    self.characterCountLabel.text = [NSString stringWithFormat:@"%d",MAX_TWEET_CHARACTERS];
}

- (void)viewDidAppear:(BOOL)animated
{
    // pop the keyboard
    [self.tweetText becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onCancelButton:(id) sender
{
    // want to bring back the nav bar for now
    [[self navigationController] setNavigationBarHidden:NO animated:NO];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)onTweetButton:(id) sender
{
    // do something to send a tweet!
}

#pragma TextView Delegate

- (void)textViewDidChange:(UITextView *)textView
{
    int charCountRemaining = MAX_TWEET_CHARACTERS - textView.text.length;
    self.characterCountLabel.text = [NSString stringWithFormat:@"%d",charCountRemaining];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    return (textView.text.length + text.length) <= MAX_TWEET_CHARACTERS;
}


@end
