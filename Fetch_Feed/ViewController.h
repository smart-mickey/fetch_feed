//
//  ViewController.h
//  Fetch_Feed
//
//  Created by litiyan on 11/23/15.
//  Copyright © 2015 litiyan. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface ViewController : UIViewController<NSURLSessionTaskDelegate,NSURLSessionDataDelegate,NSURLSessionDelegate>
{
    NSMutableArray *Array_ImageURL;
    NSMutableArray *Array_Description;
    NSMutableArray *Array_Title;
    NSString *title;

}
@property (nonatomic, retain) IBOutlet UIButton *Title;
@property (nonatomic, retain) IBOutlet UITableView *FeedView;

@end

