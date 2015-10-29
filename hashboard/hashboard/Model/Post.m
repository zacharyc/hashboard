//
//  Post.m
//  hashboard
//
//  Created by Zachary Cohen on 10/28/15.
//  Copyright © 2015 Zachary Cohen. All rights reserved.
//

#import "Post.h"

@implementation Post

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [self init];
    if (self == nil) return nil;

    NSDictionary *images = [dict objectForKey:@"images"];
    self.imageUrlString = [images objectForKey:@"standard_resolution"];

    return self;
}

@end
