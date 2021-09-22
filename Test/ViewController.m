//
//  ViewController.m
//  Test
//
//  Created by Tuğçe Arar on 20.09.2021.
//

#import "ViewController.h"
#import "StarFramework/CustomWebView.h"
#import "StarFramework/Star.h"

@interface ViewController ()
 


@end

@implementation ViewController

CustomWebView *sw;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler
{
      NSString *url = [NSString stringWithFormat:@"%@",navigationAction.request.URL.absoluteString];
      BOOL httpRequest = [url containsString:@"https"];
      if (navigationAction.navigationType == WKNavigationTypeLinkActivated && httpRequest) {
        [[UIApplication sharedApplication] canOpenURL:navigationAction.request.URL];
        decisionHandler(WKNavigationActionPolicyCancel);
      } else {
        decisionHandler(WKNavigationActionPolicyAllow);
      }
}
- (void) test {
   
    //Star *star =[[Star alloc] initWithProperties:1 brighteness:1 color:UIColor.redColor];
    //[cass evident:star];
    
}
- (void) setupUI {
    
    //main View
    UIStackView *stackView = [[UIStackView alloc] init];

    stackView.axis = UILayoutConstraintAxisVertical;
    stackView.distribution = UIStackViewDistributionEqualSpacing;
    stackView.alignment = UIStackViewAlignmentFill;
    stackView.spacing = 30;

    
    
    //CustomWebView
    sw = [[CustomWebView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    [sw.heightAnchor constraintEqualToConstant:300].active = true;
    [sw.widthAnchor constraintEqualToConstant:300].active = true;
    

    //SmallStar Button
    UIButton *smallStar = [UIButton buttonWithType:UIButtonTypeSystem];
    [smallStar setTitle:@"Small Star" forState:UIControlStateNormal];
    [smallStar sizeToFit];
    [smallStar.heightAnchor constraintEqualToConstant:80].active = true;
    [smallStar.widthAnchor constraintEqualToConstant:100].active = true;
    smallStar.backgroundColor=UIColor.systemPinkColor;
    smallStar.tintColor=UIColor.whiteColor;
    [smallStar addTarget:self action:@selector(smallStarClicked:)
         forControlEvents:UIControlEventTouchUpInside];
    
   
    //BigStar Button
    UIButton *bigStar = [UIButton buttonWithType:UIButtonTypeSystem];
    [bigStar setTitle:@"Big Star" forState:UIControlStateNormal];
    [bigStar sizeToFit];
    [bigStar.heightAnchor constraintEqualToConstant:80].active = true;
    [bigStar.widthAnchor constraintEqualToConstant:100].active = true;
    bigStar.backgroundColor=UIColor.purpleColor;
    bigStar.tintColor=UIColor.whiteColor;
    [bigStar addTarget:self action:@selector(bigStarClicked:)
         forControlEvents:UIControlEventTouchUpInside];
    
    //Horizontal View
    UIStackView *horizontalView = [[UIStackView alloc] init];

    horizontalView.axis = UILayoutConstraintAxisHorizontal;
    horizontalView.distribution = UIStackViewDistributionEqualSpacing;
    horizontalView.alignment = UIStackViewAlignmentCenter;
    horizontalView.spacing = 20;
    
   
    //Vertical View
    UIStackView *verticalView = [[UIStackView alloc] init];

    verticalView.axis = UILayoutConstraintAxisVertical;
    verticalView.distribution = UIStackViewDistributionEqualSpacing;
    verticalView.alignment = UIStackViewAlignmentCenter;
    verticalView.spacing = 30;

    [horizontalView addArrangedSubview:smallStar];
    [horizontalView addArrangedSubview:bigStar];
    [stackView addArrangedSubview:sw];
    [verticalView addArrangedSubview:stackView];
    [verticalView addArrangedSubview:horizontalView];
    

    verticalView.translatesAutoresizingMaskIntoConstraints = false;
    [self.view addSubview:verticalView];


    //Layout for Stack View
    [verticalView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = true;
    [verticalView.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = true;
}


- (void)smallStarClicked:(UIButton *)button {
  
    Star *smallStar =[[Star alloc] initWithProperties:0];
    [sw addStarInterface:smallStar];
    
       
}

- (void)bigStarClicked:(UIButton *)button {
    Star *bigStar =[[Star alloc] initWithProperties:1];
    [sw addStarInterface:bigStar];
}


@end
