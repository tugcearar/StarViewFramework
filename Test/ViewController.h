//
//  ViewController.h
//  Test
//
//  Created by Tuğçe Arar on 20.09.2021.
//

#import <UIKit/UIKit.h>
#import <StarFramework/StarFramework.h>
#import <WebKit/WebKit.h>

@interface ViewController : UIViewController<WKNavigationDelegate>

//@property (strong, nonatomic) CustomWebView *starView;
@property (strong, nonatomic) UIStackView *stackView;

@end

