//
//  WKApplication+Category.h
//  CenteredClock Watch App
//
//  Created by Jinwoo Kim on 6/6/23.
//

#import <WatchKit/WatchKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, PUICStatusBarPlacement) {
    PUICStatusBarPlacementTrailing = 0,
    PUICStatusBarPlacementCentered = 1 << 0
};

NSString * _Nonnull (* _Nonnull _NSStringFromPUICStatusBarPlacement)(PUICStatusBarPlacement);
void setStatusBarPlacement(PUICStatusBarPlacement statusBarPlacement);

@interface WKApplication (Category)
@end

NS_ASSUME_NONNULL_END
