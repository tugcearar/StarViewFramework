//
//  CustomWebView.m
//  StarView
//
//  Created by Tuğçe Arar on 20.09.2021.
//

#import "CustomWebView.h"
#import <QuartzCore/QuartzCore.h>
#import <objc/runtime.h>
#import <WebKit/WebKit.h>
#import <UIKit/UIKit.h>
#import <Star.h>

@interface CustomWebView()

@property (nonatomic, strong) NSMutableArray * array;
@property (nonatomic, retain) WKWebView * webView;
@end

@implementation CustomWebView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
        if (self) {
            _array= [[NSMutableArray alloc] initWithCapacity:10];
            _webView = [[WKWebView alloc] initWithFrame:frame];
            NSString *html = @"<html><body><img style='width: 100%; height:100%;' src='https://img.etimg.com/thumb/msid-72948091,width-650,imgsize-95069,resizemode-4,quality-100/star_istock.jpg'></img></body></html>";
            
            [_webView loadHTMLString:html baseURL:nil];
            [self addSubview:_webView];
        }
        return self;
}

- (void)addStarInterface:(id)star{
    if ([_array count] < 10) {
        [_array addObject: star];
    }
    else{
        [self displayAlert];
    }
    [self displayArrayOnLog];
}

-(void) displayArrayOnLog{
    NSLog(@"All stars in the sky: %@", [_array description]);
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"StarBrightness = %d", 0];
    NSArray *filteredArray = [_array filteredArrayUsingPredicate:pred];
    NSLog(@"Bright stars in the sky: %@", [filteredArray description]);
}

-(void) displayAlert{
    UIAlertController * alert = [UIAlertController
                                  alertControllerWithTitle:@"Warning"
                                  message:@"Sky is full"
                                  preferredStyle:UIAlertControllerStyleAlert];

     //Add Buttons

     UIAlertAction* yesButton = [UIAlertAction
                                 actionWithTitle:@"OK"
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * action) {
                                     //Handle your yes please button action here
                                 }];


     //Add your buttons to alert controller

     [alert addAction:yesButton];
 
    [UIApplication.sharedApplication.keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
}

@end
