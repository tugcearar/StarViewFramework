//
//  Star.m
//  StarFramework
//
//  Created by Tuğçe Arar on 20.09.2021.
//

#import "Star.h"
#import "NSArray+Random.h"

typedef enum{
    Bright, Notsomuch
}Brightness;

@interface Star()
 
@property (nonatomic,assign) Brightness StarBrightness;
@property (nonatomic,assign) UIColor *StarColor;

@end

@implementation Star

NSArray *colors1;
NSArray *colors2;

- (void)initArrays
{
        colors1 = [[NSArray alloc] initWithObjects:
                              UIColor.redColor,
                              UIColor.blueColor,
                   UIColor.greenColor, nil];
        
        colors2 = [[NSArray alloc] initWithObjects:
                              UIColor.yellowColor,
                              UIColor.purpleColor,
                   UIColor.grayColor, nil];
}

- (id)initWithProperties:(SSize)size{
    [self initArrays];
    UIColor *randomColor = [UIColor redColor];
    switch(size) {
        case S:
            randomColor = [colors1 randomObject];
            break;
        case B:
            randomColor = [colors2 randomObject];
            break;
        default:
            [NSException raise:NSGenericException format:@"Unexpected FormatType."];
    }
    
    self.StarBrightness = (Brightness) (arc4random_uniform(2));
    self.StarSize= size;
    self.StarColor= randomColor;
    return self;
}

- (NSString *)description
{
    NSString *result = [NSString stringWithFormat:@"Size: %@, Brightness: %@ , Color: %@",
                          [self SizeToString: _StarSize],
                          [self BrightnessToString: _StarBrightness],
                          [_StarColor description]];
    
    return result;
}


- (NSString*)BrightnessToString:(Brightness)brightness {
    NSString *result = nil;

    switch(brightness) {
        case Bright:
            result = @"Bright";
            break;
        case Notsomuch:
            result = @"Not So Much";
            break;
        default:
            [NSException raise:NSGenericException format:@"Unexpected FormatType."];
    }

    return result;
}

- (NSString*)SizeToString:(SSize)size {
    NSString *result = nil;

    switch(size) {
        case S:
            result = @"Small Star";
            break;
        case B:
            result = @"Big Star";
            break;
        default:
            [NSException raise:NSGenericException format:@"Unexpected FormatType."];
    }

    return result;
}
@end
