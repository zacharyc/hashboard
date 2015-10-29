//
//  DetailViewController.m
//  hashboard
//
//  Created by Zachary Cohen on 10/11/15.
//  Copyright © 2015 Zachary Cohen. All rights reserved.
//

#import "DetailViewController.h"
#import "AFHTTPRequestOperation.h"
#import "AFHTTPRequestOperationManager.h"
#import "Post.h"

@interface DetailViewController ()

@property (nonatomic, strong) NSArray *posts;

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.posts = @[];
    [self configureView];

    // make network request
    NSDictionary *configuration = [[NSDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"appSettings" ofType:@"plist"]];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *urlString = [NSString stringWithFormat:@"https://api.instagram.com/v1/tags/fieldnotes/media/recent?client_id=%@", [configuration objectForKey:@"instagramKey"]];
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSMutableArray *images = [[NSMutableArray alloc] init];

        if ([responseObject objectForKey:@"data"]) {
            NSArray *data = [responseObject objectForKey:@"data"];
            for (NSDictionary *item in data) {
                Post *post = [[Post alloc] initWithDictionary:item];
                [images addObject:post];
            }
        }
        NSLog(@"JSON: %@, %lu", images, (unsigned long)[images count]);
        self.posts = [[NSArray alloc] initWithArray:images];
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.posts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    cell.textLabel.text = @"haha";
    return cell;
}

@end
