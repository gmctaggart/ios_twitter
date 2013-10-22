//
//  Tweet.m
//  twitter
//
//  Created by Timothy Lee on 8/5/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "Tweet.h"

@implementation Tweet

- (NSString *)text {
    return [self.data valueOrNilForKeyPath:@"text"];
}

- (NSString *)statusId {
    return [self.data valueOrNilForKeyPath:@"id"];
}

+ (NSMutableArray *)tweetsWithArray:(NSArray *)array {
    NSMutableArray *tweets = [[NSMutableArray alloc] initWithCapacity:array.count];
    for (NSDictionary *params in array) {
        [tweets addObject:[[Tweet alloc] initWithDictionary:params]];
    }
    return tweets;
}

- (NSString *) timestamp:(BOOL)withShortFormat {
    NSString *timestamp = [self.data valueOrNilForKeyPath:@"created_at"];
    return [self formatTimestamp:timestamp withShortFormat:withShortFormat];
}

- (User *) user {
    User *user = [User userWithDictionary:[self.data valueOrNilForKeyPath:@"user"]];
    return user;
}

- (NSString *) formatTimestamp:(NSString *)timestamp withShortFormat:(BOOL)shortFormat  {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"eee MMM dd HH:mm:ss ZZZZ yyyy"];
    NSDate *tweetDate = [dateFormatter dateFromString: timestamp];
    
    if (!shortFormat)
    {
        [dateFormatter setDateFormat:@"yyyy-MM-dd 'at' HH:mm"];
        return [dateFormatter stringFromDate:tweetDate];
    }
    
    NSDate *currentTime=[NSDate date];
    float interval = -1 * [currentTime timeIntervalSinceDate:tweetDate];
    TTTTimeIntervalFormatter *timeIntervalFormatter = [[TTTTimeIntervalFormatter alloc] init];
    NSString *formattedTime = [timeIntervalFormatter stringForTimeInterval:interval];
    
    // remove the 'ago' ending of the string
    NSRange firstSpaceInString = [formattedTime rangeOfString: @" "];
    return [formattedTime substringWithRange: NSMakeRange (0, firstSpaceInString.location + 2)];
}

@end
