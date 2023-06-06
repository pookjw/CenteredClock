//
//  UIViewController+Category.h
//  CenteredClock Watch App
//
//  Created by Jinwoo Kim on 6/6/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, PUICStatusBarPlacement) {
    PUICStatusBarPlacementTrailing,
    PUICStatusBarPlacementCenter
};

void setStatusBarPlacement(PUICStatusBarPlacement statusBarPlacement);

@interface UIImage (Category)
@end

NS_ASSUME_NONNULL_END
