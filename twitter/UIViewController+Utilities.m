//
//  UIViewController+Utilities.m
//  twitter
//
//  Created by Gregory McTaggart on 10/22/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "UIViewController+Utilities.h"

@implementation UIViewController (Utilities)


-(void)addNavBarTopGuideConstraintWithUIElement:(id) uiElement withSpacing:(int)spacing
{
    NSString *verticalConstraint = [NSString stringWithFormat:@"V:|-%d-[v]", spacing];
    NSMutableDictionary *views = [NSMutableDictionary new];
    views[@"v"] = uiElement;
    if ([self respondsToSelector:@selector(topLayoutGuide)]) {
        views[@"topLayoutGuide"] = self.topLayoutGuide;
        verticalConstraint = [NSString stringWithFormat:@"V:[topLayoutGuide]-%d-[v]", spacing];
    }
    
    [self.view addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat: verticalConstraint
                                             options: 0
                                             metrics: nil
                                               views: views]
     
     ];
}

@end
