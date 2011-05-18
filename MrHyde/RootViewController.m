//
//  RootViewController.m
//
//  Created by Boris Buegling on 18.05.11.
//

#import "RootViewController.h"

#import "BlogPostViewController.h"

@implementation RootViewController

@synthesize posts;

#pragma mark User actions

-(IBAction)tapAdd {
    [posts addObject:[[BlogPost alloc] initWithTitle:@"New post"]];
    [self.tableView reloadData];
}

#pragma mark - UITableViewController methods


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [posts count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    BlogPost* post = [posts objectAtIndex:indexPath.row];

    cell.textLabel.text = post.title; 
    return cell;
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [posts removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    BlogPostViewController* detailViewController = [[BlogPostViewController alloc] initWithNibName:@"BlogPostViewController" bundle:nil];
    detailViewController.post = [posts objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:detailViewController animated:YES];
    [detailViewController release];
}

#pragma mark - View lifecycle

-(void)viewDidLoad {
    posts = [[NSMutableArray alloc] init];
}

-(void)viewDidUnload {
    [super viewDidUnload];
}

-(void)dealloc {
    [super dealloc];
}

@end