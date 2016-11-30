

#import <UIKit/UIKit.h>

#define kNavButtonWidth2Letter          50.0 // 48.0
#define kNavButtonWidth4Letter      70.0 // 75.0
#define kNavButtonWidth3Letter     60.0 // 60.0
#define kNavButtonHeight         44.0 // 30.0
#define kLeftBackButtonImageSize        CGSizeMake(13, 25) // 默认图片的高度

@interface NavBarButton : UIButton

+ (NavBarButton *)createBackButton;

+ (NavBarButton *)createLeftButton:(NSString *)title;

+ (NavBarButton *)createLeftButton:(NSString *)title withImage:(NSString *)imgName;

+ (NavBarButton *)createRightButton:(NSString *)title;

+ (NavBarButton *)createRightButton:(NSString *)title withImage:(NSString *)imgName;

@end

