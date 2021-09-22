//
//  CustomWebView.h
//  StarFramework
//
//  Created by Tuğçe Arar on 20.09.2021.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>
#import <UIKit/UIKit.h>
#import <StarFramework/Star.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomWebView : UIView

- (void) addStarInterface:(Star *) star;
@end

NS_ASSUME_NONNULL_END
