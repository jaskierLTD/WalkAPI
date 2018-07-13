//
//  ViewController.m
//  JSONHandler
//
//  Created by Iorweth on 02/03/2015.
//  Copyright (c) 2015 alexik (c). All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"
#import "Location.h"
#import "JSONLoader.h"

@implementation ViewController
{
    NSMutableArray *_walks;
    NSString *plistFileName;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    plistFileName = @"Data.plist";
    [self savePlist];
    [self loadPlist];
}
//--------------------------------------------------------------------------------------------------------------------------------------

- (void)savePlist
{
    NSMutableDictionary *root = [NSMutableDictionary dictionary];
    //[root setObject:@YES forKey:@"autosave"];
    //[root setObject:@"hello" forKey:@"greet-text"];
    NSMutableArray *ID = [NSMutableArray array];
    [ID addObject:@"one"];
    [ID addObject:@"two"];
    [ID addObject:@"thee"];
    [root setObject:ID forKey:@"ID"];
    /*NSMutableArray *subs = [NSMutableArray array];
    for (NSInteger i = 0; i < 10; i++)
    {
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        [dict setObject:[NSString stringWithFormat:@"John %ld", i] forKey:@"name"];
        [dict setObject:[NSString stringWithFormat:@"Moscow %ld", i] forKey:@"city"];
        [dict setObject:[NSNumber numberWithInteger:i] forKey:@"id"];
        [subs addObject:dict];
    }
    [root setObject:subs forKey:@"subs"];
    */
    NSLog(@"saving data:\n%@", root);
    NSError *error = nil;
    NSData *representation = [NSPropertyListSerialization dataWithPropertyList:root format:NSPropertyListXMLFormat_v1_0 options:0 error:&error];
    if (!error)
    {
        BOOL ok = [representation writeToFile:plistFileName atomically:YES];
        if (ok)
        {
            NSLog(@"ok!");
        }        else
        {
            NSLog(@"error writing to file: %@", plistFileName);
        }
    }
    else
    {
        NSLog(@"error: %@", error);
    }
}

- (void)loadPlist
{
    NSData *plistData = [NSData dataWithContentsOfFile:plistFileName];
    if (!plistData)
    {
        NSLog(@"error reading from file: %@", plistFileName);
        return;
    }
    NSPropertyListFormat format;
    NSError *error = nil;
    id plist = [NSPropertyListSerialization propertyListWithData:plistData options:NSPropertyListMutableContainersAndLeaves format:&format error:&error];
    if (!error)
    {
        NSMutableDictionary *root = plist;
        NSLog(@"loaded data:\n%@", root);
    }
    else
    {
        NSLog(@"error: %@", error);
    }
}
//--------------------------------------------------------------------------------------------------------------------------------------
// Just before showing the DetailViewController, set the selected object
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    DetailViewController *DVC = segue.destinationViewController;
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    DVC.location = [_walks objectAtIndex:indexPath.row];
}


#pragma mark - Table View Controller Methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WalkCell"];
    Location *walking = [_walks objectAtIndex:indexPath.row];
    
    cell.textLabel.text       = walking.wsTitle;
    cell.detailTextLabel.text = walking.wsDescription;
    
    //icon
    NSString *strImg = [NSString stringWithFormat: @"http://www.ifootpath.com/upload/thumbs/%@",walking.wsIcon];
    UIImage *img = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:strImg]]];
    cell.imageView.image = img;

    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_walks count];
}

//--------------------------------------------------------------------------------------------------------------------------------------
- (IBAction)LoadData:(id)sender
{
    // Create a new JSONLoader with a local file URL
    JSONLoader *jsonLoader = [[JSONLoader alloc] init];
    NSURL *url = [NSURL URLWithString:@"http://www.ifootpath.com/API/get_walks.php"];
    //NSURL *url = [[NSBundle mainBundle] URLForResource:@"walks" withExtension:@"json"];
    
    // Load the data on a background queue...
    
    // As we are using a local file it's not really necessary, but if we were connecting to an online URL then we'd need it
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    _walks = [jsonLoader walksFromJSONFile:url];
    // Now that we have the data, reload the table data on the main UI thread
    [self.tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:YES];
    });
}
//--------------------------------------------------------------------------------------------------------------------------------------


//--------------------------------------------------------------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        //Delete the row
        [_walks removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationFade];
    } //else if (editingStyle == UITableViewCellEditingStyleInsert) {}
}

@end
