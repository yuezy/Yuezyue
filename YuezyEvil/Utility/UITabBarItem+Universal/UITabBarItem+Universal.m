

#import "UITabBarItem+Universal.h"

@implementation UITabBarItem (Universal)

+ (instancetype)itemWithTitle:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage
{
    UITabBarItem *tabBarItem = nil;

    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
    tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:image selectedImage:selectedImage];
    
    [tabBarItem setTitlePositionAdjustment:UIOffsetMake(0.0, -2.0)];

    return tabBarItem;
}

@end
