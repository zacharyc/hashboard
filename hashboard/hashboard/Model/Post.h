//
//  Post.h
//  hashboard
//
//  Created by Zachary Cohen on 10/28/15.
//  Copyright © 2015 Zachary Cohen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Post : NSObject

@property (nonatomic, strong) NSString *imageUrlString;

- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end
