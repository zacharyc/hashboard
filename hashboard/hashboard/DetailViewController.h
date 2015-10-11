//
//  DetailViewController.h
//  hashboard
//
//  Created by Zachary Cohen on 10/11/15.
//  Copyright © 2015 Zachary Cohen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

