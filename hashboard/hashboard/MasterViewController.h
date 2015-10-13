//
//  MasterViewController.h
//  hashboard
//
//  Created by Zachary Cohen on 10/11/15.
//  Copyright © 2015 Zachary Cohen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;

- (void)addHashboard:(NSString *)tag;

@end

