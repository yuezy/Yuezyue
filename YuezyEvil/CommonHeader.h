//
//  CommonHeader.h
//  YuezyEvil
//
//  Created by ZhangYue on 2016/11/30.
//  Copyright © 2016年 yuezy. All rights reserved.
//

#ifndef CommonHeader_h
#define CommonHeader_h

#import "Masonry.h"
#import <ChameleonFramework/Chameleon.h>
#import "MBProgressHUD.h"
#import "UIView+Toast.h"

#define kNavigationBarHeight (44.0)

#define kDeviceWidth        [UIScreen mainScreen].bounds.size.width      // 界面宽度
#define kDeviceHeight       [UIScreen mainScreen].bounds.size.height     // 界面高度

#define IOS_VERSION         [[[UIDevice currentDevice] systemVersion] floatValue]

#define IOS_VERSION_MIN_REQUIRED_7  ([[[UIDevice currentDevice] systemVersion] doubleValue] >= 7.0)

#ifdef DEBUG
#   define LOG(...) NSLog(__VA_ARGS__)
#else
#   define LOG(...);
#endif

/**
 * font
 * 定义常用字符串新的命名新规则：k（常量），HelveticaNeue_Bold（字型），20（字号）
 */

// 英文
#define kHelveticaNeue_10           [UIFont fontWithName:@"HelveticaNeue" size:10.0]
#define kHelveticaNeue_11           [UIFont fontWithName:@"HelveticaNeue" size:11.0]
#define kHelveticaNeue_13           [UIFont fontWithName:@"HelveticaNeue" size:13.0]
#define kHelveticaNeue_14           [UIFont fontWithName:@"HelveticaNeue" size:14.0]
#define kHelveticaNeue_15           [UIFont fontWithName:@"HelveticaNeue" size:15.0]
#define kHelveticaNeue_16           [UIFont fontWithName:@"HelveticaNeue" size:16.0]
#define kHelveticaNeue_17           [UIFont fontWithName:@"HelveticaNeue" size:17.0]
#define kHelveticaNeue_23           [UIFont fontWithName:@"HelveticaNeue" size:23.0]
#define kHelveticaNeue_25           [UIFont fontWithName:@"HelveticaNeue" size:25.0]
#define kHelveticaNeue_Bold_21      [UIFont fontWithName:@"HelveticaNeue-Bold" size:21.0]
#define kHelveticaNeue_Bold_30      [UIFont fontWithName:@"HelveticaNeue-Bold" size:30.0]

// 中文
#define kSTHeitiSC_10               [UIFont fontWithName:@"STHeitiSC-Light" size:10.0]
#define kSTHeitiSC_11               [UIFont fontWithName:@"STHeitiSC-Light" size:11.0]
#define kSTHeitiSC_12               [UIFont fontWithName:@"STHeitiSC-Light" size:12.0]
#define kSTHeitiSC_13               [UIFont fontWithName:@"STHeitiSC-Light" size:13.0]
#define kSTHeitiSC_14               [UIFont fontWithName:@"STHeitiSC-Light" size:14.0]
#define kSTHeitiSC_15               [UIFont fontWithName:@"STHeitiSC-Light" size:15.0]
#define kSTHeitiSC_16               [UIFont fontWithName:@"STHeitiSC-Light" size:16.0]
#define kSTHeitiSC_17               [UIFont fontWithName:@"STHeitiSC-Light" size:17.0]
#define kSTHeitiSC_20               [UIFont fontWithName:@"STHeitiSC-Light" size:20.0]
#define kSTHeitiSC_25               [UIFont fontWithName:@"STHeitiSC-Light" size:25.0]

#define kSTHeitiSC_Medium_14        [UIFont fontWithName:@"STHeitiSC-Medium" size:14.0]
#define kSTHeitiSC_Medium_16        [UIFont fontWithName:@"STHeitiSC-Medium" size:16.0]
#define kSTHeitiSC_Medium_17        [UIFont fontWithName:@"STHeitiSC-Medium" size:17.0]
#define kSTHeitiSC_Medium_18        [UIFont fontWithName:@"STHeitiSC-Medium" size:18.0]
#define kSTHeitiSC_Medium_20        [UIFont fontWithName:@"STHeitiSC-Medium" size:20.0]
#endif /* CommonHeader_h */
