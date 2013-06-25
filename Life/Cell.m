#import "Cell.h"

@implementation Cell

@synthesize r;
@synthesize g;
@synthesize b;
@synthesize alive;
@synthesize color;

- (id)init {
    self = [super init];
    if (self) {
        self.alive = NO;
        self.color = [UIColor randomColor];
    }
    return self;
}

@end
