#import "Cell.h"

@implementation Cell

@synthesize color;

- (id)init {
    self = [super init];
    if (self) {
        self.color = [UIColor randomColor];
    }
    return self;
}

@end
