#import "LifeView.h"
#import "UIColor-Random.h"

@implementation LifeView

-(void)evolve{
    Cell * tempCell[CELL_HMAX][CELL_VMAX];
    
    // Simulate the next evolve
    for (int i = 0; i <= CELL_HMAX-1; i++) {
        tempCell[i][0] = cell[i][CELL_VMAX-1];
        for (int j = 1; j <= CELL_VMAX-1; j++) {
            tempCell[i][j] = cell[i][j-1];
        }
    }
    
    
    // Move the next generation map back
    for (int i = 0; i <= CELL_HMAX-1; i++) {
        for (int j = 0; j <= CELL_VMAX-1; j++) {
            cell[i][j] = tempCell[i][j];
        }
    }
    
    // Show generation at Console
    printf("%d ",generation);
    generation++;
    
    // Draw map
    [self setNeedsDisplay];
}

-(IBAction)barButtonClicked:(id)sender{
    
    // Change button state
    LifeViewController * lfvc = (LifeViewController * )sender;
        
    
    
    // Control Timer
    if(myTimer == nil){
        myTimer = [NSTimer scheduledTimerWithTimeInterval:EVOLVE_INTERVAL 
                                                   target:self
                                                 selector:@selector(evolve) 
                                                 userInfo:nil 
                                                  repeats:YES];
        [[lfvc barButton]setTitle:@"Pause"];
    }else{
        if([myTimer isValid]){
            [myTimer invalidate];
            myTimer = nil;
        }
        [[lfvc barButton]setTitle:@"Play"];
    }
    
    
}

//====== system ======

-(id)initWithCoder:(NSCoder *)coder{
    self = [super initWithCoder:coder];
    if (self) {    
        for (int i = 0; i <= CELL_HMAX-1; i++) {
            for (int j=0; j <= CELL_VMAX-1; j++) {
                cell[i][j] = [[Cell alloc] init];
            }
        }
    }            
    NSLog(@"%d",generation);
    generation = 0;
    
    return self;
}

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
    NSLog(@"LifeView initWithFrame");
}



- (void)dealloc{
    for (int i = 0; i <= CELL_HMAX-1; i++) {
        for (int j=0; j <= CELL_VMAX-1; j++) {
            [cell[i][j] release];
        }
    }
    [myTimer invalidate];
    [super dealloc];
}

//====== event ======


-(void)drawRect:(CGRect)rect{
    CGContextRef context = UIGraphicsGetCurrentContext();        
    CGContextSetLineWidth(context, 1.0);
    
    UIColor * color;
    
    // Drawing process
    for (int i = 0; i <= CELL_HMAX-1; i++) {
        for (int j = 0; j <= CELL_VMAX-4; j++) {
            if(cell[i][j].alive == YES){
                color = cell[i][j].color;
                CGContextSetStrokeColorWithColor(context, color.CGColor);
                CGContextSetFillColorWithColor(context, color.CGColor);
                CGContextAddEllipseInRect(context, CGRectMake(i*CELL_SIZE+1, j*CELL_SIZE+1, CELL_SIZE-2, CELL_SIZE-2));
                CGContextDrawPath(context, kCGPathFillStroke);
            }
        }
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    CGPoint touchPoint = [[touches anyObject] locationInView:self];
    int x = touchPoint.x / CELL_SIZE;
    int y = touchPoint.y / CELL_SIZE;
    cell[x][y].alive = YES;
    
    [self setNeedsDisplay];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    [self touchesBegan:touches withEvent:event];
}

@end
