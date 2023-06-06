//
//  WKApplication+Category.m
//  CenteredClock Watch App
//
//  Created by Jinwoo Kim on 6/6/23.
//

#import "WKApplication+Category.h"
#import <objc/runtime.h>
#import <objc/message.h>
#import <dlfcn.h>

static PUICStatusBarPlacement _statusBarPlacement = PUICStatusBarPlacementCentered;

void setStatusBarPlacement(PUICStatusBarPlacement statusBarPlacement) {
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

static PUICStatusBarPlacement custom_UIViewController_puic_statusBarPlacement(id self, SEL _cmd) {
    return _statusBarPlacement;
};

@implementation WKApplication (Category)

+ (void)load {
    Method original = class_getInstanceMethod(NSClassFromString(@"UIViewController"), NSSelectorFromString(@"puic_statusBarPlacement"));
    method_setImplementation(original, (IMP)custom_UIViewController_puic_statusBarPlacement);
    
    void *handle = dlopen("/System/Library/PrivateFrameworks/PepperUICore.framework/PepperUICore", RTLD_NOW);
    _NSStringFromPUICStatusBarPlacement = dlsym(handle, "NSStringFromPUICStatusBarPlacement");
}

@end
