//
//  FISPrimeGenerator.m
//  PrimeTime
//
//  Created by Ken M. Haggerty on 2/5/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import "FISPrimeGenerator.h"

@implementation FISPrimeGenerator

+ (NSUInteger)primeNumber:(NSUInteger)prime
{
    NSUInteger value = 2;
    NSUInteger count = 1;
    BOOL isPrime;
    while (count < prime) {
        value++;
        isPrime = YES;
        for (int i = 2; i < value; i++) {
            if (value % i == 0) {
                isPrime = NO;
                continue;
            }
        }
        if (isPrime) count++;
    }
    return value;
}

@end
