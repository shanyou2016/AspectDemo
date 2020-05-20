//
//  configuration.h
//  ug
//
//  Created by ug on 2019/4/30.
//  Copyright © 2019 ug. All rights reserved.
//

#ifndef configuration_h
#define configuration_h

#import <Foundation/Foundation.h>



#ifdef DEBUG
#define NSLog(format, ...) printf("\n%s HHLog %s(line%d) %s\n%s\n\n", __TIME__, [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, __PRETTY_FUNCTION__, [[NSString stringWithFormat:(format), ##__VA_ARGS__] UTF8String])
//NSLog输出日志不全的解决方法 https://www.jianshu.com/p/287ad5861ff4
#define HJSonLog(...) printf("%f %s\n",[[NSDate date]timeIntervalSince1970],[[NSString stringWithFormat:__VA_ARGS__]UTF8String]);

#else
#define NSLog(format, ...)
#define HJSonLog(format, ...)
#endif



#define CMMETHOD_BEGIN
#define CMMETHOD_BEGIN_C(v)
#define CMMETHOD_BEGIN_O(v)
#define CMMETHOD_END
#define CMMETHOD_END_C(v)
#define CMMETHOD_END_O(v)

//#define CMMETHOD_BEGIN          (NSLog(@"%s.begin", __func__))
//#define CMMETHOD_BEGIN_C(v)     (NSLog(@"%s.begin, param: %ld", __func__, (long)v))
//#define CMMETHOD_BEGIN_O(v)     (NSLog(@"%s.begin, param: %@", __func__, v))
//#define CMMETHOD_END            (NSLog(@"%s.end", __func__))
//#define CMMETHOD_END_C(v)       (NSLog(@"%s.end, result: %ld", __func__, (long)v), v)
//#define CMMETHOD_END_O(v)       (NSLog(@"%s.end, result: %@", __func__, v), v)

#define WeakSelf __weak typeof(self) weakSelf = self;
#define StrongSelf __strong typeof(weakSelf) strongSelf = weakSelf;

#define UGScreenW [UIScreen mainScreen].bounds.size.width
#define UGScerrnH [UIScreen mainScreen].bounds.size.height
/*
 *判断设备是不是苹果X
 */
//判断是否是ipad
#define isPad ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
//判断iPhone4系列
#define kiPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhone5系列
#define kiPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhone6 6s 7系列
#define kiPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhone6p 6sp 7p系列
#define kiPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhoneX，Xs（iPhoneX，iPhoneXs）
#define IS_IPHONE_X ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhoneXr
#define IS_IPHONE_Xr ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iPhoneXsMax
#define IS_IPHONE_Xs_Max ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size)&& !isPad : NO)
//判断iPhoneX所有系列
//#define IS_PhoneXAll (IS_IPHONE_X || IS_IPHONE_Xr || IS_IPHONE_Xs_Max)
#define IS_PhoneXAll \
({BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\
(isPhoneX);})
#define k_Height_NavContentBar 44.0f
#define k_Height_NavBar (IS_PhoneXAll ? 88.0 : 64.0)//导航栏
#define k_Height_StatusBar (IS_PhoneXAll? 44.0 : 20.0)//状态栏
#define k_Height_TabBar (IS_PhoneXAll ? 83.0 : 49.0)//标签栏的高度
#define IPHONE_SAFEBOTTOMAREA_HEIGHT (IS_PhoneXAll ? 34 : 0)//安全的底部区域
#define IPHONE_TOPSENSOR_HEIGHT      (IS_PhoneXAll ? 32 : 0)//高级传感器

#define UGRGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0] ///< 用10进制表示颜色，例如（255,255,255）黑色
#define RGBA(_R,_G,_B,_A) \
[UIColor colorWithRed:((_R) / 255.0) green:((_G) / 255.0) blue:((_B) / 255.0) alpha:_A]

#define kUIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define UGRandomColor UGRGBColor(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255))

#define UGGreenColor UGRGBColor(105,172,91)
#define UGBlueColor UGRGBColor(76,150,236)
#define UGTextColor UGRGBColor(165,135,91)


#endif /* configuration_h */
