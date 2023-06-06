//
//  UIViewController+Category.m
//  CenteredClock Watch App
//
//  Created by Jinwoo Kim on 6/6/23.
//

#import "UIViewController+Category.h"
#import <objc/runtime.h>
#import <objc/message.h>

static NSUInteger _statusBarPlacement = 0;

void setStatusBarPlacement(NSUInteger statusBarPlacement) {
    _statusBarPlacement = statusBarPlacement;
    
    id application = ((id (*)(id, SEL))objc_msgSend)(NSClassFromString(@"PUICApplication"), NSSelectorFromString(@"sharedPUICApplication"));
    NSArray *connectedScenes = ((NSArray * (*)(id, SEL))objc_msgSend)(application, NSSelectorFromString(@"connectedScenes"));
    __block id _Nullable windowScene;
    [connectedScenes enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (![obj isKindOfClass:NSClassFromString(@"UIWindowScene")]) return;
        NSInteger activationState = ((NSInteger (*)(id, SEL))objc_msgSend)(obj, NSSelectorFromString(@"activationState"));
        if (activationState == 0) {
            windowScene = obj;
            *stop = YES;
        }
    }];
    
    id statusBarManager = ((id (*)(id, SEL))objc_msgSend)(windowScene, NSSelectorFromString(@"statusBarManager"));
    ((void (*)(id, SEL, id))objc_msgSend)(statusBarManager, NSSelectorFromString(@"_updateStatusBarAppearanceSceneSettingsWithAnimationParameters:"), nil);
}

static NSUInteger custom_UIViewController_puic_statusBarPlacement(id self, SEL _cmd) {
    return _statusBarPlacement;
};

@implementation UIImage (Category)

+ (void)load {
    Method original = class_getInstanceMethod(NSClassFromString(@"UIViewController"), NSSelectorFromString(@"puic_statusBarPlacement"));
    method_setImplementation(original, (IMP)custom_UIViewController_puic_statusBarPlacement);
}

@end
