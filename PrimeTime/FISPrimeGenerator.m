//
//  FISPrimeGenerator.m
//  PrimeTime
//
//  Created by Ken M. Haggerty on 2/5/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import "FISPrimeGenerator.h"

@interface FISPrimeGenerator ()
@property (nonatomic, strong) NSArray *primes;
@end

@implementation FISPrimeGenerator

+ (instancetype)sharedGenerator
{
    static FISPrimeGenerator *sharedGenerator = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedGenerator = [[FISPrimeGenerator alloc] init];
    });
    return sharedGenerator;
}

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _primes = @[@2];
    }
    return self;
}

+ (NSUInteger)primeNumber:(NSUInteger)prime
{
    NSMutableArray *primesCopy = [FISPrimeGenerator sharedGenerator].primes.mutableCopy;
    if (prime <= primesCopy.count)
    {
        return ((NSNumber *)[primesCopy objectAtIndex:prime-1]).integerValue;
    }
    
    NSUInteger value = ((NSNumber *)[primesCopy lastObject]).integerValue;
    BOOL isPrime;
    while (primesCopy.count < prime) {
        value++;
        isPrime = YES;
        for (int i = 2; i < value; i++) {
            if (value % i == 0) {
                isPrime = NO;
                continue;
            }
        }
        if (isPrime)
        {
            [primesCopy addObject:[NSNumber numberWithInteger:value]];
        }
    }
    [[FISPrimeGenerator sharedGenerator] setPrimes:primesCopy];
    return value;
}

@end
