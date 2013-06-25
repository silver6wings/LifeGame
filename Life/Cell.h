#import <UIKit/UIKit.h>
#import "UIColor-Random.h"

@interface Cell : NSObject {
    int r;//age
    int g;//brood
    int b;//strength
    BOOL alive;
    UIColor * color;
}

@property int r;
@property int g;
@property int b;
@property BOOL alive;
@property (nonatomic,retain) UIColor * color;

@end
