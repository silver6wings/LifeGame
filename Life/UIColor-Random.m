#import "UIColor-Random.h"


@implementation UIColor(Random)

+(UIColor *)randomColor
{
    CGFloat red = (arc4random()%100)/100.0f;
    CGFloat blue = (arc4random()%100)/100.0f;
    CGFloat green = (arc4random()%100)/100.0f;
    
    return [UIColor colorWithRed:red 
                           green:green 
                            blue:blue 
                           alpha:1.0f];
}

@end
