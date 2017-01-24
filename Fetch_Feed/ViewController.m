//
//  ViewController.m
//  Fetch_Feed
//
//  Created by litiyan on 11/23/15.
//  Copyright © 2015 litiyan. All rights reserved.
//

#import "ViewController.h"
#import "AFURLSessionManager.h"
#import "FeedViewCell.h"

@interface ViewController ()

@end
#define Feed_URL @"http://guarded-basin-2383.herokuapp.com/facts.json"
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:Feed_URL];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
            [self showAlert:@"Network error!"];
        } else {
            NSLog(@"%@ %@", response, responseObject);
            NSMutableDictionary *array=[[NSMutableDictionary alloc] initWithDictionary:responseObject];
            title=[array objectForKey:@"title"];
            
            if(![title isEqualToString:@""]){
                
                Array_Description=[[NSMutableArray alloc] init];
                Array_ImageURL=[[NSMutableArray alloc] init];
                Array_Title=[[NSMutableArray alloc] init];
                
                NSMutableArray *RowsData=[array objectForKey:@"rows"];
                NSDictionary *TF=[[NSDictionary alloc] init];
                
                for(int column=0;column<[RowsData count];column++){
                    TF=[RowsData objectAtIndex:column];
                    [Array_Description addObject:[TF objectForKey:@"description"]];
                    [Array_Title addObject:[TF objectForKey:@"title"]];
                    [Array_ImageURL addObject:[TF objectForKey:@"imageHref"]];
                    
                }
                
                [_FeedView reloadData];
                [_Title setTitle:title forState:UIControlStateNormal];
            }
            else{
                [self showAlert:@"Empty!"];
            }
            
        }
    }];
    [dataTask resume];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark TableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [Array_ImageURL count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"FeedView";
    
    FeedViewCell *Cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (Cell == nil) {
        Cell = [[FeedViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:CellIdentifier];
    }
    if([[Array_ImageURL objectAtIndex:indexPath.row] isKindOfClass:[NSString class]]){
        NSURL *v_url=[NSURL URLWithString:[Array_ImageURL objectAtIndex:indexPath.row]];
        [Cell.cellImageView setShowActivity:YES];
        [Cell.cellImageView setImageURL:v_url];
    }
    Cell.Title.text=[NSString stringWithFormat:@"%@",[Array_Title objectAtIndex:indexPath.row]];
    Cell.Description.text =[NSString stringWithFormat:@"%@",[Array_Description objectAtIndex:indexPath.row]];
    
    return Cell;
}

-(void) showAlert:(NSString *) strAlert_content{
    
    UIAlertView *alert_string = [[UIAlertView alloc] initWithTitle:@"TopSwipe"
                                                           message:strAlert_content
                                                          delegate:nil
                                                 cancelButtonTitle:@"OK"
                                                 otherButtonTitles:nil];
    [alert_string show];
}

@end
