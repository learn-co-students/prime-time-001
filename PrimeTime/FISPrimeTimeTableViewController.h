//
//  FISPrimeTimeTableViewController.h
//  PrimeTime
//
//  Created by John Richardson on 6/6/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FISPrimeTimeTableViewController : UITableViewController

@property (nonatomic) NSMutableArray *firstOneHundredPrimes;

- (BOOL)isPrime:(NSUInteger)number;
- (void)setValueForFirstOneHundredPrimes;

@end
