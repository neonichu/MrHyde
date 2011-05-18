//
//  RootViewController.h
//
//  Created by Boris Buegling on 18.05.11.
//

#import <UIKit/UIKit.h>

#import "BlogPost.h"

@interface RootViewController : UITableViewController

@property (nonatomic, readonly) NSMutableArray* posts;

-(IBAction)tapAdd;

@end