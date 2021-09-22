//
//  Star.h
//  StarView
//
//  Created by Tuğçe Arar on 20.09.2021.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum {
    S, B
}SSize;



@interface Star : NSObject

@property (nonatomic,assign) SSize StarSize;

-(id) initWithProperties:(SSize) size;
@end

NS_ASSUME_NONNULL_END

