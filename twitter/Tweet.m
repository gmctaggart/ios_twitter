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

+ (NSMutableArray *)tweetsWithArray:(NSArray *)array {
    NSMutableArray *tweets = [[NSMutableArray alloc] initWithCapacity:array.count];
    for (NSDictionary *params in array) {
        [tweets addObject:[[Tweet alloc] initWithDictionary:params]];
    }
    return tweets;
}

- (NSString *) timestamp {
    NSString *timestamp = [self.data valueOrNilForKeyPath:@"created_at"];
    return [self formatTimestamp:timestamp];
}

- (User *) user {
    User *user = [User userWithDictionary:[self.data valueOrNilForKeyPath:@"user"]];
    return user;
}

- (NSString *) formatTimestamp: (NSString *) timestamp {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"eee MMM dd HH:mm:ss ZZZZ yyyy"];
  
    NSDate *tweetDate = [dateFormatter dateFromString: timestamp];
    NSDate *currentTime=[NSDate date];
    
    float interval = -1 * [currentTime timeIntervalSinceDate:tweetDate];
    TTTTimeIntervalFormatter *timeIntervalFormatter = [[TTTTimeIntervalFormatter alloc] init];
    NSString *formattedTime = [timeIntervalFormatter stringForTimeInterval:interval];
    
    // TODO: do first space + 1 charachter then remove the whitespace.
    
    
    // remove the 'ago' ending of the string
    return [formattedTime substringWithRange: NSMakeRange (0, formattedTime.length - 4)];
}

@end
