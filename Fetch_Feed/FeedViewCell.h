//
//  FeedViewCell.h
//  Fetch_Feed
//
//  Created by litiyan on 11/23/15.
//  Copyright © 2015 litiyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGOImageView.h"

@interface FeedViewCell : UITableViewCell
@property (nonatomic, retain) IBOutlet UILabel *Title;
@property (nonatomic, retain) IBOutlet UILabel *Description;
@property (nonatomic,strong,readwrite) IBOutlet EGOImageView *cellImageView;

@end
