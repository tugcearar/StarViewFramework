//
//  NSArray+Random.m
//  StarView
//
//  Created by Tuğçe Arar on 22.09.2021.
//

#import "NSArray+Random.h"

@implementation NSArray (Random)
- (id)randomObject{
    NSUInteger myCount = [self count];
       if (myCount)
           return [self objectAtIndex:arc4random_uniform(myCount)];
       else
           return nil;
}
@end
