//
//  FISPrimeTableViewController.m
//  PrimeTime
//
//  Created by Ken M. Haggerty on 2/5/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import "FISPrimeTableViewController.h"
#import "FISPrimeGenerator.h"

@interface FISPrimeTableViewController ()
@property (nonatomic, strong) NSArray *primes;
@end

@implementation FISPrimeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView setAccessibilityIdentifier:@"table"];
    
    NSMutableArray *primes = [NSMutableArray arrayWithCapacity:101];
    for (int i = 0; i < 100; i++)
    {
        [primes addObject:@"loading ..."];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
            NSUInteger prime = [FISPrimeGenerator primeNumber:i+1+5000];
            [primes replaceObjectAtIndex:i withObject:[NSNumber numberWithInteger:prime]];
            dispatch_async(dispatch_get_main_queue(), ^{
                UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
                if (cell)
                {
                    [cell.textLabel setText:[NSString stringWithFormat:@"%lu", prime]];
                }
            });
        });
    }
    [self setPrimes:primes];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.primes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    id textValue = [self.primes objectAtIndex:indexPath.row];
    if ([textValue isKindOfClass:[NSString class]])
    {
        [cell.textLabel setText:[NSString stringWithFormat:@"%@", textValue]];
    }
    else if ([textValue isKindOfClass:[NSNumber class]])
    {
        [cell.textLabel setText:[NSString stringWithFormat:@"%lu", ((NSNumber *)textValue).integerValue]];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
