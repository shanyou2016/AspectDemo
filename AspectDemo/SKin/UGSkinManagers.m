//
//  UGSkinManagers.m
//  abcc4
//
//  Created by fish on 2019/11/1.
//  Copyright © 2019 fish. All rights reserved.
//

#import "UGSkinManagers.h"

#define SkinAlpha 0.99


@implementation UGSkinManagers



static UGSkinManagers *__currentSkin1 = nil;    // 当前皮肤




#pragma mark - 色值

//根据hexString 获取 颜色，可以使用2个的颜色生成渐变色
+(UIColor *)color:(NSString *)hexString{
    NSMutableArray <UIColor *> *colors = @[].mutableCopy;
    for (NSString *hs in [hexString componentsSeparatedByString:@","]) {
        [colors addObject:[UIColor colorWithHexString:hs]];
    }
    if (colors.count > 1) {
        UIColor *c = [UIColor colorWithPatternImage:[UIImage gradientImageWithBounds:[UIScreen mainScreen].bounds andColors:colors andGradientType:GradientDirectionLeftToRight]];
        c.cc_userInfo[@"color"] = [hexString componentsSeparatedByString:@","].firstObject;
        c.cc_userInfo[@"endColor"] = [hexString componentsSeparatedByString:@","].lastObject;
        return c;
    } else {
        UIColor *c = colors.firstObject;
        c.cc_userInfo[@"color"] = hexString;
        return c;
    }
}

+ (NSDictionary<NSString *,UGSkinManagers *> *)allSkin {
    static NSDictionary <NSString *, UGSkinManagers *>*__dict = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{


        // 渐变色有多个色值，用英文逗号隔开
        __dict = @{
            //经典 1蓝色  #ADC8D7
            @"1":({
                UGSkinManagers *sm = [UGSkinManagers new];
                sm.skitType                 = @"经典";
                sm.skitString               = @"经典 1蓝色";
                sm.bgColor                  = [UGSkinManagers color:@"7F9493,5389B3"];
               
                sm;
            }),
            //经典 2红色
            @"2":({
                UGSkinManagers *sm = [UGSkinManagers new];
                sm.skitType                 = @"经典";
                sm.skitString               = @"经典 2红色";
                sm.bgColor                  = [UGSkinManagers color:@"d19885,904a6e" ];
              
                sm;
            }),
            //经典 3褐色
            @"3":({
                UGSkinManagers *sm = [UGSkinManagers new];
                sm.skitType                 = @"经典";
                sm.skitString               = @"经典 3褐色";
                sm.bgColor                  =[UGSkinManagers color:@"B48A46,8A5C3E" ];
              
                sm;
            }),
            //经典 4绿色
            @"4":({
                UGSkinManagers *sm = [UGSkinManagers new];
                sm.skitType                 = @"经典";
                sm.skitString               = @"经典 4绿色";
                sm.bgColor                  = [UGSkinManagers color:@"78BC67,4DB48B" ];
               
                sm;
            }),
            //经典 5褐色
            @"5":({
                UGSkinManagers *sm = [UGSkinManagers new];
                sm.skitType                 = @"经典";
                sm.skitString               = @"经典 5褐色";
                sm.bgColor                  = [UGSkinManagers color:@"913D3E,EAAD72" ];
               
                sm;
            }),
            //经典 6淡蓝色
            @"6":({
                UGSkinManagers *sm = [UGSkinManagers new];
                sm.skitType                 = @"经典";
                sm.skitString               = @"经典 6淡蓝色";
                sm.bgColor                  = [UGSkinManagers color:@"61A8B4,C7F3E5" ];
               
                sm;
            }),
           

        };
        
        __currentSkin1 = __dict[@"1"];
    });
    return __dict;
}


#pragma mark - 对外开放的函数
+ (UGSkinManagers *)currentSkin {
    if (!__currentSkin1) {
        [UGSkinManagers allSkin];
    }
    return __currentSkin1;
}

+ (UGSkinManagers *)next {
    NSArray *keys = [[UGSkinManagers allSkin] keysSortedByValueUsingComparator:^NSComparisonResult(UGSkinManagers *obj1, UGSkinManagers *obj2) {
        return [obj1.skitString compare:obj2.skitString];
    }];
    NSInteger i = [keys indexOfObject:[[UGSkinManagers allSkin] allKeysForObject:Skin1].firstObject] + keys.count;
    return [UGSkinManagers allSkin][keys[++i%keys.count]];
}

- (void)useSkin {
    if (self == __currentSkin1) {
        return;
    }
    __currentSkin1 = self;

}

+ (UIColor *)randomThemeColor {
#define UIColorTheme1 UGRGBColor(239, 83, 98) // Grapefruit
#define UIColorTheme2 UGRGBColor(254, 109, 75) // Bittersweet
#define UIColorTheme3 UGRGBColor(255, 207, 71) // Sunflower
#define UIColorTheme4 UGRGBColor(159, 214, 97) // Grass
#define UIColorTheme5 UGRGBColor(63, 208, 173) // Mint
#define UIColorTheme6 UGRGBColor(49, 189, 243) // Aqua
#define UIColorTheme7 UGRGBColor(90, 154, 239) // Blue Jeans
#define UIColorTheme8 UGRGBColor(172, 143, 239) // Lavender
#define UIColorTheme9 UGRGBColor(238, 133, 193) // Pink Rose
#define UIColorTheme10 UGRGBColor(39, 192, 243) // Dark
	
	static NSArray<UIColor *> *themeColors = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		themeColors = @[
			UIColorTheme1,
			UIColorTheme2,
			UIColorTheme3,
			UIColorTheme4,
			UIColorTheme5,
			UIColorTheme6,
			UIColorTheme7,
			UIColorTheme8,
			UIColorTheme9,
			UIColorTheme10];
	});
	return themeColors[arc4random() % themeColors.count];
}


@end
