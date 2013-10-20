//
//  TimelineVC.m
//  twitter
//
//  Created by Timothy Lee on 8/4/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "TimelineVC.h"
#import "TweetCell.h"


// Define a new type for the block
typedef void (^ImageLoadedSuccessFunction)(void);


static char indexPathKey;


@interface TimelineVC ()

@property (nonatomic, strong) NSMutableArray *tweets;

- (void)onSignOutButton;
- (void)reload;

@end

@implementation TimelineVC

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.title = @"Twitter";
        
        [self reload];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Sign Out" style:UIBarButtonItemStylePlain target:self action:@selector(onSignOutButton)];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"TweetCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"TweetCell"];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tweets.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"TweetCell";
    TweetCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[TweetCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    
    
    // Setup image loaded success block
    Tweet *tweet = self.tweets[indexPath.row];
    [cell setCellWithTweetAndSuccessBlock:tweet withImageLoadedBlock:(ImageLoadedSuccessFunction) ^(void) {
//        [self.tableView reloadData];
/*        [self.tableView beginUpdates];
        NSArray *array = [NSArray arrayWithObject:indexPath];
        [self reloadRowsAtIndexPaths:array withRowAnimation:UITableViewRowAnimationAutomatic];
        [self.tableView endUpdates];
 */
    }];
    
    
    
    // hang on to this text for later
    objc_setAssociatedObject(self.tableView, &indexPathKey, cell, OBJC_ASSOCIATION_RETAIN);
    
    // DO THIS ALREADY IN TWEET CELL
    // pin label to top
//    [cell pinToTop];
//    CGFloat rowHeight = [self heightForText:labelText];
//    cell.myLabel.frame = CGRectMake(0, 0, 300, rowHeight);
    
    
    // Maybe add loading indicator to image icons
    /*
     indicator = [[UIActivityIndicator alloc] initWithActivityIndicatorStyle:
     UIActivityIndicatorStyleWhite];
     [indicator startAnimating];
     */
    
    
    return cell;
}

//+ (CGFloat)bodyLabelHeightForBodyString:(NSString *)pBodyString{
//    CGSize bodySize = [pBodyString sizeWithFont:[UIFont fontWithName:@"HelveticaNeue" size:14.5f] constrainedToSize:CGSizeMake(BodyLabelWidth, MAXFLOAT) lineBreakMode:UILineBreakModeWordWrap];
//    return bodySize.height;
//}
//
//+ (CGFloat)calculatedCellHeightForBodyString:(NSString *)pBodyString{
//    //Get body height
//    CGFloat bodyHeight = [self bodyLabelHeightForBodyString:pBodyString];
//    return BodyLabelYOrigin + bodyHeight + 10;
//}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 400;
    
    
//    TweetCell *cell = objc_getAssociatedObject(tableView, &indexPathKey);
//    return cell.tweetLabelHeight;
    
    
    
//    UIFont *cellFont = cell.tweetFont;
//    CGSize constraintSize = CGSizeMake(300, MAXFLOAT);
//    CGSize labelSize = [cell.tweetText sizeWithFont:cellFont constrainedToSize:constraintSize lineBreakMode:NSLineBreakByWordWrapping];
//    CGFloat height = labelSize.height + 10;
////    NSLog(@"height=%f", height);
//    return height;
}

// TODO: adding this for debugging purposes
- (void)reloadRowsAtIndexPaths:(NSArray *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation
{
    [self.tableView reloadRowsAtIndexPaths:indexPaths withRowAnimation:animation];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

#pragma mark - Private methods

- (void)onSignOutButton {
    [User setCurrentUser:nil];
}

- (void)reload {
    [[TwitterClient instance] homeTimelineWithCount:20 sinceId:0 maxId:0 success:^(AFHTTPRequestOperation *operation, id response) {
        //NSLog(@"%@", response);
        self.tweets = [Tweet tweetsWithArray:response];
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        // Do nothing
    }];
}

@end
